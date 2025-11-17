<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\Front\HomeController as FrontHomeController;
use App\Http\Controllers\Front\ProductController as FrontProductController;
use App\Http\Controllers\Front\BlogController as FrontBlogController;
use App\Http\Controllers\Front\ContactController as FrontContactController;
use App\Http\Controllers\Front\EnquiryController as FrontEnquiryController;
use App\Http\Controllers\Admin\CategoryController as AdminCategoryController;
use App\Http\Controllers\Admin\ProductController as AdminProductController;
use App\Http\Controllers\Admin\BannerController as AdminBannerController;
use App\Http\Controllers\Admin\BlogPostController as AdminBlogPostController;
use App\Http\Controllers\Admin\TestimonialController as AdminTestimonialController;
use App\Http\Controllers\Admin\EnquiryController as AdminEnquiryController;
use App\Http\Controllers\Admin\OrderController as AdminOrderController;
use App\Http\Controllers\Front\CartController;
use App\Http\Controllers\Front\CheckoutController;
use Illuminate\Support\Facades\Route;

// Frontend routes
Route::get('/', [FrontHomeController::class, 'index'])->name('home');
Route::get('/about', [FrontHomeController::class, 'about'])->name('about');

// Products
Route::get('/products', [FrontProductController::class, 'index'])->name('products.index');
Route::get('/products/{slug}', [FrontProductController::class, 'show'])->name('products.show');
Route::get('/category/{slug}', [FrontProductController::class, 'category'])->name('category.show');

// Blog
Route::get('/blog', [FrontBlogController::class, 'index'])->name('blog.index');
Route::get('/blog/{slug}', [FrontBlogController::class, 'show'])->name('blog.show');

// Contact
Route::get('/contact', [FrontContactController::class, 'index'])->name('contact.index');
Route::post('/contact', [FrontContactController::class, 'submit'])->name('contact.submit');

// Enquiry (wishlist-style)
Route::get('/enquiry', [FrontEnquiryController::class, 'index'])->name('enquiry.index');
Route::post('/enquiry/add/{product}', [FrontEnquiryController::class, 'add'])->name('enquiry.add');
Route::delete('/enquiry/remove/{product}', [FrontEnquiryController::class, 'remove'])->name('enquiry.remove');
Route::post('/enquiry/submit', [FrontEnquiryController::class, 'submit'])->name('enquiry.submit');

// Cart
Route::get('/cart', [CartController::class, 'index'])->name('cart.index');
Route::post('/cart/add/{product}', [CartController::class, 'add'])->name('cart.add');
Route::post('/cart/update/{product}', [CartController::class, 'update'])->name('cart.update');
Route::delete('/cart/remove/{product}', [CartController::class, 'remove'])->name('cart.remove');
Route::post('/cart/clear', [CartController::class, 'clear'])->name('cart.clear');

// Checkout
Route::get('/checkout', [CheckoutController::class, 'index'])->name('checkout.index');
Route::post('/checkout', [CheckoutController::class, 'place'])->name('checkout.place');
Route::get('/checkout/thank-you/{order}', [CheckoutController::class, 'thankyou'])->name('checkout.thankyou');

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';

// Admin routes
Route::middleware(['auth', 'admin'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/', function () { return redirect()->route('admin.products.index'); })->name('home');
    Route::resource('categories', AdminCategoryController::class);
    Route::resource('products', AdminProductController::class);
    Route::resource('orders', AdminOrderController::class)->only(['index']);
    Route::resource('banners', AdminBannerController::class);
    Route::resource('blog-posts', AdminBlogPostController::class);
    Route::resource('testimonials', AdminTestimonialController::class);
    Route::resource('enquiries', AdminEnquiryController::class)->only(['index', 'show', 'update', 'destroy']);
});

// SEO basics
Route::get('/robots.txt', function () {
    $content = "User-agent: *\nAllow: /\nSitemap: ".url('sitemap.xml');
    return response($content, 200)->header('Content-Type', 'text/plain');
});

Route::get('/sitemap.xml', function () {
    $urls = [
        url('/'),
        url('/products'),
        url('/blog'),
        url('/about'),
        url('/contact'),
    ];

    $productUrls = \App\Models\Product::where('is_active', true)->get(['slug'])->map(fn($p) => url('/products/'.$p->slug));
    $categoryUrls = \App\Models\Category::where('is_active', true)->get(['slug'])->map(fn($c) => url('/category/'.$c->slug));
    $blogUrls = \App\Models\BlogPost::where('is_published', true)->get(['slug'])->map(fn($b) => url('/blog/'.$b->slug));

    $all = collect($urls)->concat($productUrls)->concat($categoryUrls)->concat($blogUrls);
    $xml = view('sitemap', ['urls' => $all])->render();
    return response($xml, 200)->header('Content-Type', 'application/xml');
});
