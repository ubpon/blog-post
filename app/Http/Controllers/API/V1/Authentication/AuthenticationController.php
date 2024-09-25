<?php

namespace App\Http\Controllers\API\V1\Authentication;

use App\Http\Controllers\Controller;
use App\Http\Requests\API\V1\Authentication\RegisterRequest;
use App\Http\Resources\V1\UserResource;
use App\Permissions\V1\Abilities;
use App\Services\UserService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthenticationController extends Controller
{
    public function __construct(private readonly UserService $userService) {}

    public function register(RegisterRequest $request)
    {
        return new UserResource($this->userService->create($request->validated()));
    }

    public function login(Request $request)
    {
        if (Auth::attempt($request->only('email', 'password'))) {
            $user = Auth::user();

            return response()->json([
                'success' => true,
                'data' => [
                    'token' => $user->createToken(
                        'authentication',
                        Abilities::getAbilities($user),
                        now()->addWeek()
                    )->plainTextToken,
                    'user' => new UserResource($user),
                ],
                'message' => 'Authenticated',
            ], 200);
        }

        return response()->json([
            'success' => false,
            'message' => 'Invalid credentials',
        ], 404); // use 404 error code (Unauthenticated) for security
    }
}
