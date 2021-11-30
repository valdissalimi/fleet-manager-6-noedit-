<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\VehicleMakeRequest;
use App\Model\VehicleMake;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class VehicleMakeController extends Controller
{
    public function __construct()
    {
        // $this->middleware(['role:Admin']);
        $this->middleware('permission:VehicleMaker add',['only' => ['create','store']]);
        $this->middleware('permission:VehicleMaker edit',['only' => ['edit','update']]);
        $this->middleware('permission:VehicleMaker delete',['only' => ['bulk_delete', 'destroy']]);
        $this->middleware('permission:VehicleMaker list');
    }

    public function index()
    {
        $index['data'] = VehicleMake::get();
        return view('vehicle_make.index', $index);
    }

    public function create()
    {
        return view('vehicle_make.create');
    }

    public function store(VehicleMakeRequest $request)
    {
        $new = VehicleMake::create([
            'make' => $request->make,
        ]);
        $file = $request->file('image');

        if ($request->hasFile('image') && $request->file('image')->isValid()) {
            $destinationPath = './uploads'; // upload path
            $extension = $file->getClientOriginalExtension();
            $fileName1 = Str::uuid() . '.' . $extension;
            $file->move($destinationPath, $fileName1);
            $new->image = $fileName1;
            $new->save();
        }
        return redirect()->route('vehicle-make.index');
    }

    public function edit($id)
    {
        $data['vehicle_make'] = VehicleMake::find($id);
        return view('vehicle_make.edit', $data);
    }

    public function update(VehicleMakeRequest $request)
    {

        $data = VehicleMake::find($request->get('id'));
        $data->update([
            'make' => $request->make,
        ]);
        $file = $request->file('image');

        if ($request->hasFile('image') && $request->file('image')->isValid()) {
            $destinationPath = './uploads'; // upload path
            $extension = $file->getClientOriginalExtension();
            $fileName1 = Str::uuid() . '.' . $extension;
            $file->move($destinationPath, $fileName1);
            $data->image = $fileName1;
            $data->save();
        }
        return redirect()->route('vehicle-make.index');
    }

    public function destroy(Request $request)
    {
        VehicleMake::find($request->get('id'))->delete();
        return redirect()->route('vehicle-make.index');
    }

    public function bulk_delete(Request $request)
    {
        VehicleMake::whereIn('id', $request->ids)->delete();
        return back();
    }
}
