<?php
/*
@copyright

Fleet Manager v6.0.0

Copyright (C) 2017-2021 Hyvikk Solutions <https://hyvikk.com/> All rights reserved.
Design and developed by Hyvikk Solutions <https://hyvikk.com/>

 */
namespace App\Listeners;

use Artisan;

class LoginListener
{

    public function __construct()
    {

    }

    public function handle($event)
    {

        // Artisan::call('notification:generate');
        Artisan::call('schedule:run');
    }
}
