<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\BlogPost;
use Illuminate\Http\Request;

class BlogController extends Controller
{
    public function index()
    {
        $posts = BlogPost::query()
            ->where('is_published', true)
            ->latest('published_at')
            ->paginate(9);

        return view('front.blog.index', compact('posts'));
    }

    public function show(string $slug)
    {
        $post = BlogPost::where('slug', $slug)->where('is_published', true)->firstOrFail();
        $recent = BlogPost::where('is_published', true)->where('id', '!=', $post->id)->latest('published_at')->take(5)->get();

        return view('front.blog.show', compact('post', 'recent'));
    }
}
