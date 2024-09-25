<?php

namespace App\Services;

use App\Models\User;
use Exception;

class UserService
{
    public function create(array $data)
    {
        return rescue(function () use ($data) {
            return User::query()->create($data);
        }, function (Exception $e) {
            throw new Exception($e->getMessage());
        });
    }

    public function update(array $data)
    {
        return rescue(function () use ($data) {
            return tap(auth()->user())->update($data);
        }, function (Exception $e) {
            throw new Exception($e->getMessage());
        });
    }
}
