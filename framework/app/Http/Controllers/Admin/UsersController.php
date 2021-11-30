<?php

/*
@copyright

Fleet Manager v6.0.0

Copyright (C) 2017-2021 Hyvikk Solutions <https://hyvikk.com/> All rights reserved.
Design and developed by Hyvikk Solutions <https://hyvikk.com/>

 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\EditUserRequest;
use App\Http\Requests\UserRequest;
use App\Model\User;
use App\Model\VehicleGroupModel;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Redirect;
use Spatie\Permission\Models\Role;

class UsersController extends Controller
{
    public function __construct()
    {
       
        // $this->middleware(['role:Admin']);
        $this->middleware('permission:Users add',['only' => ['create']]);
        $this->middleware('permission:Users edit',['only' => ['edit']]);
        $this->middleware('permission:Users delete',['only' => ['bulk_delete', 'destroy']]);
        $this->middleware('permission:Users list');
    }
    public function index()
    {
        $index['data'] = User::whereUser_type("O")->orWhere('user_type', 'S')->get();
        return view("users.index", $index);
    }

    public function create()
    {
        $index['groups'] = VehicleGroupModel::all();
        $index['roles'] = Role::get();
        return view("users.create", $index);
    }

    public function destroy(Request $request)
    {
        User::find($request->get('id'))->delete();
        return redirect()->route('users.index');
    }

    private function upload_file($file, $field, $id)
    {
        $destinationPath = './uploads'; // upload path
        $extension = $file->getClientOriginalExtension();
        $fileName1 = Str::uuid() . '.' . $extension;

        $file->move($destinationPath, $fileName1);
        $user = User::find($id);
        $user->setMeta([$field => $fileName1]);
        $user->save();

    }

    public function store(UserRequest $request)
    {
        
        
        // if ($request->get('is_admin') == '1') {
        //     $user_type = 'S';
        // } else {
        //     $user_type = 'O';
        // }
        $role = Role::find($request->role_id)->toArray();
        
        if($role['name'] == "Super Admin")
        {
            $user_type = 'S';
        }
        else
        {
            $user_type = 'O';
        }
       
        $id = User::create([
            "name" => $request->get("first_name") . " " . $request->get("last_name"),
            "email" => $request->get("email"),
            "password" => bcrypt($request->get("password")),
            "user_type" => $user_type,
            "group_id" => $request->get("group_id"),
            'api_token' => str_random(60),
        ])->id;

        $user = User::find($id);
        $user->user_id = Auth::user()->id;
        $user->module = serialize($request->get('module'));
        $user->language = 'English-en';
        $user->first_name = $request->get("first_name");
        $user->last_name = $request->get("last_name");
        $user->save();
        $role = Role::find($request->role_id);
        $user->assignRole($role);
        if ($request->file('profile_image') && $request->file('profile_image')->isValid()) {
            $this->upload_file($request->file('profile_image'), "profile_image", $id);
        }
        return Redirect::route("users.index");

    }
    public function edit($id)
    {
        $user = User::find($id);
        $groups = VehicleGroupModel::all();
        $roles = Role::get();
        return view("users.edit", compact("user", 'groups',"roles"));
    }

    public function update(EditUserRequest $request)
    {
        
        $user = User::whereId($request->get("id"))->first();
        $user->name = $request->get("first_name") . " " . $request->get("last_name");
        $user->email = $request->get("email");
        $user->group_id = $request->get("group_id");
        $user->module = serialize($request->get('module'));
        $user->first_name = $request->get("first_name");
        $user->last_name = $request->get("last_name");
        $old = Role::find($user->roles->first()->id);
        if ($old != null) {
            $user->removeRole($old);
        }

        // $user->profile_image = $request->get('profile_image');
        $role = Role::find($request->role_id);
        
        if($role['name'] == "Super Admin")
        {
            $user->user_type = 'S';
        }
        else
        {
            $user->user_type = 'O';
        }
       
        $user->save();
        $role = Role::find($request->role_id);
        $user->assignRole($role);
        if ($request->file('profile_image') && $request->file('profile_image')->isValid()) {
            $this->upload_file($request->file('profile_image'), "profile_image", $user->id);
        }
        $modules = unserialize($user->getMeta('module'));
        // if (Auth::user()->id == $user->id && !(in_array(0, $modules))) {
        //     return redirect('admin/');
        // }
        return Redirect::route("users.index");
    }

    public function bulk_delete(Request $request)
    {
        // dd($request->all());
        User::whereIn('id', $request->ids)->delete();
        // return redirect('admin/customers');
        return back();
    }

}
