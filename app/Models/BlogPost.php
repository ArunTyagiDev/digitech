<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BlogPost extends Model
{
    protected $fillable = [
        'title',
        'slug',
        'excerpt',
        'content',
        'image',
        'tags',
        'published_at',
        'is_published',
        'meta_title',
        'meta_description',
    ];

    protected $casts = [
        'tags' => 'array',
        'published_at' => 'datetime',
        'is_published' => 'boolean',
    ];
}
