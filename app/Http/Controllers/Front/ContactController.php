<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Enquiry;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class ContactController extends Controller
{
    public function index()
    {
        return view('front.contact');
    }

    public function submit(Request $request)
    {
        $validated = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email'],
            'message' => ['nullable', 'string'],
            'product_interest' => ['nullable', 'string'],
        ]);

        $items = [];
        if (! empty($validated['product_interest'])) {
            $items[] = ['note' => $validated['product_interest']];
        }

        Enquiry::create([
            'name' => $validated['name'],
            'email' => $validated['email'],
            'message' => $validated['message'] ?? null,
            'items' => $items,
            'status' => 'new',
        ]);

        return back()->with('status', 'Thank you! We will get back to you soon.');
    }
}
