<?php

/*
@copyright

Fleet Manager v6.0.0

Copyright (C) 2017-2021 Hyvikk Solutions <https://hyvikk.com/> All rights reserved.
Design and developed by Hyvikk Solutions <https://hyvikk.com/>

 */

namespace App\Model;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Kodeine\Metable\Metable;
use Laravel\Passport\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class User extends Authenticatable
{
    use Metable;
    use SoftDeletes;
    use Notifiable;
    use HasApiTokens;
    use HasRoles;
    use HasFactory;
    protected $dates = ['deleted_at'];
    protected $table = "users";
    protected $metaTable = 'users_meta'; //optional.
    protected $fillable = [
        'name', 'email', 'password', 'user_type', 'group_id', 'api_token',
    ];

    protected $hidden = ['password', 'remember_token', 'api_token'];

    protected function getMetaKeyName()
    {
        return 'user_id'; // The parent foreign key
    }

    public function user_data()
    {
        return $this->hasMany("App\Model\UserData", 'user_id', 'id')->withTrashed();
    }

    public function vehicle_detail()
    {
        return $this->hasMany('App\Model\VehicleModel', 'user_id', 'id')->withTrashed();
    }

    public function driver_vehicle()
    {
        return $this->hasOne("App\Model\DriverVehicleModel", "driver_id", "id");
    }

}
