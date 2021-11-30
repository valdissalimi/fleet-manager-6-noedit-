<?php

/*
@copyright

Fleet Manager v6.0.0

Copyright (C) 2017-2021 Hyvikk Solutions <https://hyvikk.com/> All rights reserved.
Design and developed by Hyvikk Solutions <https://hyvikk.com/>

 */

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class WorkOrders extends Model
{
    use SoftDeletes;
    use HasFactory;
    protected $dates = ['deleted_at'];
    protected $table = 'work_orders';
    protected $fillable = ['user_id','vehicle_id', 'vendor_id','mechanic_id', 'required_by', 'status', 'description', 'meter', 'note', 'reference', 'price'];

    public function vehicle()
    {
        return $this->belongsTo("App\Model\VehicleModel", "vehicle_id", "id")->withTrashed();
    }

    public function vendor()
    {
        return $this->belongsTo("App\Model\Vendor", "vendor_id", "id")->withTrashed();
    }

    public function mechanic()
    {
        return $this->belongsTo("App\Model\Mechanic", "mechanic_id", "id")->withTrashed();
    }

    public function parts()
    {
        return $this->hasMany("App\Model\PartsUsedModel", "work_id", "id");
    }

}
