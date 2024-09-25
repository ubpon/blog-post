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

class PostController extends Controller
{
    public function __construct(private readonly PostService $postService) {}

    public function index(Request $request)
    {
        return PostResource::collection($this->postService->index($request->input('filter') ?? ''));
    }

    public function store(CreatePostRequest $request)
    {
        $data = $request->validated();
        $data['slug'] = Str::slug($data['title']);

        return new PostResource($this->postService->create($data));
    }

    public function update(UpdatePostRequest $request, Post $post): PostResource
    {
        return new PostResource($this->postService->update($post, $request->validated()));
    }

    public function show(Post $post): PostResource
    {
        return new PostResource($post);
    }

    public function destroy(Post $post)
    {
        $post->delete();

        return response()->noContent();
    }
}
