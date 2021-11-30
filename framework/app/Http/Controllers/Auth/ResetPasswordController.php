<?php

/*
@copyright

Fleet Manager v6.0.0

Copyright (C) 2017-2021 Hyvikk Solutions <https://hyvikk.com/> All rights reserved.
Design and developed by Hyvikk Solutions <https://hyvikk.com/>

 */
namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ResetsPasswords;
use Hyvikk;
use App;

class ResetPasswordController extends Controller
{

    use ResetsPasswords;

    protected $redirectTo = 'admin/';

    public function __construct()
    {
        App::setLocale(Hyvikk::get('language'));
        $this->middleware('guest');
    }
}
