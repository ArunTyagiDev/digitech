<?php

namespace App\Console\Commands;

use App\Models\Banner;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Symfony\Component\DomCrawler\Crawler;
use GuzzleHttp\Client;

class ImportDigitek extends Command
{
	/**
	 * The name and signature of the console command.
	 *
	 * @var string
	 */
	protected $signature = 'digitek:import {--start-url=https://www.digitek.net.in/} {--type=all : all|products|banners} {--limit=40}';

	/**
	 * The console command description.
	 *
	 * @var string
	 */
	protected $description = 'Import products (name, price, images) and homepage banner video/images from digitek.net.in';

	private Client $http;

	public function __construct()
	{
		parent::__construct();
		$this->http = new Client([
			'timeout' => 20,
			'headers' => [
				'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome Safari',
				'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
			],
		]);
	}

	public function handle(): int
	{
		$startUrl = (string) $this->option('start-url');
		$type = (string) $this->option('type');
		$limit = (int) $this->option('limit');

		if ($type === 'all' || $type === 'products') {
			$this->importProducts($startUrl, $limit);
		}

		if ($type === 'all' || $type === 'banners') {
			$this->importBanners($startUrl);
		}

		return self::SUCCESS;
	}

	private function fetch(string $url): string
	{
		$this->info("GET {$url}");
		$res = $this->http->get($url);
		return (string) $res->getBody();
	}

	private function collectProductLinks(string $startUrl, int $limit): array
	{
		$queue = [ $startUrl ];
		$visited = [];
		$productLinks = collect();
		$depth = 0;
		$maxDepth = 2; // start + collections pages

		while (!empty($queue) && $productLinks->count() < $limit && $depth <= $maxDepth) {
			$url = array_shift($queue);
			if (isset($visited[$url])) { continue; }
			$visited[$url] = true;
			
			try {
				$html = $this->fetch($url);
				$crawler = new Crawler($html, $url);
				// collect product detail links
				$foundProducts = collect($crawler->filter('a')->each(fn($a) => $a->link()->getUri()))
					->filter(fn($href) => is_string($href) && str_contains($href, '/products/'))
					->map(fn($href) => strtok($href, '#'))
					->unique();
				$productLinks = $productLinks->merge($foundProducts)->unique();

				if ($productLinks->count() >= $limit) { break; }

				// also enqueue collections/listing pages for shallow crawl
				$listingLinks = collect($crawler->filter('a')->each(fn($a) => $a->link()->getUri()))
					->filter(function ($href) {
						return is_string($href) && (
							str_contains($href, '/collections') ||
							str_contains($href, '/collection') ||
							str_contains($href, '/camera') ||
							str_contains($href, '/mobile')
						);
					})
					->map(fn($href) => strtok($href, '#'))
					->unique()
					->values();

				foreach ($listingLinks as $l) {
					if (!isset($visited[$l]) && count($queue) < 50) { $queue[] = $l; }
				}
			} catch (\Throwable $e) {
				$this->warn('Collect failed: '.$e->getMessage());
			}

			$depth++;
		}

		return $productLinks->take($limit)->values()->all();
	}

	private function importProducts(string $startUrl, int $limit): void
	{
		$links = $this->collectProductLinks($startUrl, $limit);
		if (empty($links)) {
			$this->warn('No product links found.');
			return;
		}

		$category = Category::firstOrCreate(['slug' => 'imported'], ['name' => 'Imported', 'is_active' => true]);

		foreach ($links as $link) {
			try {
				$this->importSingleProduct((string) $link, $category->id);
			} catch (\Throwable $e) {
				$this->error('Product import failed: '.$e->getMessage());
			}
		}
	}

