<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use Illuminate\Http\Request;

class BannerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $banners = Banner::orderBy('sort_order')->paginate(20);
        return view('admin.banners.index', compact('banners'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.banners.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => ['nullable', 'string', 'max:255'],
            'subtitle' => ['nullable', 'string', 'max:255'],
            'link_url' => ['nullable', 'url'],
            'image' => ['required', 'file', 'mimes:jpg,jpeg,png,webp,gif,mp4,webm,ogg'],
            'sort_order' => ['nullable', 'integer'],
            'is_active' => ['nullable', 'boolean'],
        ]);
        $data = $validated;
        $data['is_active'] = (bool) ($validated['is_active'] ?? true);
        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('banners', 'public');
        }
        Banner::create($data);
        return redirect()->route('admin.banners.index')->with('status', 'Banner created');
    }

    /**
     * Display the specified resource.
     */
    public function show(Banner $banner)
    {
        return redirect()->route('admin.banners.edit', $banner);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Banner $banner)
    {
        return view('admin.banners.edit', compact('banner'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Banner $banner)
    {
        $validated = $request->validate([
            'title' => ['nullable', 'string', 'max:255'],
            'subtitle' => ['nullable', 'string', 'max:255'],
            'link_url' => ['nullable', 'url'],
            'image' => ['nullable', 'file', 'mimes:jpg,jpeg,png,webp,gif,mp4,webm,ogg'],
            'sort_order' => ['nullable', 'integer'],
            'is_active' => ['nullable', 'boolean'],
        ]);
        $data = $validated;
        $data['is_active'] = (bool) ($validated['is_active'] ?? true);
        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('banners', 'public');
        }
        $banner->update($data);
        return redirect()->route('admin.banners.index')->with('status', 'Banner updated');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Banner $banner)
    {
        $banner->delete();
        return redirect()->route('admin.banners.index')->with('status', 'Banner deleted');
    }
}
