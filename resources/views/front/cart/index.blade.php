<x-front-layout>
    <section class="max-w-5xl mx-auto px-4 py-10">
        <h1 class="text-2xl font-semibold">Your Cart</h1>
        @if(session('status'))
            <div class="mt-4 p-3 rounded bg-green-600/20 text-green-300 border border-green-600/30">{{ session('status') }}</div>
        @endif
        @if($items->isEmpty())
            <div class="text-gray-400 mt-6">Your cart is empty.</div>
        @else
            <div class="mt-6 space-y-4">
                @foreach($items as $row)
                    <div class="flex items-center gap-4 border border-brand-gray-800 rounded-xl p-4 bg-brand-gray-800/40">
						@php $img = optional($row['product']->images->first())->path; @endphp
						<img src="{{ $img ? asset('storage/'.$img) : asset('placeholder.svg') }}" class="w-24 h-16 object-cover rounded" />
                        <div class="flex-1">
                            <a class="font-medium hover:text-yellow-400" href="{{ route('products.show', $row['product']->slug) }}">{{ $row['product']->name }}</a>
                            <div class="text-sm">
								<span class="text-gray-500 line-through mr-2">₹{{ number_format($row['original_price'], 2) }}</span>
								<span class="text-yellow-400">₹{{ number_format($row['price'], 2) }}</span>
								<span class="ml-2 text-xs text-green-400 bg-green-500/10 border border-green-500/30 rounded px-1 py-0.5">50% OFF</span>
							</div>
                        </div>
                        <form method="post" action="{{ route('cart.update', $row['product']) }}" class="flex items-center gap-2">
                            @csrf
                            <input type="number" min="1" name="quantity" value="{{ $row['quantity'] }}" class="w-20 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2" />
                            <button class="text-xs text-yellow-400 hover:underline">Update</button>
                        </form>
                        <form method="post" action="{{ route('cart.remove', $row['product']) }}">
                            @csrf
                            @method('DELETE')
                            <button class="text-xs text-red-400 hover:underline">Remove</button>
                        </form>
                        <div class="w-24 text-right">₹{{ number_format($row['line_total'], 2) }}</div>
                    </div>
                @endforeach
            </div>
            <div class="mt-6 flex items-center justify-between">
                <form method="post" action="{{ route('cart.clear') }}">
                    @csrf
                    <button class="text-sm text-red-400 hover:underline">Clear Cart</button>
                </form>
                <div class="text-lg">Subtotal: <span class="text-yellow-400">₹{{ number_format($subtotal, 2) }}</span></div>
            </div>
            <div class="mt-6 text-right">
                <a href="{{ route('checkout.index') }}" class="px-5 py-3 bg-yellow-400 text-black rounded inline-block">Proceed to Checkout</a>
            </div>
        @endif
    </section>
</x-front-layout>

