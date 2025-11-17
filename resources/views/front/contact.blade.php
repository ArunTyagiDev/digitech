<x-front-layout>
    <section class="max-w-4xl mx-auto px-4 py-12">
        <h1 class="text-2xl font-semibold">Contact Us</h1>
        @if(session('status'))
            <div class="mt-4 p-3 rounded bg-green-600/20 text-green-300 border border-green-600/30">{{ session('status') }}</div>
        @endif
        <form method="post" action="{{ route('contact.submit') }}" class="mt-6 grid gap-4">
            @csrf
            <div>
                <label class="block text-sm text-gray-300">Name</label>
                <input name="name" value="{{ old('name') }}" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2" />
                @error('name')<div class="text-red-400 text-sm mt-1">{{ $message }}</div>@enderror
            </div>
            <div>
                <label class="block text-sm text-gray-300">Email</label>
                <input type="email" name="email" value="{{ old('email') }}" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2" />
                @error('email')<div class="text-red-400 text-sm mt-1">{{ $message }}</div>@enderror
            </div>
            <div>
                <label class="block text-sm text-gray-300">Product Interest (optional)</label>
                <input name="product_interest" value="{{ old('product_interest') }}" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2" />
            </div>
            <div>
                <label class="block text-sm text-gray-300">Message</label>
                <textarea name="message" rows="4" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2">{{ old('message') }}</textarea>
            </div>
            <button class="px-5 py-3 bg-yellow-400 text-black rounded w-max">Send Message</button>
        </form>

        <div class="mt-10 rounded-xl overflow-hidden border border-brand-gray-800 aspect-video bg-brand-gray-800/40">
            <!-- Map embed placeholder -->
        </div>
    </section>
</x-front-layout>

