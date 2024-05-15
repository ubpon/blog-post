<?php

namespace Database\Seeders;

use App\Models\Post;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\UserType;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Event;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $users = User::factory(10)->state(['type' => UserType::User])->create();
        $users->each(function ($user) {
            Event::fake();
            Post::factory()->state(['user_id' => $user->id])->count(10)->create();
        });
        User::factory(2)->state(['type' => UserType::Admin])->create();
        User::factory(2)->state(['type' => UserType::Publisher])->create();
        User::factory(2)->state(['type' => UserType::Manager])->create();

        User::factory()->create([
            'name' => 'Test User',
            'email' => 'test@example.com',
        ]);
    }
}
