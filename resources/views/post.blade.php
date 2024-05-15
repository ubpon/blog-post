<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Posts') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                @foreach($posts as $post)
                <div class="p-6 text-gray-900">
                    <h3>{{$post->title}}</h3>
                    <p>{{$post->content}}</p>
                </div>
                @endforeach
                <div class="mt-5">
                    {{$posts->links()}}
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
