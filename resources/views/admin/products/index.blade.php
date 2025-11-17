@extends('layouts.app')

@section('content')
<div class="max-w-7xl mx-auto py-8 px-4">
    <div class="flex items-center justify-between mb-6">
        <h1 class="text-2xl font-semibold text-gray-100">Products</h1>
        <a href="{{ route('admin.products.create') }}" class="px-4 py-2 bg-yellow-400 text-black rounded">New Product</a>
    </div>

    @if(session('status'))
        <div class="mb-4 p-3 rounded bg-green-600/20 text-green-300 border border-green-600/30">{{ session('status') }}</div>
    @endif

    <div class="overflow-x-auto border border-brand-gray-800 rounded-xl">
        <table class="min-w-full text-sm">
            <thead>
                <tr class="bg-brand-gray-800 text-gray-300">
                    <th class="text-left px-4 py-2">Name</th>
                    <th class="text-left px-4 py-2">Category</th>
                    <th class="text-left px-4 py-2">Price</th>
                    <th class="text-left px-4 py-2">Featured</th>
                    <th class="text-left px-4 py-2">Active</th>
                    <th class="text-left px-4 py-2">Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach($products as $product)
                    <tr class="border-t border-brand-gray-800">
                        <td class="px-4 py-2">{{ $product->name }}</td>
                        <td class="px-4 py-2">{{ $product->category?->name }}</td>
                        <td class="px-4 py-2">{{ $product->price ? '₹'.number_format($product->price,2) : 'Enquiry' }}</td>
                        <td class="px-4 py-2">{{ $product->is_featured ? 'Yes' : 'No' }}</td>
                        <td class="px-4 py-2">{{ $product->is_active ? 'Yes' : 'No' }}</td>
                        <td class="px-4 py-2">
                            <a class="text-yellow-400 hover:underline mr-3" href="{{ route('admin.products.edit', $product) }}">Edit</a>
                            <form method="post" action="{{ route('admin.products.destroy', $product) }}" class="inline">
                                @csrf
                                @method('DELETE')
                                <button class="text-red-400 hover:underline" onclick="return confirm('Delete?')">Delete</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <div class="mt-6">{{ $products->links() }}</div>
</div>
@endsection

