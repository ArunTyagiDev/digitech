@extends('layouts.app')

@section('content')
<div class="max-w-4xl mx-auto py-8 px-4">
    <h1 class="text-2xl font-semibold text-gray-100 mb-6">Edit Product</h1>
    <form method="post" action="{{ route('admin.products.update', $product) }}" enctype="multipart/form-data" class="space-y-4">
        @csrf
        @method('PUT')
        <div>
            <label class="block text-sm text-gray-300">Category</label>
            <select name="category_id" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 border border-brand-gray-700 rounded px-3 py-2">
                @foreach($categories as $category)
                    <option value="{{ $category->id }}" @selected(old('category_id', $product->category_id)===$category->id)>{{ $category->name }}</option>
                @endforeach
            </select>
        </div>
        <div>
            <label class="block text-sm text-gray-300">Name</label>
            <input name="name" value="{{ old('name', $product->name) }}" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-500 dark:placeholder-gray-400 border border-brand-gray-700 rounded px-3 py-2" />
        </div>
        <div>
            <label class="block text-sm text-gray-300">Slug</label>
            <input name="slug" value="{{ old('slug', $product->slug) }}" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-500 dark:placeholder-gray-400 border border-brand-gray-700 rounded px-3 py-2" />
        </div>
        <div class="grid sm:grid-cols-3 gap-4">
            <div>
                <label class="block text-sm text-gray-300">SKU</label>
                <input name="sku" value="{{ old('sku', $product->sku) }}" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-500 dark:placeholder-gray-400 border border-brand-gray-700 rounded px-3 py-2" />
            </div>
            <div>
                <label class="block text-sm text-gray-300">Price</label>
                <input name="price" value="{{ old('price', $product->price) }}" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-500 dark:placeholder-gray-400 border border-brand-gray-700 rounded px-3 py-2" />
            </div>
            <div class="flex items-end gap-4">
                <label class="inline-flex items-center gap-2 text-sm text-gray-300">
                    <input type="checkbox" name="is_featured" value="1" @checked(old('is_featured', $product->is_featured)) class="rounded bg-brand-gray-800 border-brand-gray-700"> Featured
                </label>
                <label class="inline-flex items-center gap-2 text-sm text-gray-300">
                    <input type="checkbox" name="is_active" value="1" @checked(old('is_active', $product->is_active)) class="rounded bg-brand-gray-800 border-brand-gray-700"> Active
                </label>
            </div>
        </div>
        <div>
            <label class="block text-sm text-gray-300">Short Description</label>
            <textarea name="short_description" rows="3" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-500 dark:placeholder-gray-400 border border-brand-gray-700 rounded px-3 py-2">{{ old('short_description', $product->short_description) }}</textarea>
        </div>
        <div>
            <label class="block text-sm text-gray-300">Description</label>
            <textarea name="description" rows="6" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-500 dark:placeholder-gray-400 border border-brand-gray-700 rounded px-3 py-2">{{ old('description', $product->description) }}</textarea>
        </div>
        <div>
            <label class="block text-sm text-gray-300">Add Image</label>
            <input type="file" name="image" class="w-full mt-1" />
            @if($product->images->count())
                <div class="mt-3 grid grid-cols-6 gap-2">
                    @foreach($product->images as $img)
                        <img src="{{ asset('storage/'.$img->path) }}" class="w-full aspect-square object-cover rounded border border-brand-gray-800" />
                    @endforeach
                </div>
            @endif
        </div>
        <div>
            <button class="px-5 py-3 bg-yellow-400 text-black rounded">Save Changes</button>
        </div>
    </form>
</div>
@endsection

