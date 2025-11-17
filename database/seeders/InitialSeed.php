<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Category;
use App\Models\Banner;
use App\Models\Product;
use Illuminate\Support\Str;

class InitialSeed extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Admin user
        User::query()->updateOrCreate(
            ['email' => 'admin@example.com'],
            [
                'name' => 'Admin',
                'password' => 'password',
                'is_admin' => true,
            ]
        );

        // Categories
        $categories = collect(['Camera Accessories', 'Mobile Accessories', 'Audio Gear', 'Lighting'])
            ->map(fn($name) => Category::firstOrCreate(['slug' => Str::slug($name)], ['name' => $name]));

        // Banners
        Banner::firstOrCreate(['title' => 'Elevate Your Shots'], [
            'subtitle' => 'Tripods and stabilizers',
            'image' => '',
            'sort_order' => 1,
            'is_active' => true,
        ]);

        // Sample products
        foreach ($categories as $category) {
            Product::firstOrCreate(['slug' => Str::slug($category->name.' Pro')], [
                'category_id' => $category->id,
                'name' => $category->name.' Pro',
                'sku' => strtoupper(Str::random(8)),
                'short_description' => 'Creator-grade performance in a compact form.',
                'price' => rand(1999, 9999) / 100,
                'is_featured' => true,
                'is_active' => true,
            ]);
        }
    }
}
