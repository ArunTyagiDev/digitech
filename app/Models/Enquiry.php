<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Enquiry extends Model
{
    protected $fillable = [
        'name',
        'email',
        'phone',
        'message',
        'items',
        'status',
        'admin_notes',
    ];

    protected $casts = [
        'items' => 'array',
    ];
}
