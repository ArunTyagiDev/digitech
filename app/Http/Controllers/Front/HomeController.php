<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        $banners = Banner::query()->where('is_active', true)->orderBy('sort_order')->get();
        $featuredProducts = Product::query()->where('is_active', true)->where('is_featured', true)->latest()->with('images')->take(8)->get();
        $newLaunches = Product::query()->where('is_active', true)->latest()->with('images')->take(8)->get();
        $topCategories = Category::query()->where('is_active', true)->orderBy('sort_order')->take(8)->get();

        return view('front.home', compact('banners', 'featuredProducts', 'newLaunches', 'topCategories'));
    }

    public function about()
    {
        return view('front.about');
    }
}
