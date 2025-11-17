<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Order extends Model
{
    protected $fillable = [
        'user_id', 'name', 'email', 'phone', 'address', 'notes',
        'subtotal', 'total', 'status', 'payment_method', 'payment_reference', 'paid_at',
    ];

    protected $casts = [
        'subtotal' => 'decimal:2',
        'total' => 'decimal:2',
        'paid_at' => 'datetime',
    ];

    public function items(): HasMany
    {
        return $this->hasMany(OrderItem::class);
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

	/**
	 * Extract stored payment screenshot relative path from notes, if present.
	 */
	public function getPaymentScreenshotPathAttribute(): ?string
	{
		if (empty($this->notes)) {
			return null;
		}
		if (preg_match('/Payment screenshot:\s*([^\s]+)\b/i', (string) $this->notes, $matches)) {
			return $matches[1] ?? null;
		}
		return null;
	}

	/**
	 * Build full URL for the payment screenshot.
	 */
	public function getPaymentScreenshotUrlAttribute(): ?string
	{
		$path = $this->payment_screenshot_path;
		return $path ? asset($path) : null;
	}
}
