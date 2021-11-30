<?php

/*
@copyright

Fleet Manager v6.0.0

Copyright (C) 2017-2021 Hyvikk Solutions <https://hyvikk.com/> All rights reserved.
Design and developed by Hyvikk Solutions <https://hyvikk.com/>

 */

namespace App\Http\Middleware;

use Auth;
use Closure;

class AuthUser
{

    public function handle($request, Closure $next)
    {
        if (Auth::user() && Auth::user()->user_type == "C") {
            return $next($request);
        }

        return redirect("/#login");
    }
}
