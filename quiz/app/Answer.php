<?php

namespace App;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Answer extends Model
{
    protected $fillable = [
        'question_id',
        'answerText',
        'isCorrect',
    ];

    public function scopeOfQuestion(Builder $query, Question $question)
    {
        return $query->where('question_id', $question->id)->get();
    }

    public function question()
    {
        return $this->belongsTo(Question::class);
    }
}
