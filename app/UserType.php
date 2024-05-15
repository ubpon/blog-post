<?php

namespace App;

enum UserType: string
{
    case Admin = 'admin';
    case User = 'user';
    case Manager = 'manager';
    case Publisher = 'publisher';
}
