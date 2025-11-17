<x-front-layout>
	<section class="relative">
		<div class="max-w-7xl mx-auto px-4 py-8">
			<div class="grid grid-cols-1 gap-4">
				<div class="relative overflow-hidden rounded-xl border border-brand-gray-800">
					<div class="flex gap-4 overflow-x-auto snap-x">
						@if($banners->count())
							@foreach($banners as $banner)
								@php
									$stored = $banner->image ?? '';
									$ext = strtolower(pathinfo($stored, PATHINFO_EXTENSION));
									$existsStorage = $stored ? file_exists(storage_path('app/public/'.$stored)) : false;
									$existsPublic = $stored ? file_exists(public_path($stored)) : false;
									$src = $existsStorage ? asset('storage/'.$stored) : ($existsPublic ? asset($stored) : asset('placeholder.svg'));
									$isVideo = in_array($ext, ['mp4','webm','ogg']);
								@endphp
								<a href="{{ $banner->link_url ?? '#' }}" class="snap-start min-w-full block">
									@if($isVideo)
										<video class="w-full h-[420px] object-cover" autoplay muted loop playsinline preload="auto">
											<source src="{{ $src }}" type="video/{{ $ext === 'webm' ? 'webm' : ($ext === 'ogg' ? 'ogg' : 'mp4') }}">
										</video>
									@else
										<img src="{{ $src }}" alt="{{ $banner->title ?? 'Banner' }}" class="w-full h-[420px] object-cover" />
									@endif
								</a>
							@endforeach
						@else
							<a href="#" class="snap-start min-w-full block">
								<img src="{{ asset('placeholder.svg') }}" alt="Hero" class="w-full h-[420px] object-cover" />
							</a>
							<a href="#" class="snap-start min-w-full block">
								<img src="{{ asset('placeholder.svg') }}" alt="Hero 2" class="w-full h-[420px] object-cover" />
							</a>
							<a href="#" class="snap-start min-w-full block">
								<img src="{{ asset('placeholder.svg') }}" alt="Hero 3" class="w-full h-[420px] object-cover" />
							</a>
						@endif
					</div>
				</div>
			</div>
		</div>
	</section>

    <section class="max-w-7xl mx-auto px-4 py-12">
        <h2 class="text-xl font-semibold text-yellow-400 mb-6">Featured Products</h2>
        <div class="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
            @forelse($featuredProducts as $product)
                <a href="{{ route('products.show', $product->slug) }}" class="group border border-brand-gray-800 rounded-xl overflow-hidden bg-brand-gray-800/40">
                    <div class="aspect-[4/3] overflow-hidden">
							@php $img = optional($product->images->first())->path; @endphp
							<img src="{{ $img ? asset('storage/'.$img) : asset('placeholder.svg') }}" class="w-full h-full object-cover group-hover:scale-105 transition" />
                    </div>
                    <div class="p-4">
						<div class="text-sm text-gray-400">{{ $product->category?->name }}</div>
						<div class="font-medium">{{ $product->name }}</div>
						@php
							$discountPercent = 50;
							$hasPrice = !is_null($product->price);
							$discounted = $hasPrice ? ($product->price * (1 - $discountPercent/100)) : null;
						@endphp
						<div class="mt-1">
							@if($hasPrice)
								<div class="flex items-center gap-2">
									<span class="text-gray-400 line-through">₹{{ number_format($product->price, 2) }}</span>
									<span class="text-yellow-400 font-medium">₹{{ number_format($discounted, 2) }}</span>
									<span class="text-xs text-green-400 bg-green-500/10 border border-green-500/30 rounded px-1.5 py-0.5">{{ $discountPercent }}% OFF</span>
								</div>
							@else
								<div class="text-yellow-400">Enquiry</div>
							@endif
						</div>
                    </div>
                </a>
            @empty
                <div class="text-gray-500">No featured products yet.</div>
            @endforelse
        </div>
    </section>

    <section class="max-w-7xl mx-auto px-4 py-12">
        <h2 class="text-xl font-semibold text-yellow-400 mb-6">New Launches</h2>
        <div class="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
            @foreach($newLaunches as $product)
                <a href="{{ route('products.show', $product->slug) }}" class="group border border-brand-gray-800 rounded-xl overflow-hidden bg-brand-gray-800/40">
                    <div class="aspect-[4/3] overflow-hidden">
							@php $img = optional($product->images->first())->path; @endphp
							<img src="{{ $img ? asset('storage/'.$img) : asset('placeholder.svg') }}" class="w-full h-full object-cover group-hover:scale-105 transition" />
                    </div>
                    <div class="p-4">
						<div class="text-sm text-gray-400">{{ $product->category?->name }}</div>
						<div class="font-medium">{{ $product->name }}</div>
						@php
							$discountPercent = 50;
							$hasPrice = !is_null($product->price);
							$discounted = $hasPrice ? ($product->price * (1 - $discountPercent/100)) : null;
						@endphp
						<div class="mt-1">
							@if($hasPrice)
								<div class="flex items-center gap-2">
									<span class="text-gray-400 line-through">₹{{ number_format($product->price, 2) }}</span>
									<span class="text-yellow-400 font-medium">₹{{ number_format($discounted, 2) }}</span>
									<span class="text-xs text-green-400 bg-green-500/10 border border-green-500/30 rounded px-1.5 py-0.5">{{ $discountPercent }}% OFF</span>
								</div>
							@else
								<div class="text-yellow-400">Enquiry</div>
							@endif
						</div>
                    </div>
                </a>
            @endforeach
        </div>
    </section>

    <section class="max-w-7xl mx-auto px-4 py-12">
        <h2 class="text-xl font-semibold text-yellow-400 mb-6">Top Categories</h2>
        <div class="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
            @foreach($topCategories as $category)
                <a href="{{ route('category.show', $category->slug) }}" class="group border border-brand-gray-800 rounded-xl overflow-hidden bg-brand-gray-800/40 p-6">
                    <div class="font-medium">{{ $category->name }}</div>
                    <div class="text-gray-400 mt-1">Explore products</div>
                </a>
            @endforeach
        </div>
    </section>

	<section class="max-w-7xl mx-auto px-4 py-16">
		<div class="grid md:grid-cols-2 gap-10 items-center">
			<div>
				<h3 class="text-2xl font-semibold text-yellow-400">Create With Confidence</h3>
				<p class="text-gray-300 mt-3">Reliable gear engineered for creators—from studio lights to travel tripods and broadcast-grade microphones.</p>
			</div>
			<div class="rounded-xl overflow-hidden border border-brand-gray-800 aspect-video bg-brand-gray-900">
				<img src="{{ asset('placeholder.svg') }}" alt="Showcase" class="w-full h-full object-cover" />
			</div>
		</div>
	</section>
</x-front-layout>