	private function importSingleProduct(string $url, int $categoryId): void
	{
		$html = $this->fetch($url);
		$crawler = new Crawler($html, $url);

		// Prefer JSON-LD Product data
		$ldJsonBlocks = $crawler->filter('script[type="application/ld+json"]')->each(fn($n) => $n->text());
		$name = null;
		$price = null;
		$sku = null;
		$images = [];
		$description = null;

		foreach ($ldJsonBlocks as $block) {
			try {
				$data = json_decode($block, true, 512, JSON_THROW_ON_ERROR);
				if (isset($data['@type']) && $data['@type'] === 'Product') {
					$name = $data['name'] ?? $name;
					$description = $data['description'] ?? $description;
					$sku = $data['sku'] ?? $sku;
					if (isset($data['image'])) {
						$images = is_array($data['image']) ? $data['image'] : [$data['image']];
					}
					if (isset($data['offers'])) {
						$offers = is_assoc($data['offers']) ? [$data['offers']] : $data['offers'];
						$first = $offers[0] ?? null;
						$price = $first['price'] ?? $price;
					}
				}
			} catch (\Throwable $e) {
				// ignore invalid blocks
			}
		}

		// Fallbacks
		if (!$name) {
			$name = trim((string) optional($crawler->filter('h1')->first())->text('')) ?: 'Imported Product';
		}
		if (!$price) {
			// Try common price selectors
			$priceText = collect(['.price', '.price-item', '.product__price', '[data-price]'])
				->map(function ($selector) use ($crawler) {
					try { return trim($crawler->filter($selector)->first()->text('')); } catch (\Throwable) { return null; }
				})
				->filter()
				->first();
			$price = $this->parsePriceToNumber($priceText);
		}
		if (empty($images)) {
			$images = collect($crawler->filter('img')->each(fn($n) => $n->image()->getUri()))
				->filter(fn($src) => is_string($src) && !str_contains($src, 'data:'))
				->unique()
				->take(6)
				->values()
				->all();
		}

		$slug = Str::slug(Str::limit($name, 64, ''));
		$domain = parse_url($url, PHP_URL_HOST) ?: null;
		$product = Product::updateOrCreate(
			['slug' => $slug],
			[
				'category_id' => $categoryId,
				'name' => $name,
				'sku' => $sku,
				'short_description' => Str::limit((string) $description, 180),
				'description' => $description,
				'price' => is_numeric($price) ? (float) $price : null,
				'is_active' => true,
				'source_domain' => $domain,
				'source_url' => $url,
			]
		);

		// Download images
		if (!empty($images)) {
			$product->images()->delete();
			$index = 0;
			foreach ($images as $imgUrl) {
				$path = $this->downloadToPublic($imgUrl, 'products/'.$slug.'/'.sprintf('image_%02d%s', $index + 1, $this->guessExtension($imgUrl)));
				if ($path) {
					$product->images()->create([
						'path' => $path,
						'alt' => $product->name,
						'is_primary' => $index === 0,
						'sort_order' => $index,
					]);
				}
				$index++;
			}
		}

		$this->info("Imported: {$product->name} (price: ".($product->price ?? 'N/A').")");
	}

	private function importBanners(string $startUrl): void
	{
		$html = $this->fetch($startUrl);
		$crawler = new Crawler($html, $startUrl);

		// Try <video> sources for hero
		$videoSources = collect($crawler->filter('video source')->each(fn($n) => $n->getNode(0)?->getAttribute('src')))
			->merge($crawler->filter('video')->each(fn($n) => $n->getNode(0)?->getAttribute('src')))
			->filter()
			->unique()
			->take(2);

		$index = 0;
		foreach ($videoSources as $src) {
			$path = $this->downloadToPublic($src, 'banners/'.sprintf('hero_%02d%s', $index + 1, $this->guessExtension($src)));
			if ($path) {
				Banner::create([
					'title' => 'Hero Video',
					'image' => $path, // we store path; frontend can use <video> if needed
					'sort_order' => $index,
					'is_active' => true,
				]);
			}
			$index++;
		}

		// Fallback hero images (slider)
		$heroImages = collect($crawler->filter('img')->each(fn($n) => $n->image()->getUri()))
			->filter(fn($src) => is_string($src) && (str_contains($src, 'banner') || str_contains($src, 'hero'))) 
			->unique()
			->take(5)
			->values();

		foreach ($heroImages as $i => $src) {
			$path = $this->downloadToPublic($src, 'banners/'.sprintf('slide_%02d%s', $i + 1, $this->guessExtension($src)));
			if ($path) {
				Banner::create([
					'title' => 'Hero Slide',
					'image' => $path,
					'sort_order' => 10 + $i,
					'is_active' => true,
				]);
			}
		}
	}

	private function parsePriceToNumber(?string $text): ?float
	{
		if (!$text) return null;
		$txt = preg_replace('/[^0-9\.,]/', '', $text);
		$txt = str_replace([','], ['',], $txt);
		return is_numeric($txt) ? (float) $txt : null;
	}

	private function guessExtension(string $url): string
	{
		$path = parse_url($url, PHP_URL_PATH) ?: '';
		$ext = strtolower(pathinfo($path, PATHINFO_EXTENSION));
		return $ext ? ('.'.$ext) : '.jpg';
	}

	private function downloadToPublic(string $url, string $relativePath): ?string
	{
		try {
			$res = $this->http->get($url, ['stream' => true]);
			$stream = $res->getBody();
			Storage::disk('public')->put($relativePath, $stream->getContents());
			return $relativePath;
		} catch (\Throwable $e) {
			$this->warn('Download failed: '.$url.' => '.$e->getMessage());
			return null;
		}
	}
}

if (!function_exists('is_assoc')) {
	function is_assoc($arr): bool { return is_array($arr) && array_keys($arr) !== range(0, count($arr) - 1); }
}
