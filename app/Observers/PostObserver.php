<?php

namespace App\Observers;

use App\Jobs\SendNewPostJob;
use App\Models\Post;

class PostObserver
{
    public function created(Post $post)
    {
        auth()->user()
            ->auditTrail()
            ->create([
                'previous_data' => json_encode([]),
                'current_data' => $post->toArray(),
                'type' => 'create',
                'from_table' => Post::class,
                'from_table_id' => $post->id,
            ]);

        SendNewPostJob::dispatch($post)->delay(now()->addMinute());
    }

    public function updating(Post $post)
    {
        session()->put('current_data', $post->toArray());
    }

    public function updated(Post $post)
    {
        auth()->user()
            ->auditTrail()
            ->create([
                'previous_data' => session()->get('current_data'),
                'current_data' => $post->toArray(),
                'type' => 'update',
                'from_table' => Post::class,
                'from_table_id' => $post->id,
            ]);
        session()->put('current_data', null);
    }

    public function deleted(Post $post)
    {
        auth()->user()
            ->auditTrail()
            ->create([
                'previous_data' => $post->toArray(),
                'current_data' => [],
                'type' => 'delete',
                'from_table' => Post::class,
                'from_table_id' => $post->id,
            ]);
    }
}
