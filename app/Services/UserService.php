<?php

namespace App\Services;

use App\Models\User;

class UserService
{
    public function create(array $data)
    {
        try {
            return User::query()->create($data);
        } catch (\Exception $e) {
            throw new \Exception($e->getMessage());
        }
    }

    public function update(array $data)
    {
        try {
            return tap(auth()->user())->update($data);
        } catch (\Exception $e) {
            throw new \Exception($e->getMessage());
        }
    }
}
