<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Enquiry;
use Illuminate\Http\Request;

class EnquiryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $enquiries = Enquiry::latest()->paginate(20);
        return view('admin.enquiries.index', compact('enquiries'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Enquiry $enquiry)
    {
        return view('admin.enquiries.show', compact('enquiry'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Enquiry $enquiry)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Enquiry $enquiry)
    {
        $validated = $request->validate([
            'status' => ['required', 'string'],
            'admin_notes' => ['nullable', 'string'],
        ]);
        $enquiry->update($validated);
        return back()->with('status', 'Enquiry updated');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Enquiry $enquiry)
    {
        $enquiry->delete();
        return redirect()->route('admin.enquiries.index')->with('status', 'Enquiry deleted');
    }
}
