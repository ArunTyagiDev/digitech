<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

class CheckoutController extends Controller
{
    public function index(Request $request)
    {
        $cart = collect($request->session()->get('cart', []));
        if ($cart->isEmpty()) {
            return redirect()->route('cart.index')->with('status', 'Your cart is empty');
        }

        $productIds = $cart->keys()->all();
        $products = Product::whereIn('id', $productIds)->get()->keyBy('id');
        $items = $cart->map(function ($qty, $id) use ($products) {
            $p = $products->get((int) $id);
            if (!$p) return null;
            $original = $p->price ?? 0;
            $price = $original * 0.5;
            return [
                'product' => $p,
                'quantity' => (int) $qty,
                'original_price' => $original,
                'price' => $price,
                'line_total' => $price * (int) $qty,
            ];
        })->filter();
        $subtotal = number_format($items->sum('line_total'), 2, '.', '');

        $qrPath = config('payment.qr_path', 'payments/qr.png');
        // Use configured UPI ID, or fall back to provided Paytm UPI ID
        $upiId = config('payment.upi_id') ?: 'paytmqr2810050501011meg3b1gpd19@paytm';
        $payee = config('payment.payee');

        return view('front.checkout.index', compact('items', 'subtotal', 'qrPath', 'upiId', 'payee'));
    }

    public function place(Request $request)
    {
        $validated = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email'],
            'phone' => ['nullable', 'string', 'max:30'],
            'address' => ['nullable', 'string'],
            'notes' => ['nullable', 'string'],
            'payment_reference' => ['nullable', 'string', 'max:100'],
            'payment_method' => ['required', 'in:qr,card'],
            'payment_screenshot' => ['nullable', 'image', 'max:4096'],
            // Card fields (required if method is card)
            'card_name' => ['required_if:payment_method,card', 'nullable', 'string', 'max:255'],
            'card_number' => ['required_if:payment_method,card', 'nullable', 'regex:/^[0-9\\s-]{12,23}$/'],
            'card_exp_month' => ['required_if:payment_method,card', 'nullable', 'integer', 'between:1,12'],
            'card_exp_year' => ['required_if:payment_method,card', 'nullable', 'regex:/^\\d{2}(\\d{2})?$/'],
            'card_cvc' => ['required_if:payment_method,card', 'nullable', 'regex:/^\\d{3,4}$/'],
        ]);

        $cart = collect($request->session()->get('cart', []));
        if ($cart->isEmpty()) {
            return redirect()->route('cart.index');
        }

        $productIds = $cart->keys()->all();
        $products = Product::whereIn('id', $productIds)->get()->keyBy('id');
        $items = $cart->map(function ($qty, $id) use ($products) {
            $p = $products->get((int) $id);
            if (!$p) return null;
            $original = $p->price ?? 0;
            $price = $original * 0.5;
            return [
                'product' => $p,
                'quantity' => (int) $qty,
                'original_price' => $original,
                'price' => $price,
                'line_total' => $price * (int) $qty,
            ];
        })->filter();

        $subtotal = (float) number_format($items->sum('line_total'), 2, '.', '');

        // Build payment reference based on method and store optional screenshot
        $paymentMethod = $validated['payment_method'];
        $paymentReference = $validated['payment_reference'] ?? null;

        // Scanner / QR
		$paymentScreenshotPath = null;
		if ($paymentMethod === 'qr' && $request->hasFile('payment_screenshot')) {
			$file = $request->file('payment_screenshot');
			$destinationPath = public_path('payments/screenshots');
			if (!File::exists($destinationPath)) {
				File::makeDirectory($destinationPath, 0755, true);
			}
			$filename = now()->format('YmdHis').'_' . Str::random(8) . '.' . $file->getClientOriginalExtension();
			$file->move($destinationPath, $filename);
			$paymentScreenshotPath = 'payments/screenshots/' . $filename;
			$validated['notes'] = trim(($validated['notes'] ?? '') . "\nPayment screenshot: " . $paymentScreenshotPath);
		}

        // Card - do NOT store full PAN/CVC; capture last4 only for reference
        if ($paymentMethod === 'card' && !empty($validated['card_number'])) {
            $digitsOnly = preg_replace('/\\D+/', '', (string) $validated['card_number']);
            $last4 = substr($digitsOnly, -4);
            $paymentReference = 'CARD-****'.$last4;
        }

        $order = DB::transaction(function () use ($validated, $items, $subtotal, $paymentMethod, $paymentReference) {
            $order = Order::create([
                'name' => $validated['name'],
                'email' => $validated['email'],
                'phone' => $validated['phone'] ?? null,
                'address' => $validated['address'] ?? null,
                'notes' => $validated['notes'] ?? null,
                'subtotal' => $subtotal,
                'total' => $subtotal,
                'status' => 'pending',
                'payment_method' => $paymentMethod,
                'payment_reference' => $paymentReference,
            ]);

            foreach ($items as $row) {
                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $row['product']->id,
                    'name' => $row['product']->name,
                    'price' => $row['price'],
                    'quantity' => $row['quantity'],
                    'line_total' => $row['line_total'],
                ]);
            }

            return $order;
        });

        $request->session()->forget('cart');

        return redirect()->route('checkout.thankyou', ['order' => $order->id]);
    }

    public function thankyou(Order $order)
    {
        return view('front.checkout.thankyou', compact('order'));
    }
}
