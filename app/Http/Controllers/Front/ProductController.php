<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $categories = Category::query()->where('is_active', true)->orderBy('sort_order')->get();

        $query = Product::query()->where('is_active', true)->with('images', 'category');

        if ($categorySlug = $request->string('category')->toString()) {
            $category = Category::where('slug', $categorySlug)->first();
            if ($category) {
                $query->where('category_id', $category->id);
            }
        }

        if ($sort = $request->string('sort')->toString()) {
            match ($sort) {
                'price_asc' => $query->orderBy('price', 'asc'),
                'price_desc' => $query->orderBy('price', 'desc'),
                'newest' => $query->latest(),
                'featured' => $query->orderByDesc('is_featured'),
                default => $query->latest(),
            };
        } else {
            $query->latest();
        }

        $products = $query->paginate(12)->withQueryString();

        return view('front.products.index', compact('products', 'categories'));
    }

    public function show(string $slug)
    {
        $product = Product::where('slug', $slug)->with(['images' => fn($q) => $q->orderByDesc('is_primary')->orderBy('sort_order'), 'specifications' => fn($q) => $q->orderBy('sort_order'), 'category'])->firstOrFail();
        $related = Product::where('category_id', $product->category_id)
            ->where('id', '!=', $product->id)
            ->where('is_active', true)
            ->with('images')
            ->take(8)->get();

        return view('front.products.show', compact('product', 'related'));
    }

    public function category(string $slug)
    {
        return redirect()->route('products.index', ['category' => $slug]);
    }
}
