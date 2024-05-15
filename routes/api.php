<?php

use App\Http\Controllers\API\V1\Authentication\AuthenticationController;
use App\Http\Controllers\API\V1\Posts\PostController;
use App\Http\Controllers\API\V1\Posts\UserController;
use App\Http\Controllers\API\V1\Users\UserController as APIUserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::controller(AuthenticationController::class)->group(function () {
    Route::post('/register', 'register')->name('register');
    Route::post('/login', 'login')->name('login');
});

Route::middleware('auth:sanctum')->group(function () {
    Route::apiResource('posts', PostController::class);
    Route::post('users/profile', [APIUserController::class, 'update']);
    Route::get('/users/{id}/posts', UserController::class);
});
