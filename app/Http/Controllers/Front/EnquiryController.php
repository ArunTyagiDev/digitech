<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Enquiry;
use App\Models\Product;
use Illuminate\Http\Request;

class EnquiryController extends Controller
{
    public function index(Request $request)
    {
        $ids = collect($request->session()->get('enquiry', []))->unique()->values()->all();
        $products = Product::whereIn('id', $ids)->with('images')->get();
        return view('front.enquiry.index', compact('products'));
    }

    public function add(Request $request, Product $product)
    {
        $ids = collect($request->session()->get('enquiry', []));
        $ids->push($product->id);
        $request->session()->put('enquiry', $ids->unique()->values()->all());

        return back()->with('status', 'Added to enquiry');
    }

    public function remove(Request $request, Product $product)
    {
        $ids = collect($request->session()->get('enquiry', []))->reject(fn ($id) => (int) $id === (int) $product->id);
        $request->session()->put('enquiry', $ids->values()->all());
        return back()->with('status', 'Removed from enquiry');
    }

    public function submit(Request $request)
    {
        $validated = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email'],
            'phone' => ['nullable', 'string', 'max:30'],
            'message' => ['nullable', 'string'],
        ]);

        $ids = collect($request->session()->get('enquiry', []))->unique()->values()->all();
        $products = Product::whereIn('id', $ids)->get(['id', 'name', 'sku', 'slug'])->toArray();

        Enquiry::create([
            'name' => $validated['name'],
            'email' => $validated['email'],
            'phone' => $validated['phone'] ?? null,
            'message' => $validated['message'] ?? null,
            'items' => $products,
            'status' => 'new',
        ]);

        $request->session()->forget('enquiry');

        return redirect()->route('enquiry.index')->with('status', 'Enquiry submitted successfully.');
    }
}
