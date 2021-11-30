<?php

namespace App\Imports;

use App\Model\User;
use Maatwebsite\Excel\Concerns\ToModel;
use Spatie\Permission\Models\Permission;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class DriverImport implements ToModel, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $driver)
    {
        if ($driver['email'] != null) 
        {
            $id = User::create([
                "name" => $driver['first_name'] . " " . $driver['last_name'],
                "email" => $driver['email'],
                "password" => bcrypt($driver['password']),
                "user_type" => "D",
                'api_token' => str_random(60),
            ])->id;
            $user = User::find($id);

            $user->is_active = 1;
            $user->is_available = 0;
            $user->first_name = $driver['first_name'];
            $user->middle_name = $driver['middle_name'];
            $user->last_name = $driver['last_name'];
            $user->address = $driver['address'];
            $user->phone = $driver['phone'];
            $user->phone_code = "+" . $driver['country_code'];
            $user->emp_id = $driver['employee_id'];
            $user->contract_number = $driver['contract_number'];
            $user->license_number = $driver['licence_number'];
            if ($driver['issue_date'] != null) {
                $user->issue_date = date('Y-m-d', strtotime($driver['issue_date']));
            }

            if ($driver['expiration_date'] != null) {
                $user->exp_date = date('Y-m-d', strtotime($driver['expiration_date']));
            }

            if ($driver['join_date'] != null) {
                $user->start_date = date('Y-m-d', strtotime($driver['join_date']));
            }

            if ($driver['leave_date'] != null) {
                $user->end_date = date('Y-m-d', strtotime($driver['leave_date']));
            }

            $user->gender = (($driver['gender'] == 'female') ? 0 : 1);
            $user->econtact = $driver['emergency_contact_details'];
            $user->givePermissionTo(['Notes add','Notes edit','Notes delete','Notes list','Drivers list']);
            $user->save();
        }
    }
}
