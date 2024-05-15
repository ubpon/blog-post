<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class Post extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $guarded = [];

    public function scopeSearch(Builder $query, string $filter)
    {
        $query->when($filter, function ($query) use ($filter) {
            return $query->where('title', 'LIKE', "%{$filter}%")
                ->orWhere('content', 'LIKE', "%{$filter}%");
        });
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
