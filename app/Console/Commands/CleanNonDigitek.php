<?php

namespace App\Console\Commands;

use App\Models\Product;
use Illuminate\Console\Command;

class CleanNonDigitek extends Command
{
	/**
	 * The name and signature of the console command.
	 *
	 * @var string
	 */
	protected $signature = 'digitek:cleanup {--allow=digitek.net.in,www.digitek.net.in} {--force : Execute deletion}';

	/**
	 * The console command description.
	 *
	 * @var string
	 */
	protected $description = 'Delete products not sourced from the allowed domain(s).';

	/**
	 * Execute the console command.
	 */
	public function handle(): int
	{
		$allowed = collect(explode(',', (string) $this->option('allow')))
			->map(fn($d) => trim($d))
			->filter()
			->all();

		$query = Product::query()
			->whereNotNull('source_domain')
			->whereNotIn('source_domain', $allowed);

		$count = (clone $query)->count();
		if ($count === 0) {
			$this->info('No products to delete.');
			return self::SUCCESS;
		}

		$this->warn("Products to delete (source_domain NOT in [".implode(',', $allowed)."]): {$count}");

		if (! $this->option('force')) {
			$this->info('Dry-run mode (use --force to delete).');
			$sample = (clone $query)->limit(10)->get(['id','name','source_domain']);
			foreach ($sample as $row) {
				$this->line(" - #{$row->id} {$row->name} ({$row->source_domain})");
			}
			return self::SUCCESS;
		}

		$ids = (clone $query)->pluck('id');
		Product::whereIn('id', $ids)->delete();
		$this->info("Deleted {$ids->count()} product(s).");
		return self::SUCCESS;
	}
}
