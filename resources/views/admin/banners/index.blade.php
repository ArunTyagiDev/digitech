@extends('layouts.app')

@section('content')
<div class="max-w-7xl mx-auto py-8 px-4">
    <div class="flex items-center justify-between mb-6">
        <h1 class="text-2xl font-semibold text-gray-100">Banners</h1>
        <a href="{{ route('admin.banners.create') }}" class="px-4 py-2 bg-yellow-400 text-black rounded">New Banner</a>
    </div>

    @if(session('status'))
        <div class="mb-4 p-3 rounded bg-green-600/20 text-green-300 border border-green-600/30">{{ session('status') }}</div>
    @endif

    <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
        @foreach($banners as $banner)
            <div class="border border-brand-gray-800 rounded-xl overflow-hidden bg-brand-gray-800/40">
                @if($banner->image)
                    <img src="{{ asset('storage/'.$banner->image) }}" class="w-full aspect-video object-cover" />
                @endif
                <div class="p-4">
                    <div class="font-medium">{{ $banner->title }}</div>
                    <div class="text-sm text-gray-400">Sort: {{ $banner->sort_order }} | {{ $banner->is_active ? 'Active' : 'Inactive' }}</div>
                    <div class="mt-3">
                        <a class="text-yellow-400 hover:underline mr-3" href="{{ route('admin.banners.edit', $banner) }}">Edit</a>
                        <form method="post" action="{{ route('admin.banners.destroy', $banner) }}" class="inline">
                            @csrf
                            @method('DELETE')
                            <button class="text-red-400 hover:underline" onclick="return confirm('Delete?')">Delete</button>
                        </form>
                    </div>
                </div>
            </div>
        @endforeach
    </div>

    <div class="mt-6">{{ $banners->links() }}</div>
</div>
@endsection

