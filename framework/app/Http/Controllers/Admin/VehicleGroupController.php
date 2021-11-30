<?php

/*
@copyright

Fleet Manager v6.0.0

Copyright (C) 2017-2021 Hyvikk Solutions <https://hyvikk.com/> All rights reserved.
Design and developed by Hyvikk Solutions <https://hyvikk.com/>

 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\VehicleGroupRequest;
use App\Model\VehicleGroupModel;
use Auth;
use Illuminate\Http\Request;

class VehicleGroupController extends Controller
{
    public function __construct()
    {
        // $this->middleware(['role:Admin']);
        $this->middleware('permission:VehicleGroup add',['only' => ['create']]);
        $this->middleware('permission:VehicleGroup edit',['only' => ['edit']]);
        $this->middleware('permission:VehicleGroup delete',['only' => ['bulk_delete', 'destroy']]);
        $this->middleware('permission:VehicleGroup list');
    }

    public function index()
    {
        if (Auth::user()->user_type == "S" || Auth::user()->group_id == null) {
            $index['data'] = VehicleGroupModel::get();
        } else {
            $index['data'] = VehicleGroupModel::where('id', Auth::user()->group_id)->get();
        }
        return view('vehicle_groups.index', $index);
    }

    public function create()
    {
        return view('vehicle_groups.create');
    }

    public function store(VehicleGroupRequest $request)
    {

        $group = new VehicleGroupModel();
        $group->name = $request->get('name');
        $group->description = $request->get('description');
        $group->note = $request->get('note');
        $group->user_id = Auth::user()->id;
        $group->save();
        return redirect()->route('vehicle_group.index');
    }

    public function edit($id)
    {
        $index['data'] = VehicleGroupModel::where('id', $id)->first();
        return view('vehicle_groups.edit', $index);

    }

    public function update(VehicleGroupRequest $request)
    {

        $group = VehicleGroupModel::find($request->get('id'));
        $group->name = $request->get('name');
        $group->description = $request->get('description');
        $group->note = $request->get('note');
        $group->save();
        return redirect()->route('vehicle_group.index');

    }

    public function destroy(Request $request)
    {
        VehicleGroupModel::find($request->get('id'))->delete();
        return redirect()->route('vehicle_group.index');
    }

    public function bulk_delete(Request $request)
    {
        VehicleGroupModel::whereIn('id', $request->ids)->delete();
        return back();
    }
}
