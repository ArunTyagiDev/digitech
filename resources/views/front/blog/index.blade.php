<x-front-layout>
    <section class="max-w-7xl mx-auto px-4 py-10">
        <h1 class="text-2xl font-semibold mb-6">Articles</h1>
        <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
            @foreach($posts as $post)
                <a href="{{ route('blog.show', $post->slug) }}" class="block border border-brand-gray-800 rounded-xl overflow-hidden bg-brand-gray-800/40">
                    <div class="aspect-video bg-brand-gray-900/60">
                        @if($post->image)
                            <img src="{{ asset('storage/'.$post->image) }}" class="w-full h-full object-cover" />
                        @endif
                    </div>
                    <div class="p-4">
                        <div class="text-sm text-gray-400">{{ optional($post->published_at)->format('M d, Y') }}</div>
                        <div class="font-medium mt-1">{{ $post->title }}</div>
                        <p class="text-gray-400 mt-2 line-clamp-2">{{ $post->excerpt }}</p>
                    </div>
                </a>
            @endforeach
        </div>
        <div class="mt-8">{{ $posts->links() }}</div>
    </section>
</x-front-layout>

