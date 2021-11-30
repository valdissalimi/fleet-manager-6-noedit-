<?php

/*
@copyright

Fleet Manager v6.0.0

Copyright (C) 2017-2021 Hyvikk Solutions <https://hyvikk.com/> All rights reserved.
Design and developed by Hyvikk Solutions <https://hyvikk.com/>

 */
namespace App\Http\Controllers;

class FrontendController extends Controller
{
    public function index()
    {
        return view('frontend.index');
    }
}
