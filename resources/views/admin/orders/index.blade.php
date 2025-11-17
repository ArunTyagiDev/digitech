@extends('layouts.app')

@section('content')
<div class="max-w-7xl mx-auto py-8 px-4">
    <div class="flex items-center justify-between mb-6">
        <h1 class="text-2xl font-semibold text-gray-100">Orders</h1>
    </div>

    <div class="overflow-x-auto border border-brand-gray-800 rounded-xl">
        <table class="min-w-full text-sm">
            <thead>
                <tr class="bg-brand-gray-800 text-gray-300">
                    <th class="text-left px-4 py-2">ID</th>
                    <th class="text-left px-4 py-2">Customer</th>
                    <th class="text-left px-4 py-2">Email</th>
					<th class="text-left px-4 py-2">Payment</th>
                    <th class="text-left px-4 py-2">Total</th>
                    <th class="text-left px-4 py-2">Status</th>
                    <th class="text-left px-4 py-2">Placed</th>
                </tr>
            </thead>
            <tbody>
                @forelse($orders as $order)
                    <tr class="border-t border-brand-gray-800">
                        <td class="px-4 py-2">#{{ $order->id }}</td>
                        <td class="px-4 py-2">{{ $order->name }}</td>
                        <td class="px-4 py-2">{{ $order->email }}</td>
						<td class="px-4 py-2">
							@php $screenshotUrl = $order->payment_screenshot_url; @endphp
							@if($screenshotUrl)
								<div x-data="{ open: false }" class="relative">
									<img src="{{ $screenshotUrl }}" alt="Payment Screenshot" class="h-12 w-12 object-cover rounded cursor-pointer border border-brand-gray-700" @click="open = true" />
									<div x-show="open" x-cloak class="fixed inset-0 z-50 bg-black/80 flex items-center justify-center" @click.self="open = false">
										<img src="{{ $screenshotUrl }}" alt="Payment Screenshot" class="max-h-[90vh] max-w-[90vw] rounded shadow-lg" />
										<button type="button" @click="open = false" class="absolute top-4 right-4 text-white text-2xl leading-none">&times;</button>
									</div>
								</div>
							@else
								<span class="text-gray-500">—</span>
							@endif
						</td>
                        <td class="px-4 py-2">₹{{ number_format($order->total, 2) }}</td>
                        <td class="px-4 py-2">{{ ucfirst($order->status) }}</td>
                        <td class="px-4 py-2">{{ $order->created_at->format('Y-m-d H:i') }}</td>
                    </tr>
                @empty
                    <tr>
						<td colspan="7" class="px-4 py-6 text-center text-gray-500">No orders yet.</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    <div class="mt-6">{{ $orders->links() }}</div>
</div>
@endsection


