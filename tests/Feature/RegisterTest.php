<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Str;
use Tests\TestCase;

class RegisterTest extends TestCase
{
    use RefreshDatabase;

    /**
     * A basic feature test example.
     */
    public function test_can_register_a_user(): void
    {
        $password = Str::random(16);

        $response = $this->postJson('/api/register/', [
            'name' => fake()->name(),
            'email' => fake()->email(),
            'password' => $password,
            'password_confirmation' => $password,
        ]);

        $response->assertCreated();
    }

    public function test_cannot_register_a_user_when_password_not_equal()
    {
        $password = Str::random(16);

        $response = $this->postJson('/api/register/', [
            'name' => fake()->name(),
            'email' => fake()->email(),
            'password' => 'helloworld',
            'password_confirmation' => $password,
        ]);

        $response->assertUnprocessable();
    }

    public function test_cannot_register_user_when_name_is_empty()
    {
        $password = Str::random(16);

        $response = $this->postJson('/api/register/', [
            'name' => '',
            'email' => fake()->email(),
            'password' => 'helloworld',
            'password_confirmation' => $password,
        ]);

        $response->assertUnprocessable();
    }

    public function test_cannot_register_user_when_password_less_than_8_characters()
    {
        $password = Str::random(6);

        $response = $this->postJson('/api/register/', [
            'name' => fake()->name(),
            'email' => fake()->email(),
            'password' => $password,
            'password_confirmation' => $password,
        ]);

        $response->assertUnprocessable();
    }
}
