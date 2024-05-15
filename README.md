## Thank you!
Thank you for giving me a second chance to this technical exam. I am so grateful for this.

## Installation
1. Clone the repository ```https://github.com/ubpon/blog-post.git```
2. Copy ```.env.sample``` as ```.env```
3. Run these commands
```php
    cd blog-post // or equivalent cloned name
    composer install
    php artisan key:generate 
    php artisan migrate --seed or import the sql database raksoct.sql found from root folder
    php artisan test
    php artisan serve
```

## Testing
You can randomly choose user from the seeded data and login

## Enhancement
We can strictly use the JSON:API or the package ```timacdonald/json-api``` in handling API response.
Currently, I just did the basic, for me to finish this technical exam.
Moreover, we can still enhance the policy used.