@extends('layouts.app')

@section('content')
<div class="max-w-3xl mx-auto py-8 px-4">
    <h1 class="text-2xl font-semibold text-gray-100 mb-6">New Banner</h1>
    <form method="post" action="{{ route('admin.banners.store') }}" enctype="multipart/form-data" class="space-y-4">
        @csrf
        <div>
            <label class="block text-sm text-gray-300">Title</label>
            <input name="title" value="{{ old('title') }}" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-500 dark:placeholder-gray-400 border border-brand-gray-700 rounded px-3 py-2" />
        </div>
        <div>
            <label class="block text-sm text-gray-300">Subtitle</label>
            <input name="subtitle" value="{{ old('subtitle') }}" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-500 dark:placeholder-gray-400 border border-brand-gray-700 rounded px-3 py-2" />
        </div>
        <div>
            <label class="block text-sm text-gray-300">Link URL</label>
            <input name="link_url" value="{{ old('link_url') }}" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-500 dark:placeholder-gray-400 border border-brand-gray-700 rounded px-3 py-2" />
            @error('link_url')<div class="text-red-400 text-sm mt-1">{{ $message }}</div>@enderror
        </div>
        <div>
            <label class="block text-sm text-gray-300">Image</label>
            <input type="file" name="image" class="w-full mt-1" />
            @error('image')<div class="text-red-400 text-sm mt-1">{{ $message }}</div>@enderror
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

