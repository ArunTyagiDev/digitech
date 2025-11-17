<x-front-layout :title="$product->name.' | '.config('app.name')" :metaDescription="$product->short_description">
    <section class="max-w-7xl mx-auto px-4 py-10">
        <div class="grid lg:grid-cols-2 gap-10">
            <div>
                <div class="aspect-[4/3] border border-brand-gray-800 rounded-xl overflow-hidden">
                    @php $primary = $product->images->firstWhere('is_primary', true) ?? $product->images->first(); @endphp
                    <img src="{{ $primary? asset('storage/'.$primary->path) : asset('placeholder.svg') }}" class="w-full h-full object-cover" />
                </div>
                @if($product->images->count() > 1)
                    <div class="mt-3 grid grid-cols-5 gap-2">
                        @foreach($product->images as $img)
                            <img src="{{ asset('storage/'.$img->path) }}" class="w-full aspect-video object-cover rounded border border-brand-gray-800" />
                        @endforeach
                    </div>
                @endif
            </div>
            <div>
                <h1 class="text-2xl font-semibold">{{ $product->name }}</h1>
                <div class="text-sm text-gray-400">SKU: {{ $product->sku ?? 'N/A' }}</div>
				@php
					$discountPercent = 50;
					$hasPrice = !is_null($product->price);
					$discounted = $hasPrice ? ($product->price * (1 - $discountPercent/100)) : null;
				@endphp
				<div class="mt-2">
					@if($hasPrice)
						<div class="flex items-center gap-3">
							<span class="text-gray-400 line-through">₹{{ number_format($product->price,2) }}</span>
							<span class="text-2xl text-yellow-400 font-semibold">₹{{ number_format($discounted,2) }}</span>
							<span class="text-xs text-green-400 bg-green-500/10 border border-green-500/30 rounded px-1.5 py-0.5">{{ $discountPercent }}% OFF</span>
						</div>
					@else
						<div class="text-yellow-400">Enquiry</div>
					@endif
				</div>
                <div class="mt-4 text-gray-300">{!! nl2br(e($product->short_description ?? '')) !!}</div>

                <div class="mt-6 flex gap-3">
                    <form method="post" action="{{ route('cart.add', $product) }}">
                        @csrf
                        <input type="hidden" name="quantity" value="1" />
                        <button class="px-5 py-3 bg-yellow-400 text-black rounded">Add to Cart</button>
                    </form>
                    <form method="post" action="{{ route('enquiry.add', $product) }}">
                        @csrf
                        <button class="px-5 py-3 border border-brand-gray-700 rounded">Add to Enquiry</button>
                    </form>
                </div>

                <div class="mt-8">
                    <h3 class="font-semibold text-yellow-400 mb-3">Specifications</h3>
                    <div class="grid sm:grid-cols-2 gap-x-8 gap-y-2 text-gray-300">
                        @forelse($product->specifications as $spec)
                            <div class="flex justify-between gap-4"><span class="text-gray-400">{{ $spec->name }}</span><span>{{ $spec->value }}</span></div>
                        @empty
                            <div class="text-gray-500">No specifications listed.</div>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>

        <div class="mt-16">
            <h2 class="text-xl font-semibold text-yellow-400 mb-6">Related Products</h2>
            <div class="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
                @foreach($related as $item)
                    <a href="{{ route('products.show', $item->slug) }}" class="group border border-brand-gray-800 rounded-xl overflow-hidden bg-brand-gray-800/40">
                        <div class="aspect-[4/3] overflow-hidden">
                            @php $img = optional($item->images->first())->path; @endphp
                            <img src="{{ filled($img) ? asset('storage/'.$img) : asset('placeholder.svg') }}" class="w-full h-full object-cover group-hover:scale-105 transition" />
                        </div>
                        <div class="p-4">
                            <div class="text-sm text-gray-400">{{ $item->category?->name }}</div>
                            <div class="font-medium">{{ $item->name }}</div>
                        </div>
                    </a>
                @endforeach
            </div>
        </div>
    </section>
</x-front-layout>

