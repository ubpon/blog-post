<?php

namespace App\Http\Controllers\API\V1\Posts;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\PostResource;

class UserController extends Controller
{
    public function __invoke()
    {
        return PostResource::collection(auth()->user()->posts);
    }
}
