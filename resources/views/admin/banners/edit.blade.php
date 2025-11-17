@extends('layouts.app')

@section('content')
<div class="max-w-3xl mx-auto py-8 px-4">
    <h1 class="text-2xl font-semibold text-gray-100 mb-6">Edit Banner</h1>
    <form method="post" action="{{ route('admin.banners.update', $banner) }}" enctype="multipart/form-data" class="space-y-4">
        @csrf
        @method('PUT')
        <div>
            <label class="block text-sm text-gray-300">Title</label>
            <input name="title" value="{{ old('title', $banner->title) }}" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-500 dark:placeholder-gray-400 border border-brand-gray-700 rounded px-3 py-2" />
        </div>
        <div>
            <label class="block text-sm text-gray-300">Subtitle</label>
            <input name="subtitle" value="{{ old('subtitle', $banner->subtitle) }}" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-500 dark:placeholder-gray-400 border border-brand-gray-700 rounded px-3 py-2" />
        </div>
        <div>
            <label class="block text-sm text-gray-300">Link URL</label>
            <input name="link_url" value="{{ old('link_url', $banner->link_url) }}" class="w-full mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 placeholder-gray-500 dark:placeholder-gray-400 border border-brand-gray-700 rounded px-3 py-2" />
            @error('link_url')<div class="text-red-400 text-sm mt-1">{{ $message }}</div>@enderror
        </div>
        <div>
            <label class="block text-sm text-gray-300">Image</label>
            <input type="file" name="image" class="w-full mt-1" />
            @if($banner->image)
                <img src="{{ asset('storage/'.$banner->image) }}" class="w-full rounded border border-brand-gray-800 mt-2" />
            @endif
        </div>
        <div class="flex items-center gap-4">
            <label class="inline-flex items-center gap-2 text-sm text-gray-300">
                <input type="checkbox" name="is_active" value="1" @checked(old('is_active', $banner->is_active)) class="rounded bg-brand-gray-800 border-brand-gray-700"> Active
            </label>
            <div>
                <label class="block text-sm text-gray-300">Sort Order</label>
                <input type="number" name="sort_order" value="{{ old('sort_order', $banner->sort_order) }}" class="w-24 mt-1 bg-white dark:bg-brand-gray-800 text-gray-900 dark:text-gray-100 border border-brand-gray-700 rounded px-3 py-2" />
            </div>
        </div>
        <div>
            <button class="px-5 py-3 bg-yellow-400 text-black rounded">Save Changes</button>
        </div>
    </form>
</div>
@endsection

