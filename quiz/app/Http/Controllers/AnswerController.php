<?php

namespace App\Http\Controllers;

use App\Answer;
use App\Question;
use Illuminate\Http\Request;

class AnswerController extends Controller
{
    /**
     * AnswerController constructor.
     */
    public function __construct()
    {
        $this->middleware('auth:api');
        $this->authorizeResource(Answer::class, 'answer');
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $answers = Answer::all();
        return response($answers);
    }

    public function indexForQuestion(Question $question)
    {
        $answers = Answer::ofQuestion($question);
        return response($answers);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'question_id' => 'required',
            'answerText' => 'required',
            'isCorrect' => 'required'
        ]);

        $answer = new Answer([
            'question_id' => $request->get('question_id'),
            'answerText' => $request->get('answerText'),
            'isCorrect' => $request->get('isCorrect'),
        ]);

        $answer->save();

        return response(null, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Answer $answer
     * @return \Illuminate\Http\Response
     */
    public function show(Answer $answer)
    {
        return response($answer);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Answer $answer
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Answer $answer)
    {
        $request->validate([
            'question_id' => 'required',
            'answerText' => 'required',
            'isCorrect' => 'required'
        ]);

        $answer->fill($request->all());
        $answer->save();

        return response(null, 204);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Answer $answer
     * @return \Illuminate\Http\Response
     */
    public function destroy(Answer $answer)
    {
        $answer->delete();
        return response(null, 204);
    }
}