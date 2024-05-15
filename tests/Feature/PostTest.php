<?php

namespace Tests\Feature;

use App\Jobs\SendNewPostJob;
use App\Models\Post;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Event;
use Tests\TestCase;

class PostTest extends TestCase
{
    use RefreshDatabase;

    public function test_can_list_all_posts()
    {
        Event::fake();
        Post::factory()->count(10)->create();
        $user = User::factory()->create();

        $this->actingAs($user)
            ->getJson('/api/posts')
            ->assertJsonCount(10, 'data')
            ->assertStatus(200);
    }

    public function test_can_list_only_1_posts_when_filter()
    {
        Event::fake();
        $title = fake()->sentence().' faidz';
        Post::factory()->state(['title' => $title])->create();
        Post::factory()->count(10)->create();
        $user = User::factory()->create();

        $this->actingAs($user)
            ->getJson('/api/posts?filter=faidz')
            ->assertJsonCount(1, 'data')
            ->assertStatus(200);
    }

    public function test_can_list_only_own_posts()
    {
        Event::fake();
        $user = User::factory()->create();
        Post::factory()->state(['user_id' => $user->id])->count(10)->create();
        Post::factory()->count(10)->create();

        $this->actingAs($user)
            ->getJson('/api/users/'.$user->id.'/posts')
            ->assertJsonCount(10, 'data')
            ->assertStatus(200);
    }

    public function test_can_create_post(): void
    {
        Event::fake();

        $user = User::factory()->create();
        $postData = Post::factory()->make();

        $this->actingAs($user)
            ->postJson('/api/posts', $postData->toArray());

        Event::assertNotDispatched(SendNewPostJob::class);

        $this->assertDatabaseHas('posts', [
            'title' => $postData->title,
        ]);
    }

    public function test_cannot_create_post_when_title_is_empty(): void
    {
        Event::fake();
        $user = User::factory()->create();
        $postData = Post::factory()->make();

        $this->actingAs($user)
            ->postJson('/api/posts', [
                'title' => '',
                'content' => $postData->content,
            ])
            ->assertUnprocessable();
    }

    public function test_can_update_post(): void
    {
        Event::fake();
        $user = User::factory()->create();
        $post = Post::factory()->create();
        $postData = Post::factory()->make();

        $this->actingAs($user)
            ->putJson('/api/posts/'.$post->id, $postData->toArray())
            ->assertStatus(200)
            ->assertSee($postData->title)
            ->assertSee($postData->content);
    }

    public function test_cannot_update_post_when_not_found(): void
    {
        Event::fake();
        $user = User::factory()->create();
        $post = Post::factory()->create();
        $postData = Post::factory()->make();

        $this->actingAs($user)
            ->putJson('/api/posts/100', $postData->toArray())
            ->assertNotFound();
    }

    public function test_can_show_post()
    {
        Event::fake();
        $user = User::factory()->create();
        $post = Post::factory()->create();

        $this->actingAs($user)
            ->getJson('/api/posts/'.$post->id)
            ->assertStatus(200);
    }

    public function test_cannot_show_post()
    {
        Event::fake();
        $user = User::factory()->create();

        $this->actingAs($user)
            ->getJson('/api/posts/12')
            ->assertNotFound();
    }

    public function test_can_delete_post()
    {
        Event::fake();
        $user = User::factory()->create();
        $post = Post::factory()->create();

        $this->actingAs($user)
            ->deleteJson('/api/posts/'.$post->id)
            ->assertNoContent();
    }

    public function test_cannot_delete_post_when_not_found()
    {
        Event::fake();
        $user = User::factory()->create();

        $this->actingAs($user)
            ->deleteJson('/api/posts/12')
            ->assertNotFound();
    }
}
