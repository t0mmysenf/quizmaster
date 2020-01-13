<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;


class QuizCompletion extends Model
{
    protected $fillable = [
        'points',
        'userId'
    ];

    public static function boot()
    {
        parent::boot();
        static::creating(function ($quiz) {
            $user = Auth::user();
            $quiz->user_id = $user->id;
        });
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function quiz()
    {
        return $this->belongsTo(Question::class);
    }
}