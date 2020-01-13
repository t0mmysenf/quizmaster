<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    /**
     * QuizController constructor.
     */
    public function __construct()
    {
        $this->middleware('auth:api');
        $this->authorizeResource(User::class, 'user');
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

       /* $users = User::all(); */
        
        $users = \DB::table('users')
            ->orderBy('points', 'desc')
            ->get();

        return response($users);
    }


    /**
     * Display the specified resource.
     *
     * @param \App\Quiz $quiz
     * @return \Illuminate\Http\Response
     */
    public function show(Quiz $quiz)
    {
        return response($quiz);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Quiz $quiz
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Quiz $quiz)
    {
        $request->validate([
            'title' => 'required',
        ]);

        $quiz->fill($request->all());
        $quiz->save();

        return response(null, 204);
    }
}
