<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Quiz extends Model
{
    protected $fillable = [
        'title',
        'description'
    ];

    public static function boot()
    {
        parent::boot();
        static::creating(function ($quiz) {
            $user = Auth::user();
            $quiz->user_id = $user->id;
        });
    }

    public function owner()
    {
        return $this->belongsTo(User::class);
    }

    public function questions()
    {
        return $this->hasMany(Question::class);
    }
}
