<?php

namespace App\Http\Controllers\API\V1\Posts;

use App\Http\Controllers\Controller;
use App\Http\Requests\API\V1\Post\CreatePostRequest;
use App\Http\Requests\API\V1\Post\UpdatePostRequest;
use App\Http\Resources\V1\PostResource;
use App\Models\Post;
use App\Services\PostService;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class UserController extends Controller
{
    public function __invoke()
    {
        return PostResource::collection(auth()->user()->posts);
    }
}
