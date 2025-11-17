<x-front-layout :title="$post->title.' | '.config('app.name')" :metaDescription="$post->excerpt">
    <section class="max-w-3xl mx-auto px-4 py-10">
        <div class="text-sm text-gray-400">{{ optional($post->published_at)->format('M d, Y') }}</div>
        <h1 class="text-3xl font-semibold mt-1">{{ $post->title }}</h1>
        @if($post->image)
            <img src="{{ asset('storage/'.$post->image) }}" class="w-full rounded-xl border border-brand-gray-800 mt-6" />
        @endif
        <article class="prose prose-invert max-w-none mt-6">
            {!! $post->content !!}
        </article>

        @if($recent->count())
            <div class="mt-12">
                <h3 class="text-xl font-semibold text-yellow-400 mb-4">Recent Posts</h3>
                <ul class="space-y-2 text-gray-300">
                    @foreach($recent as $item)
                        <li><a class="hover:text-yellow-400" href="{{ route('blog.show', $item->slug) }}">{{ $item->title }}</a></li>
                    @endforeach
                </ul>
            </div>
        @endif
    </section>
</x-front-layout>

