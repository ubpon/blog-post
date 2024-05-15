<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Str;
use Tests\TestCase;

class LoginTest extends TestCase
{
    use RefreshDatabase;

    /**
     * A basic feature test example.
     */
    public function test_can_login_a_user(): void
    {
        $password = Str::random(16);
        $user = User::factory()->state(['password' => $password])->create();

        $response = $this->postJson('/api/login/', [
            'password' => $password,
            'email' => $user->email,
        ]);

        $response
            ->assertStatus(200)
            ->assertJsonStructure([
                'success',
                'data',
                'message',
            ]);
    }

    public function test_cannot_login_user_when_creds_are_invalid()
    {
        $password = Str::random(16);
        $user = User::factory()->state(['password' => $password])->create();

        $response = $this->postJson('/api/login/', [
            'password' => 'helloworld',
            'email' => $user->email,
        ]);

        $response
            ->assertStatus(404)
            ->assertJsonStructure([
                'success',
                'message',
            ]);
    }

    public function test_cannot_login_user_when_email_is_invalid()
    {
        $password = Str::random(16);
        $user = User::factory()->state(['password' => $password])->create();

        $response = $this->postJson('/api/login/', [
            'password' => $password,
            'email' => 'helloworld@example.com',
        ]);

        $response
            ->assertStatus(404)
            ->assertJsonStructure([
                'success',
                'message',
            ]);
    }

    public function test_can_update_profile()
    {
        $user = User::factory()->create();
        $password = Str::random(16);
        $this->actingAs($user)
            ->postJson('/api/users/profile', [
            'name' => 'Faidz Ubpon',
            'email' => 'faidz@ubpon.com',
            'password' => $password,
            'password_confirmation' => $password
        ])
            ->assertStatus(200)
            ->assertJsonStructure([
                'data' => [
                    'type',
                    'id',
                    'attributes' => []
                ]
            ]);
    }

    public function test_cannot_update_profile_when_password_does_not_match()
    {
        $user = User::factory()->create();
        $password = Str::random(16);
        $this->actingAs($user)
            ->postJson('/api/users/profile', [
                'name' => 'Faidz Ubpon',
                'email' => 'faidz@ubpon.com',
                'password' => $password,
                'password_confirmation' => 'helloworld'
            ])
            ->assertUnprocessable();
    }
}
