<?php

namespace App\Http\Controllers;

use App\Question;
use App\Quiz;
use Illuminate\Http\Request;

class QuestionController extends Controller
{
    /**
     * QuestionController constructor.
     */
    public function __construct()
    {
        $this->middleware('auth:api');
        $this->authorizeResource(Question::class, 'question');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $questions = Question::all();
        return response($questions);
    }

    public function indexForQuiz(Quiz $quiz)
    {
        $questions = Question::ofQuiz($quiz);
        return response($questions);
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
            'quiz_id' => 'required',
            'title' => 'required',
            'questionText' => 'required'
        ]);

        $question = new Question([
            'quiz_id' => $request->get('quiz_id'),
            'title' => $request->get('title'),
            'questionText' => $request->get('questionText'),
        ]);

        $question->save();

        return response($question);
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Question $question
     * @return \Illuminate\Http\Response
     */
    public function show(Question $question)
    {
        return response($question);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Question $question
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Question $question)
    {
        $request->validate([
            'quiz_id' => 'required',
            'title' => 'required',
            'questionText' => 'required'
        ]);

        $question->fill($request->all());
        $question->save();

        return response(null, 204);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Question $question
     * @return \Illuminate\Http\Response
     */
    public function destroy(Question $question)
    {
        $question->delete();
        return response(null, 204);
    }
}
