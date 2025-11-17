<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function index(Request $request)
    {
        $cart = collect($request->session()->get('cart', []));
        $productIds = $cart->keys()->all();
        $products = Product::whereIn('id', $productIds)->with('images')->get()->keyBy('id');
        $items = $cart->map(function ($qty, $id) use ($products) {
            $p = $products->get((int) $id);
            if (!$p) return null;
            $original = $p->price ?? 0;
            $discounted = $original * 0.5;
            return [
                'product' => $p,
                'quantity' => (int) $qty,
                'original_price' => $original,
                'price' => $discounted,
                'line_total' => $discounted * (int) $qty,
            ];
        })->filter();
        $subtotal = number_format($items->sum('line_total'), 2, '.', '');
        return view('front.cart.index', compact('items', 'subtotal'));
    }

    public function add(Request $request, Product $product)
    {
        $quantity = max(1, (int) $request->input('quantity', 1));
        $cart = collect($request->session()->get('cart', []));
        $cart[(string) $product->id] = (int) $cart->get((string) $product->id, 0) + $quantity;
        $request->session()->put('cart', $cart->all());
        return redirect()->route('checkout.index')->with('status', 'Added to cart');
    }

    public function update(Request $request, Product $product)
    {
        $quantity = max(1, (int) $request->input('quantity', 1));
        $cart = collect($request->session()->get('cart', []));
        if ($cart->has((string) $product->id)) {
            $cart[(string) $product->id] = $quantity;
            $request->session()->put('cart', $cart->all());
        }
        return back()->with('status', 'Cart updated');
    }

    public function remove(Request $request, Product $product)
    {
        $cart = collect($request->session()->get('cart', []));
        $cart->forget((string) $product->id);
        $request->session()->put('cart', $cart->all());
        return back()->with('status', 'Removed from cart');
    }

    public function clear(Request $request)
    {
        $request->session()->forget('cart');
        return back()->with('status', 'Cart cleared');
    }
}
