<?php

/*
@copyright

Fleet Manager v6.0.0

Copyright (C) 2017-2021 Hyvikk Solutions <https://hyvikk.com/> All rights reserved.
Design and developed by Hyvikk Solutions <https://hyvikk.com/>

 */

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class BookingPaymentsModel extends Model
{
    protected $table = "booking_payments";
    protected $fillable = ['booking_id', 'method', 'amount', 'payment_details', 'transaction_id', 'payment_status'];

    public function booking()
    {
        return $this->hasOne("App\Model\Bookings", "id", "booking_id")->withTrashed();
    }
}
