<?php

use App\Quiz;
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
*/

Route::post('signUp', 'Auth\AuthController@signUp');
Route::post('login', 'Auth\AuthController@login');
Route::middleware('auth:api')->get('/profile','Auth\AuthController@getUser');
Route::middleware('auth:api')->get('/logout','Auth\AuthController@logout');

Route::apiResources([
    'quizzes' => 'QuizController',
    'questions' => 'QuestionController',
    'answers' => 'AnswerController',
    'users' => 'UserController',
]);

Route::get('/quizzes/{quiz}/questions', 'QuestionController@indexForQuiz');
Route::get('/questions/{question}/answers', 'AnswerController@indexForQuestion');
Route::get('/users', 'UserController@index');