@extends('layouts.app')

@section('content')
<div class="max-w-3xl mx-auto py-8 px-4">
    <h1 class="text-2xl font-semibold text-gray-100 mb-6">New Category</h1>
    <form method="post" action="{{ route('admin.categories.store') }}" enctype="multipart/form-data" class="space-y-4">
        @csrf
        <div>
            <label class="block text-sm text-gray-300">Name</label>
            <input name="name" value="{{ old('name') }}" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-500 dark:placeholder-gray-400 border border-brand-gray-700 rounded px-3 py-2" />
            @error('name')<div class="text-red-400 text-sm mt-1">{{ $message }}</div>@enderror
        </div>
        <div>
            <label class="block text-sm text-gray-300">Slug (optional)</label>
            <input name="slug" value="{{ old('slug') }}" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-500 dark:placeholder-gray-400 border border-brand-gray-700 rounded px-3 py-2" />
            @error('slug')<div class="text-red-400 text-sm mt-1">{{ $message }}</div>@enderror
        </div>
        <div>
            <label class="block text-sm text-gray-300">Parent</label>
            <select name="parent_id" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 border border-brand-gray-700 rounded px-3 py-2">
                <option value="">None</option>
                @foreach($parents as $parent)
                    <option value="{{ $parent->id }}">{{ $parent->name }}</option>
                @endforeach
            </select>
        </div>
        <div>
            <label class="block text-sm text-gray-300">Description</label>
            <textarea name="description" rows="4" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-500 dark:placeholder-gray-400 border border-brand-gray-700 rounded px-3 py-2">{{ old('description') }}</textarea>
        </div>
        <div>
            <label class="block text-sm text-gray-300">Image</label>
            <input type="file" name="image" class="w-full mt-1" />
        </div>
        <div class="flex items-center gap-4">
            <label class="inline-flex items-center gap-2 text-sm text-gray-300">
                <input type="checkbox" name="is_active" value="1" checked class="rounded bg-brand-gray-800 border-brand-gray-700"> Active
            </label>
            <div>
                <label class="block text-sm text-gray-300">Sort Order</label>
                <input type="number" name="sort_order" value="{{ old('sort_order', 0) }}" class="w-24 mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 border border-brand-gray-700 rounded px-3 py-2" />
            </div>
        </div>
        <div>
            <button class="px-5 py-3 bg-yellow-400 text-black rounded">Create</button>
        </div>
    </form>
</div>
@endsection

