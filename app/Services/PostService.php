<?php

namespace App\Services;

use App\Models\Post;
use Exception;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class PostService
{
    public function index(?string $filter)
    {
        return rescue(function () use ($filter) {
            return Post::query()->search($filter)->paginate(25);
        }, function (Exception $e) {
            throw new \Exception($e->getMessage());
        });
    }

    public function create(array $data): Model
    {
        return rescue(function () use ($data) {
            $post = tap(auth()->user()->posts())->create($data);
        }, function (Exception $e) {
            throw new \Exception($e->getMessage());
        });
    }

    public function find(int $id): Model
    {
        return rescue(function () use ($id) {
            return Post::query()->find($id);
        }, function (Exception $e) {
            throw new ModelNotFoundException($e->getMessage());
        });
    }

    public function update(Post $post, array $data): Model
    {
        return rescue(function () use ($post, $data) {
            return tap($post)->update($data);
        }, function (Exception $e) {
            throw new ModelNotFoundException($e->getMessage());
        });
    }
}
