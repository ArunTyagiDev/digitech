<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = Product::with('category')->latest()->paginate(20);
        return view('admin.products.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = Category::orderBy('name')->get();
        return view('admin.products.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'category_id' => ['required', 'exists:categories,id'],
            'name' => ['required', 'string', 'max:255'],
            'slug' => ['nullable', 'string', 'max:255', 'unique:products,slug'],
            'sku' => ['nullable', 'string', 'max:100'],
            'short_description' => ['nullable', 'string'],
            'description' => ['nullable', 'string'],
            'price' => ['nullable', 'numeric'],
            'is_featured' => ['nullable', 'boolean'],
            'is_active' => ['nullable', 'boolean'],
            'image' => ['nullable', 'image'],
        ]);
        $data = $validated;
        $data['slug'] = $validated['slug'] ?? Str::slug($validated['name']);
        $data['is_featured'] = (bool) ($validated['is_featured'] ?? false);
        $data['is_active'] = (bool) ($validated['is_active'] ?? true);

        $product = Product::create($data);

        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('products', 'public');
            $product->images()->create([
                'path' => $path,
                'is_primary' => true,
                'sort_order' => 0,
            ]);
        }

        return redirect()->route('admin.products.index')->with('status', 'Product created');
    }

    /**
     * Display the specified resource.
     */
    public function show(Product $product)
    {
        return redirect()->route('admin.products.edit', $product);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Product $product)
    {
        $categories = Category::orderBy('name')->get();
        $product->load('images');
        return view('admin.products.edit', compact('product', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $product)
    {
        $validated = $request->validate([
            'category_id' => ['required', 'exists:categories,id'],
            'name' => ['required', 'string', 'max:255'],
            'slug' => ['required', 'string', 'max:255', 'unique:products,slug,'.$product->id],
            'sku' => ['nullable', 'string', 'max:100'],
            'short_description' => ['nullable', 'string'],
            'description' => ['nullable', 'string'],
            'price' => ['nullable', 'numeric'],
            'is_featured' => ['nullable', 'boolean'],
            'is_active' => ['nullable', 'boolean'],
            'image' => ['nullable', 'image'],
        ]);
        $data = $validated;
        $data['is_featured'] = (bool) ($validated['is_featured'] ?? false);
        $data['is_active'] = (bool) ($validated['is_active'] ?? true);

        $product->update($data);

        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('products', 'public');
            $product->images()->create([
                'path' => $path,
                'is_primary' => false,
                'sort_order' => $product->images()->max('sort_order') + 1,
            ]);
        }

        return redirect()->route('admin.products.index')->with('status', 'Product updated');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {
        $product->delete();
        return redirect()->route('admin.products.index')->with('status', 'Product deleted');
    }
}
