<?php

namespace App\Http\Controllers\API\V1\Users;

use App\Http\Controllers\Controller;
use App\Http\Requests\API\V1\Users\UpdateUserRequest;
use App\Http\Resources\V1\UserResource;
use App\Services\UserService;

class UserController extends Controller
{
    public function __construct(private readonly UserService $userService)
    {

    }

    public function update(UpdateUserRequest $request)
    {
        return new UserResource($this->userService->update($request->validated()));
    }
}
