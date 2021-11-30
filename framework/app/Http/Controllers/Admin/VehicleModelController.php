<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\VehicleModelRequest;
use App\Model\VehicleMake;
use App\Model\Vehicle_Model;
use Illuminate\Http\Request;

class VehicleModelController extends Controller
{
    public function __construct()
    {
        // $this->middleware(['role:Admin']);
        $this->middleware('permission:VehicleModels add',['only' => ['create','store']]);
        $this->middleware('permission:VehicleModels edit',['only' => ['edit','update']]);
        $this->middleware('permission:VehicleModels delete',['only' => ['bulk_delete', 'destroy']]);
        $this->middleware('permission:VehicleModels list');
    }

    public function index()
    {
        $index['data'] = Vehicle_Model::get();
        return view('vehicle_model.index', $index);
    }

    public function create()
    {
        $vehicle_makes = VehicleMake::get();
        return view('vehicle_model.create', compact('vehicle_makes'));
    }

    public function store(VehicleModelRequest $request)
    {
        $new = Vehicle_Model::create([
            'make_id' => $request->make_id,
            'model' => $request->model,
        ]);

        return redirect()->route('vehicle-model.index');
    }

    public function edit($id)
    {
        $data['vehicle_makes'] = VehicleMake::get();
        $data['vehicle_model'] = Vehicle_Model::find($id);
        return view('vehicle_model.edit', $data);
    }

    public function update(VehicleModelRequest $request)
    {

        $data = Vehicle_Model::find($request->get('id'));
        $data->update([
            'make_id' => $request->make_id,
            'model' => $request->model,
        ]);

        return redirect()->route('vehicle-model.index');
    }

    public function destroy(Request $request)
    {
        Vehicle_Model::find($request->get('id'))->delete();
        return redirect()->route('vehicle-model.index');
    }

    public function bulk_delete(Request $request)
    {
        Vehicle_Model::whereIn('id', $request->ids)->delete();
        return back();
    }
}
