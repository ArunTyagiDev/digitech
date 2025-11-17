<x-front-layout>
    <section class="max-w-7xl mx-auto px-4 py-10">
        <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4 mb-6">
            <h1 class="text-2xl font-semibold">Products</h1>
            <form method="get" class="flex items-center gap-3">
                <select name="category" class="bg-brand-gray-800 border-brand-gray-700 text-sm rounded px-3 py-2">
                    <option value="">All Categories</option>
                    @foreach($categories as $category)
                        <option value="{{ $category->slug }}" @selected(request('category')===$category->slug)>{{ $category->name }}</option>
                    @endforeach
                </select>
                <select name="sort" class="bg-brand-gray-800 border-brand-gray-700 text-sm rounded px-3 py-2">
                    <option value="newest" @selected(request('sort')==='newest')>Newest</option>
                    <option value="price_asc" @selected(request('sort')==='price_asc')>Price: Low to High</option>
                    <option value="price_desc" @selected(request('sort')==='price_desc')>Price: High to Low</option>
                    <option value="featured" @selected(request('sort')==='featured')>Featured</option>
                </select>
                <button class="px-4 py-2 bg-yellow-400 text-black rounded">Apply</button>
            </form>
        </div>

        <div class="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
            @forelse($products as $product)
                <div class="group border border-brand-gray-800 rounded-xl overflow-hidden bg-brand-gray-800/40">
                    <a href="{{ route('products.show', $product->slug) }}" class="block">
                        <div class="aspect-[4/3] overflow-hidden relative">
                            @php $img = optional($product->images->first())->path; @endphp
                            <img src="{{ filled($img) ? asset('storage/'.$img) : asset('placeholder.svg') }}" class="w-full h-full object-cover group-hover:scale-105 transition" />
                            <div class="absolute inset-0 hidden group-hover:flex items-center justify-center bg-black/40">
                                <span class="px-3 py-2 bg-yellow-400 text-black rounded text-sm">Quick View</span>
                            </div>
                        </div>
                    </a>
                    <div class="p-4 space-y-1">
						<div class="text-sm text-gray-400">{{ $product->category?->name }}</div>
						<a href="{{ route('products.show', $product->slug) }}" class="font-medium hover:text-yellow-400">{{ $product->name }}</a>
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
                        <div class="flex items-center gap-3">
                            <form method="post" action="{{ route('cart.add', $product) }}">
                                @csrf
                                <input type="hidden" name="quantity" value="1" />
                                <button class="text-xs mt-1 text-yellow-400 hover:underline">Add to Cart</button>
                            </form>
                            <form method="post" action="{{ route('enquiry.add', $product) }}">
                                @csrf
                                <button class="text-xs mt-1 hover:underline">Enquiry</button>
                            </form>
                        </div>
                    </div>
                </div>
            @empty
                <div class="text-gray-500">No products found.</div>
            @endforelse
        </div>

        <div class="mt-8">{{ $products->links() }}</div>
    </section>
</x-front-layout>

