<?php

/*
@copyright

Fleet Manager v6.0.0

Copyright (C) 2017-2021 Hyvikk Solutions <https://hyvikk.com/> All rights reserved.
Design and developed by Hyvikk Solutions <https://hyvikk.com/>

 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Customers as CustomerRequest;
use App\Http\Requests\ImportRequest;
use App\Model\User;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Imports\CustomerImport;
use Maatwebsite\Excel\Facades\Excel;
use Validator;
use Auth;


class CustomersController extends Controller
{
    public function __construct()
    {
        // $this->middleware(['role:Admin']);
        $this->middleware('permission:Customer add',['only' => ['create']]);
        $this->middleware('permission:Customer edit',['only' => ['edit']]);
        $this->middleware('permission:Customer delete',['only' => ['bulk_delete', 'destroy']]);
        $this->middleware('permission:Customer list');
        $this->middleware('permission:Customer import',['only' => ['importCutomers']]);
    }

    public function importCutomers(ImportRequest $request)
    {

        $file = $request->excel;
        $destinationPath = './assets/samples/'; // upload path
        $extension = $file->getClientOriginalExtension();
        $fileName = Str::uuid() . '.' . $extension;
        $file->move($destinationPath, $fileName);
        // dd($fileName);
        Excel::import(new CustomerImport, 'assets/samples/' .$fileName);

        // $excel = Importer::make('Excel');
        // $excel->load('assets/samples/' . $fileName);
        // $collection = $excel->getCollection()->toArray();
        // array_shift($collection);
        // // dd($collection);
        // foreach ($collection as $customer) {
        //     if ($customer[3] != null) {
        //         $id = User::create([
        //             "name" => $customer[0] . " " . $customer[1],
        //             "email" => $customer[3],
        //             "password" => bcrypt($customer[6]),
        //             "user_type" => "C",
        //             "api_token" => str_random(60),
        //         ])->id;
        //         $user = User::find($id);
        //         $user->first_name = $customer[0];
        //         $user->last_name = $customer[1];
        //         $user->address = $customer[5];
        //         $user->mobno = $customer[2];
        //         if ($customer[4] == "female") {
        //             $user->gender = 0;
        //         } else {
        //             $user->gender = 1;
        //         }
        //         $user->save();
        //         $user->givePermissionTo(['Bookings add','Bookings edit','Bookings list','Bookings delete']);
        //     }
        // }
        return back();
    }

    public function index()
    {
        $data['data'] = User::whereUser_type("C")->orderBy('id', 'desc')->get();
        return view("customers.index", $data);
    }
    public function create()
    {
        return view("customers.create");
    }
    public function store(CustomerRequest $request)
    {

        $id = User::create([
            "name" => $request->get("first_name") . " " . $request->get("last_name"),
            "email" => $request->get("email"),
            "password" => bcrypt("password"),
            "user_type" => "C",
            "api_token" => str_random(60),
        ])->id;
        $user = User::find($id);
        $user->user_id = Auth::user()->id;
        $user->first_name = $request->get("first_name");
        $user->last_name = $request->get("last_name");
        $user->address = $request->get("address");
        $user->mobno = $request->get("phone");
        $user->gender = $request->get('gender');
        $user->save();
        $user->givePermissionTo(['Bookings add','Bookings edit','Bookings list','Bookings delete']);

        return redirect()->route("customers.index");
    }
    public function ajax_store(Request $request)
    {
        $v = Validator::make($request->all(), [
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'unique:users,email',
            'phone' => 'numeric',
        ]);

        if ($v->fails()) {
            $d = 0;

        } else {
            $id = User::create([
                "name" => $request->get("first_name") . " " . $request->get("last_name"),
                "email" => $request->get("email"),
                "password" => bcrypt("password"),
                "user_type" => "C",
                "api_token" => str_random(60),
            ])->id;
            $user = User::find($id);
            $user->first_name = $request->get("first_name");
            $user->last_name = $request->get("last_name");
            $user->address = $request->get("address");
            $user->mobno = $request->get("phone");
            $user->gender = $request->get('gender');
            $user->save();
            $user->givePermissionTo(['Bookings add','Bookings edit','Bookings list','Bookings delete']);
            $d = User::whereUser_type("C")->get(["id", "name as text"]);

        }

        return $d;

    }
    public function destroy(Request $request)
    {
        // User::find($request->get('id'))->get_detail()->delete();
        User::find($request->get('id'))->user_data()->delete();
        $user = User::find($request->get('id'))->delete();
        
        return redirect()->route('customers.index');
    }

    public function edit($id)
    {
        $index['data'] = User::whereId($id)->first();
        return view("customers.edit", $index);
    }
    public function update(CustomerRequest $request)
    {

        $user = User::find($request->id);
        $user->name = $request->get("first_name") . " " . $request->get("last_name");
        $user->email = $request->get('email');
        // $user->password = bcrypt($request->get("password"));
        // $user->save();
        $user->first_name = $request->get("first_name");
        $user->last_name = $request->get("last_name");
        $user->address = $request->get("address");
        $user->mobno = $request->get("phone");
        $user->gender = $request->get('gender');
        $user->save();

        return redirect()->route("customers.index");
    }

    public function bulk_delete(Request $request)
    {
        // dd($request->all());
        User::whereIn('id', $request->ids)->delete();
        // return redirect('admin/customers');
        return back();
    }
}
