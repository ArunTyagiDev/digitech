<x-front-layout>
    <section class="max-w-3xl mx-auto px-4 py-16 text-center">
        <h1 class="text-3xl font-semibold text-yellow-400">Thank you!</h1>
        <p class="text-gray-300 mt-4">Your order <span class="font-semibold">#{{ $order->id }}</span> has been placed and is pending verification.</p>
        <p class="text-gray-400 mt-2">We will confirm your payment and contact you shortly.</p>
        <a href="{{ route('products.index') }}" class="mt-8 inline-block px-5 py-3 bg-yellow-400 text-black rounded">Continue Shopping</a>
    </section>
</x-front-layout>

