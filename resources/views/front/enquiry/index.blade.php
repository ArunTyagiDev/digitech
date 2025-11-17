<x-front-layout>
    <section class="max-w-5xl mx-auto px-4 py-12">
        <h1 class="text-2xl font-semibold">Your Enquiry</h1>
        @if(session('status'))
            <div class="mt-4 p-3 rounded bg-green-600/20 text-green-300 border border-green-600/30">{{ session('status') }}</div>
        @endif

        <div class="mt-6 space-y-4">
            @forelse($products as $product)
                <div class="flex items-center gap-4 border border-brand-gray-800 rounded-xl p-4 bg-brand-gray-800/40">
                    @php $img = optional($product->images->first())->path; @endphp
                    <img src="{{ $img ? asset('storage/'.$img) : 'https://via.placeholder.com/120x80?text=Product' }}" class="w-24 h-16 object-cover rounded" />
                    <div class="flex-1">
                        <div class="font-medium">{{ $product->name }}</div>
                        <div class="text-sm text-gray-400">{{ $product->category?->name }}</div>
                    </div>
                    <form method="post" action="{{ route('enquiry.remove', $product) }}">
                        @csrf
                        @method('DELETE')
                        <button class="text-xs text-red-400 hover:underline">Remove</button>
                    </form>
                </div>
            @empty
                <div class="text-gray-500">Your enquiry list is empty.</div>
            @endforelse
        </div>

        <form method="post" action="{{ route('enquiry.submit') }}" class="mt-10 grid sm:grid-cols-2 gap-4">
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
                <label class="block text-sm text-gray-300">Phone</label>
                <input name="phone" value="{{ old('phone') }}" class="w-full mt-1 bg-brand-gray-800 border border-brand-700 rounded px-3 py-2" />
            </div>
            <div class="sm:col-span-2">
                <label class="block text-sm text-gray-300">Message</label>
                <textarea name="message" rows="4" class="w-full mt-1 bg-brand-gray-800 border border-brand-gray-700 rounded px-3 py-2">{{ old('message') }}</textarea>
            </div>
            <div class="sm:col-span-2">
                <button class="px-5 py-3 bg-yellow-400 text-black rounded">Submit Enquiry</button>
            </div>
        </form>
    </section>
</x-front-layout>

