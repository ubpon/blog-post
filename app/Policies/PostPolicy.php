<?php

namespace App\Policies;

use App\Models\Post;
use App\Models\User;
use App\Permissions\V1\Abilities;

class PostPolicy
{
    public function before(User $user): ?bool
    {
        if ($user->type === 'admin') {
            return true;
        }

        return null;
    }

    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        return $user->tokenCan(Abilities::ShowPost);
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, Post $post): bool
    {
        return $user->tokenCan(Abilities::ShowPost);
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        return $user->tokenCan(Abilities::CreatePost);
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, Post $post): bool
    {
        return ($user->tokenCan(Abilities::UpdateOwnPost) && $user->id === $post->user_id)
            || $user->tokenCan(Abilities::UpdatePost);
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, Post $post): bool
    {
        return ($user->tokenCan(Abilities::DeleteOwnPost) && $user->id === $post->user_id)
            || $user->tokenCan(Abilities::DeletePost);
    }
}
