<?php

/*
@copyright

Fleet Manager v6.0.0

Copyright (C) 2017-2021 Hyvikk Solutions <https://hyvikk.com/> All rights reserved.
Design and developed by Hyvikk Solutions <https://hyvikk.com/>

 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\WorkOrderRequest;
use App\Model\PartsModel;
use App\Model\PartsUsedModel;
use App\Model\VehicleModel;
use App\Model\Vendor;
use App\Model\Mechanic;
use App\Model\WorkOrderLogs;
use App\Model\WorkOrders;
use Auth;
use Illuminate\Http\Request;

class WorkOrdersController extends Controller
{

    public function __construct()
    {
        // $this->middleware(['role:Admin']);
        $this->middleware('permission:WorkOrders add',['only' => ['create']]);
        $this->middleware('permission:WorkOrders edit',['only' => ['edit']]);
        $this->middleware('permission:WorkOrders delete',['only' => ['bulk_delete', 'destroy']]);
        $this->middleware('permission:WorkOrders list');
    }

    public function logs()
    {
        if (Auth::user()->group_id == null || Auth::user()->user_type == "S") {
            $vehicle_ids = VehicleModel::pluck('id')->toArray();
        } else {
            $vehicle_ids = VehicleModel::where('group_id', Auth::user()->group_id)->pluck('id')->toArray();
        }
        $index['data'] = WorkOrderLogs::whereIn('vehicle_id', $vehicle_ids)->latest()->get();
        return view('work_orders.logs', $index);
    }

    public function index()
    {
        if (Auth::user()->group_id == null || Auth::user()->user_type == "S") {
            $vehicle_ids = VehicleModel::pluck('id')->toArray();
        } else {
            $vehicle_ids = VehicleModel::where('group_id', Auth::user()->group_id)->pluck('id')->toArray();
        }
        $index['data'] = WorkOrders::whereIn('vehicle_id', $vehicle_ids)->orderBy('id', 'desc')->get();
        return view('work_orders.index', $index);
    }

    public function create()
    {
        if (Auth::user()->group_id == null || Auth::user()->user_type == "S") {
            $data['vehicles'] = VehicleModel::whereIn_service("1")->get();
        } else {
            $data['vehicles'] = VehicleModel::where('group_id', Auth::user()->group_id)->whereIn_service("1")->get();
        }

        $data['vendors'] = Vendor::get();
        $data['mechanic'] = Mechanic::get();
        $data['parts'] = PartsModel::where('stock', '>', 0)->where('availability', 1)->get();
        return view('work_orders.create', $data);
    }

    public function store(WorkOrderRequest $request)
    {
        $order = new WorkOrders();
        $order->required_by = $request->get('required_by');
        $order->vehicle_id = $request->get('vehicle_id');
        $order->vendor_id = $request->get('vendor_id');
        $order->mechanic_id = $request->get('mechanic_id');
        $order->status = $request->get('status');
        $order->description = $request->get('description');
        $order->meter = $request->get('meter');
        $order->price = $request->get('price');
        $order->note = $request->get('note');
        $order->user_id = Auth::user()->id;
        $order->save();
        $log = WorkOrderLogs::create([
            'created_on' => date('Y-m-d', strtotime($order->created_at)),
            'vehicle_id' => $order->vehicle_id,
            'vendor_id' => $order->vendor_id,
            'required_by' => $order->required_by,
            'status' => $order->status,
            'description' => $order->description,
            'meter' => $order->meter,
            'note' => $order->note,
            'price' => $order->price,
            'mechanic_id' => $order->mechanic_id,
            'type' => "Created",
        ]);
        $parts = $request->parts;

        if ($parts != null) {
            foreach ($parts as $part_id => $qty) {

                $update_part = PartsModel::find($part_id);
                PartsUsedModel::create(['work_id' => $order->id, 'part_id' => $part_id, 'qty' => $qty, 'price' => $update_part->unit_cost, 'total' => $qty * $update_part->unit_cost]);
                $update_part->stock = $update_part->stock - $qty;
                $update_part->save();
                if ($update_part->stock == 0) {
                    $update_part->availability = 0;
                    $update_part->save();
                }
            }
        }
        $log->parts_price = $order->parts->sum('total');
        $log->save();
        return redirect()->route('work_order.index');
    }

    public function edit($id)
    {
        $index['parts'] = PartsModel::where('stock', '>', 0)->where('availability', 1)->get();
        $index['data'] = WorkOrders::whereId($id)->first();
        if (Auth::user()->group_id == null || Auth::user()->user_type == "S") {
            $index['vehicles'] = VehicleModel::whereIn_service("1")->get();
        } else {
            $index['vehicles'] = VehicleModel::where('group_id', Auth::user()->group_id)->whereIn_service("1")->get();
        }
        $index['vendors'] = Vendor::get();
        $index['mechanic'] = Mechanic::get();
        return view('work_orders.edit', $index);
    }

    public function update(WorkOrderRequest $request)
    {
        $order = WorkOrders::find($request->get("id"));
        $order->required_by = $request->get('required_by');
        $order->vehicle_id = $request->get('vehicle_id');
        $order->vendor_id = $request->get('vendor_id');
        $order->status = $request->get('status');
        $order->description = $request->get('description');
        $order->mechanic_id = $request->get('mechanic_id');
        $order->meter = $request->get('meter');
        $order->price = $request->get('price');
        $order->note = $request->get('note');
        $order->save();

        $log = WorkOrderLogs::create([
            'created_on' => date('Y-m-d', strtotime($order->created_at)),
            'vehicle_id' => $order->vehicle_id,
            'vendor_id' => $order->vendor_id,
            'required_by' => $order->required_by,
            'status' => $order->status,
            'description' => $order->description,
            'meter' => $order->meter,
            'note' => $order->note,
            'price' => $order->price,
            'mechanic_id' => $order->mechanic_id,
            'type' => "Updated",
            'user_id' => Auth::user()->id,
        ]);
        $parts = $request->parts;

        if ($parts != null) {
            foreach ($parts as $part_id => $qty) {
                $update_part = PartsModel::find($part_id);

                PartsUsedModel::create(['work_id' => $order->id, 'part_id' => $part_id, 'qty' => $qty, 'price' => $update_part->unit_cost, 'total' => $qty * $update_part->unit_cost]);
                $update_part->stock = $update_part->stock - $qty;
                $update_part->save();
                if ($update_part->stock == 0) {
                    $update_part->availability = 0;
                    $update_part->save();
                }
            }
        }
        $log->parts_price = $order->parts->sum('total');
        $log->save();
        return redirect()->route('work_order.index');
    }

    public function destroy(Request $request)
    {
        WorkOrders::find($request->get('id'))->delete();
        return redirect()->back();
    }

    public function bulk_delete(Request $request)
    {
        WorkOrders::whereIn('id', $request->ids)->delete();
        return back();
    }

    public function remove_part($id)
    {
        $usedpart = PartsUsedModel::find($id);
        $part = PartsModel::find($usedpart->part_id);
        $part->stock = $part->stock + $usedpart->qty;
        $part->save();
        if ($part->stock > 0) {
            $part->availability = 1;
            $part->save();
        }
        $usedpart->delete();
        return back();
    }

    public function parts_used($id)
    {
        $order = WorkOrders::find($id);
        return view('work_orders.parts_used', compact('order'));
    }
}
