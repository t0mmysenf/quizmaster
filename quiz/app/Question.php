<?php

namespace App;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{

    protected $fillable = [
        'quiz_id',
        'title',
        'questionText',
        'isYesNo',
    ];

    public function scopeOfQuiz(Builder $query, Quiz $quiz)
    {
        return $query->where('quiz_id', $quiz->id)->get();
    }

    public function quiz()
    {
        return $this->belongsTo(Quiz::class);
    }

    public function answers()
    {
        return $this->hasMany(Answer::class);
    }
}
