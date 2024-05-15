
<h1>{{$post->title}}</h1>
<small>Created: {{ $post->created_at->format('M d, Y H:i:s') }}</small>
<small>Updated: {{ $post->updated_at->format('M d, Y H:i:s') }}</small>

<p>{!! $post->content !!}</p>