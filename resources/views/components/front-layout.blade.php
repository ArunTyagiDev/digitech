<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>{{ $title ?? (config('app.name').' | Capture your world') }}</title>
        <meta name="description" content="{{ $metaDescription ?? 'Camera & mobile accessories – tripods, lights, mics, power solutions.' }}">
        @vite(['resources/css/app.css', 'resources/js/app.js'])
        @stack('head')
    </head>
    <body class="min-h-screen bg-brand-gray-900 text-gray-100">
		<header x-data="{ mobileOpen: false }" class="border-b border-brand-gray-800/60 bg-brand-gray-800/40 backdrop-blur">
            <div class="max-w-7xl mx-auto px-4 py-4 flex items-center justify-between">
                <a href="{{ route('home') }}" class="flex items-center gap-2 font-semibold tracking-wide text-yellow-400">
                    <svg class="w-7 h-7 text-yellow-400" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M4 4h16v16H4z" opacity=".2"/><path d="M3 3h18v2H3zm0 16h18v2H3zM5 7h14v10H5z"/></svg>
                    <span>{{ config('app.name', 'Digitek-Style') }}</span>
                </a>
				<nav class="hidden md:flex items-center gap-6 text-sm">
                    <a href="{{ route('products.index') }}" class="hover:text-yellow-400">Products</a>
                    <a href="{{ route('about') }}" class="hover:text-yellow-400">About</a>
                    <a href="{{ route('blog.index') }}" class="hover:text-yellow-400">Blog</a>
                    <a href="{{ route('contact.index') }}" class="hover:text-yellow-400">Contact</a>
                    <a href="{{ route('enquiry.index') }}" class="inline-flex items-center gap-2 text-yellow-400">
                        <span>Enquiry</span>
                    </a>
                    @php $cartQty = collect(session('cart', []))->sum(); @endphp
                    <a href="{{ route('cart.index') }}" class="inline-flex items-center gap-2 hover:text-yellow-400">
                        <svg class="w-5 h-5" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M7 4h-2l-1 2h2l3.6 7.59-1.35 2.45A2 2 0 0 0 10 19h9v-2h-8.42a.25.25 0 0 1-.22-.37L11 14h6.55a2 2 0 0 0 1.92-1.46l1.52-5.32A1 1 0 0 0 20 6H7.42l-.7-2z"/></svg>
                        <span>Cart</span>
                        @if($cartQty)
                            <span class="ml-1 text-xs px-2 py-0.5 rounded-full bg-yellow-400 text-black">{{ $cartQty }}</span>
                        @endif
                    </a>
                </nav>
				<button type="button" @click="mobileOpen = !mobileOpen" class="md:hidden inline-flex items-center justify-center p-2 rounded border border-brand-gray-700 text-gray-300 hover:text-yellow-400">
					<svg x-show="!mobileOpen" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
					</svg>
					<svg x-show="mobileOpen" x-cloak xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
					</svg>
				</button>
            </div>
			<div x-show="mobileOpen" x-cloak class="md:hidden border-t border-brand-gray-800/60 bg-brand-gray-900">
				<nav class="max-w-7xl mx-auto px-4 py-3 grid gap-3 text-sm">
					<a href="{{ route('products.index') }}" class="hover:text-yellow-400">Products</a>
					<a href="{{ route('about') }}" class="hover:text-yellow-400">About</a>
					<a href="{{ route('blog.index') }}" class="hover:text-yellow-400">Blog</a>
					<a href="{{ route('contact.index') }}" class="hover:text-yellow-400">Contact</a>
					<a href="{{ route('enquiry.index') }}" class="inline-flex items-center gap-2 text-yellow-400">
						<span>Enquiry</span>
					</a>
					@php $cartQty = collect(session('cart', []))->sum(); @endphp
					<a href="{{ route('cart.index') }}" class="inline-flex items-center gap-2 hover:text-yellow-400">
						<svg class="w-5 h-5" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M7 4h-2l-1 2h2l3.6 7.59-1.35 2.45A2 2 0 0 0 10 19h9v-2h-8.42a.25.25 0 0 1-.22-.37L11 14h6.55a2 2 0 0 0 1.92-1.46l1.52-5.32A1 1 0 0 0 20 6H7.42l-.7-2z"/></svg>
						<span>Cart</span>
						@if($cartQty)
							<span class="ml-1 text-xs px-2 py-0.5 rounded-full bg-yellow-400 text-black">{{ $cartQty }}</span>
						@endif
					</a>
				</nav>
			</div>
        </header>

        <main>
            {{ $slot }}
        </main>

        <footer class="mt-16 border-t border-brand-gray-800/60 bg-brand-gray-800/40">
            <div class="max-w-7xl mx-auto px-4 py-10 grid md:grid-cols-3 gap-8 text-sm">
                <div>
                    <div class="text-yellow-400 font-semibold mb-2">About</div>
                    <p class="text-gray-400">High-performance accessories for creators: lights, mics, tripods, and more.</p>
                </div>
                <div>
                    <div class="text-yellow-400 font-semibold mb-2">Quick Links</div>
                    <ul class="space-y-2 text-gray-300">
                        <li><a href="{{ route('products.index') }}" class="hover:text-yellow-400">Products</a></li>
                        <li><a href="{{ route('about') }}" class="hover:text-yellow-400">About</a></li>
                        <li><a href="{{ route('blog.index') }}" class="hover:text-yellow-400">Blog</a></li>
                        <li><a href="{{ route('contact.index') }}" class="hover:text-yellow-400">Contact</a></li>
                    </ul>
                </div>
                <div>
                    <div class="text-yellow-400 font-semibold mb-2">Contact</div>
                    <ul class="space-y-1 text-gray-300">
                        <li>Email: info@example.com</li>
                        <li>Phone: +91 90000 00000</li>
                        <li>Address: Mumbai, India</li>
                    </ul>
                </div>
            </div>
            <div class="text-center text-xs text-gray-500 py-4">© {{ date('Y') }} {{ config('app.name') }}. All rights reserved.</div>
        </footer>
    </body>
    </html>

