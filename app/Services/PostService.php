<?php

namespace App\Services;

use App\Jobs\SendNewPostJob;
use App\Models\Post;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

class PostService
{
    public function index(?string $filter)
    {
        try {
           return Post::query()->search($filter)->paginate(25);
        } catch (\Exception $e) {
            throw new \Exception($e->getMessage());
        }
    }
    public function create(array $data): Model
    {
        try {
            $post = tap(auth()->user()->posts())->create($data);

            SendNewPostJob::dispatch($post)->delay(now()->addMinute());

            return $post;
        } catch (\Exception $e) {
            throw new \Exception($e->getMessage());
        }
    }

    public function find(int $id): Model
    {
        try {
            return Post::query()->find($id);
        } catch (\Exception $e) {
            throw new ModelNotFoundException($e->getMessage());
        }
    }

    public function update(Post $post, array $data): Model
    {
        try {
            return tap($post)->update($data);
        } catch (\Exception $e) {
            throw new ModelNotFoundException($e->getMessage());
        }
    }
}
