<?php

namespace App\Permissions\V1;

use App\UserType;

final class Abilities
{
    public const CreatePost = 'post:create';

    public const UpdatePost = 'post:update';

    public const DeletePost = 'post:delete';

    public const ShowPost = 'post:show';

    public const CreateUser = 'user:create';

    public const UpdateUser = 'user:update';

    public const DeleteUser = 'user:delete';

    public const ShowUser = 'user:view';

    public const UpdateOwnPost = 'post:own:update';

    public const DeleteOwnPost = 'post:own:delete';

    public const UpdateOwnProfile = 'user:own:update';

    public const DeleteOwnProfile = 'user:own:delete';

    public static function getAbilities($user): array
    {
        return match ($user->type) {
            UserType::User => [
                self::CreatePost,
                self::UpdateOwnPost,
                self::DeleteOwnPost,
                self::CreateUser,
                self::UpdateOwnProfile,
                self::DeleteOwnProfile,
            ],
            UserType::Publisher => [
                self::CreatePost,
                self::UpdateOwnPost,
                self::DeleteOwnPost,
            ],
            UserType::Manager => [
                self::UpdateOwnPost,
                self::DeleteOwnPost,
                self::CreateUser,
                self::UpdateOwnProfile,
                self::DeleteOwnProfile,
            ],
            default => [
                self::CreatePost,
                self::UpdatePost,
                self::DeletePost,
                self::ShowPost,
                self::CreateUser,
                self::UpdateUser,
                self::DeleteUser,
                self::ShowUser,
            ],
        };
    }
}
