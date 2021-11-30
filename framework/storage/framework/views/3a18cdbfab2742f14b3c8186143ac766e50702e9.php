<?php $__env->startSection('extra_css'); ?>
<link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/css/bootstrap-datetimepicker.min.css')); ?>">
<?php $__env->stopSection(); ?>
<?php $__env->startSection("breadcrumb"); ?>
<li class="breadcrumb-item "><a href="<?php echo e(route("booking-quotation.index")); ?>"><?php echo app('translator')->get('fleet.booking_quotes'); ?></a></li>
<li class="breadcrumb-item active"><?php echo app('translator')->get('fleet.edit_quote'); ?></li>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
<div class="row">
  <div class="col-md-12">
    <div class="card card-warning">
      <div class="card-header">
        <h3 class="card-title">
          <?php echo app('translator')->get('fleet.edit_quote'); ?>
        </h3>
      </div>

      <div class="card-body">
        <?php if(count($errors) > 0): ?>
          <div class="alert alert-danger">
            <ul>
            <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
              <li><?php echo e($error); ?></li>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </ul>
          </div>
        <?php endif; ?>

        <?php echo Form::open(['route' => ['booking-quotation.update',$data->id],'method'=>'PATCH']); ?>


        <?php echo Form::hidden('status',0); ?>

        <?php echo Form::hidden('id',$data->id); ?>

        <?php echo Form::hidden('customer_id',$data->customer_id); ?>

        <div class="row">
          <div class="col-md-4">
            <div class="form-group">
              <?php echo Form::label('customer_id',__('fleet.selectCustomer'), ['class' => 'form-label']); ?>

              <select id="customer_id" name="customer_id" class="form-control" disabled>
                <option selected value="<?php echo e($data->customer_id); ?>"><?php echo e($data->customer['name']); ?></option>
              </select>
            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <?php echo Form::label('pickup',__('fleet.pickup'), ['class' => 'form-label']); ?>

              <div class='input-group mb-3 date'>
                <div class="input-group-prepend">
                  <span class="input-group-text"> <span class="fa fa-calendar"></span></span>
                </div>
                <?php echo Form::text('pickup',$data->pickup,['class'=>'form-control','required']); ?>

              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <?php echo Form::label('dropoff',__('fleet.dropoff'), ['class' => 'form-label']); ?>

              <div class='input-group date'>
                <div class="input-group-prepend">
                  <span class="input-group-text"><span class="fa fa-calendar"></span></span>
                </div>
                <?php echo Form::text('dropoff',$data->dropoff,['class'=>'form-control','required']); ?>

              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <div class="form-group">
              <?php echo Form::label('vehicle_id',__('fleet.selectVehicle'), ['class' => 'form-label']); ?>

              <select id="vehicle_id" name="vehicle_id" class="form-control" required>
                <option value="">-</option>
                <?php $__currentLoopData = $vehicles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $vehicle): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <option <?php if($vehicle->id==$data->vehicle_id): ?> selected <?php endif; ?> value="<?php echo e($vehicle->id); ?>" data-driver="<?php echo e($vehicle->driver_id); ?>" data-vehicle-type="<?php echo e(strtolower(str_replace(' ','',$vehicle->types->vehicletype))); ?>" data-base-mileage="<?php echo e(Hyvikk::fare(strtolower(str_replace(' ','',$vehicle->types->vehicletype)).'_base_km')); ?>" data-base-fare="<?php echo e(Hyvikk::fare(strtolower(str_replace(' ','',$vehicle->types->vehicletype)).'_base_fare')); ?>"
                    data-base_km_1="<?php echo e(Hyvikk::fare(strtolower(str_replace(' ','',$vehicle->types->vehicletype)).'_base_km')); ?>"
                    data-base_fare_1="<?php echo e(Hyvikk::fare(strtolower(str_replace(' ','',$vehicle->types->vehicletype)).'_base_fare')); ?>"
                    data-wait_time_1="<?php echo e(Hyvikk::fare(strtolower(str_replace(' ','',$vehicle->types->vehicletype)).'_base_time')); ?>"
                    data-std_fare_1="<?php echo e(Hyvikk::fare(strtolower(str_replace(' ','',$vehicle->types->vehicletype)).'_std_fare')); ?>"

                    data-base_km_2="<?php echo e(Hyvikk::fare(strtolower(str_replace(' ','',$vehicle->types->vehicletype)).'_weekend_base_km')); ?>"
                    data-base_fare_2="<?php echo e(Hyvikk::fare(strtolower(str_replace(' ','',$vehicle->types->vehicletype)).'_weekend_base_fare')); ?>"
                    data-wait_time_2="<?php echo e(Hyvikk::fare(strtolower(str_replace(' ','',$vehicle->types->vehicletype)).'_weekend_wait_time')); ?>"
                    data-std_fare_2="<?php echo e(Hyvikk::fare(strtolower(str_replace(' ','',$vehicle->types->vehicletype)).'_weekend_std_fare')); ?>"

                    data-base_km_3="<?php echo e(Hyvikk::fare(strtolower(str_replace(' ','',$vehicle->types->vehicletype)).'_night_base_km')); ?>"
                    data-base_fare_3="<?php echo e(Hyvikk::fare(strtolower(str_replace(' ','',$vehicle->types->vehicletype)).'_night_base_fare')); ?>"
                    data-wait_time_3="<?php echo e(Hyvikk::fare(strtolower(str_replace(' ','',$vehicle->types->vehicletype)).'_night_wait_time')); ?>"
                    data-std_fare_3="<?php echo e(Hyvikk::fare(strtolower(str_replace(' ','',$vehicle->types->vehicletype)).'_night_std_fare')); ?>"><?php echo e($vehicle->maker->make); ?> - <?php echo e($vehicle->vehiclemodel->model); ?> - <?php echo e($vehicle->license_plate); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
              </select>
            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <?php echo Form::label('driver_id',__('fleet.selectDriver'), ['class' => 'form-label']); ?>


              <select id="driver_id" name="driver_id" class="form-control" required>
                <option value="">-</option>
                <?php $__currentLoopData = $drivers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $driver): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <option value="<?php echo e($driver->id); ?>" <?php if($driver->id == $data->driver_id): ?> selected <?php endif; ?>><?php echo e($driver->name); ?> <?php if($driver->getMeta('is_active') != 1): ?>
                ( <?php echo app('translator')->get('fleet.in_active'); ?> ) <?php endif; ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
              </select>
            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <?php echo Form::label('travellers',__('fleet.no_travellers'), ['class' => 'form-label']); ?>

              <?php echo Form::number('travellers',$data->travellers,['class'=>'form-control','min'=>1]); ?>

            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <div class="form-group">
              <label class="form-label"><?php echo app('translator')->get('fleet.daytype'); ?></label>
              <select id="day" name="day" class="form-control vehicles sum" required>
                <option value="1" <?php if($data->day == 1): ?> selected <?php endif; ?>>Weekdays</option>
                <option value="2" <?php if($data->day == 2): ?> selected <?php endif; ?>>Weekend</option>
                <option value="3" <?php if($data->day == 3): ?> selected <?php endif; ?>>Night</option>
              </select>
            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <label class="form-label"><?php echo app('translator')->get('fleet.trip_mileage'); ?> (<?php echo e(Hyvikk::get('dis_format')); ?>)</label>
              <?php echo Form::number('mileage',$data->mileage,['class'=>'form-control sum','min'=>1,'id'=>'mileage','required']); ?>

            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <label class="form-label"><?php echo app('translator')->get('fleet.waitingtime'); ?></label>
              <?php echo Form::number('waiting_time',$data->waiting_time,['class'=>'form-control sum','min'=>0,'id'=>'waiting_time','required']); ?>

            </div>
          </div>
        </div>


        <!-- FITUR BARU -->
        <div class="card-body">
          <?php echo app('translator')->get('fleet.time_interval'); ?>
          <div class="row" style="margin-top: 10px;">
            
            <div class="form-group col-md-3 col-xs-4">
              <input type="number" name="time1" class="form-control" id="time1">
            </div>

            <div class="col-md-4  col-xs-4">
              <select id="interval" name="interval1" class="form-control" >
                <option value="day(s)"> <?php echo app('translator')->get('fleet.days'); ?></option>
                <option value="week(s)"> <?php echo app('translator')->get('fleet.weeks'); ?></option>
                <option value="month(s)"> <?php echo app('translator')->get('fleet.months'); ?></option>
                <option value="year(s)"> <?php echo app('translator')->get('fleet.years'); ?></option>
              </select>
            </div>
          </div>




        <div class="row">
          <div class="col-md-3">
            <div class="form-group">
              <label class="form-label"><?php echo app('translator')->get('fleet.total'); ?> <?php echo app('translator')->get('fleet.amount'); ?> </label>
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                <span class="input-group-text"><?php echo e(Hyvikk::get('currency')); ?></span></div>
                <?php echo Form::number('total',$data->total,['class'=>'form-control','id'=>'total','required','min'=>0,'step'=>'0.01']); ?>

              </div>
            </div>
          </div>
          <?php ($tax_percent=0); ?>
          <?php if($data->total_tax_percent != null): ?>
            <?php ($tax_percent = $data->total_tax_percent); ?>
          <?php endif; ?>
          <div class="col-md-3">
            <div class="form-group">
              <label class="form-label"><?php echo app('translator')->get('fleet.total_tax'); ?> (%) </label>
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                <span class="input-group-text fa fa-percent"></span></div>
                <?php echo Form::number('total_tax_percent',$data->total_tax_percent,['class'=>'form-control sum','readonly','id'=>'total_tax_charge','min'=>0,'step'=>'0.01']); ?>

              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="form-group">
              <label class="form-label"><?php echo app('translator')->get('fleet.total'); ?> <?php echo app('translator')->get('fleet.tax_charge'); ?></label>
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                <span class="input-group-text"><?php echo e(Hyvikk::get('currency')); ?></span></div>
                <?php echo Form::number('total_tax_charge_rs',$data->total_tax_charge_rs,['class'=>'form-control sum','readonly','id'=>'total_tax_charge_rs','min'=>0,'step'=>'0.01']); ?>

              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="form-group">
              <label class="form-label"><?php echo app('translator')->get('fleet.total'); ?> <?php echo app('translator')->get('fleet.amount'); ?> </label>
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                <span class="input-group-text"><?php echo e(Hyvikk::get('currency')); ?></span></div>
                <?php echo Form::number('tax_total',$data->tax_total,['class'=>'form-control','id'=>'tax_total','readonly','min'=>0,'step'=>'0.01']); ?>

              </div>
            </div>
          </div>
        </div>
        <?php if(Auth::user()->user_type == "C"): ?>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <?php echo Form::label('d_pickup',__('fleet.pickup_addr'), ['class' => 'form-label']); ?>

              <select id="d_pickup" name="d_pickup" class="form-control">
                <option value="">-</option>
                <?php $__currentLoopData = $addresses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $address): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <option value="<?php echo e($address->id); ?>" data-address="<?php echo e($address->address); ?>"><?php echo e($address->address); ?>

                </option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
              </select>
            </div>
            </div>
            <div class="col-md-6">
            <div class="form-group">
            <?php echo Form::label('d_dest',__('fleet.dropoff_addr'), ['class' => 'form-label']); ?>

            <select id="d_dest" name="d_dest" class="form-control">
            <option value="">-</option>
            <?php $__currentLoopData = $addresses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $address): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <option value="<?php echo e($address->id); ?>" data-address="<?php echo e($address->address); ?>"><?php echo e($address->address); ?></option>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
            </div>
          </div>
        </div>
        <?php endif; ?>
        <div class="row">
          <div class="col-md-4">
            <div class="form-group">
              <?php echo Form::label('pickup_addr',__('fleet.pickup_addr'), ['class' => 'form-label']); ?>

              <?php echo Form::text('pickup_addr',$data->pickup_addr,['class'=>'form-control','required','style'=>'height:100px']); ?>

            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <?php echo Form::label('dest_addr',__('fleet.dropoff_addr'), ['class' => 'form-label']); ?>

              <?php echo Form::text('dest_addr',$data->dest_addr,['class'=>'form-control','required','style'=>'height:100px']); ?>

            </div>
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <?php echo Form::label('note',__('fleet.note'), ['class' => 'form-label']); ?>

              <?php echo Form::textarea('note',$data->note,['class'=>'form-control','placeholder'=>__('fleet.book_note'),'style'=>'height:100px']); ?>

            </div>
          </div>
        </div>
        <div class="col-md-12">
          <?php echo Form::submit(__('fleet.update'), ['class' => 'btn btn-warning']); ?>

        </div>
        <?php echo Form::close(); ?>

      </div>
    </div>
  </div>
</div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection("script"); ?>
<script src="<?php echo e(asset('assets/js/moment.js')); ?>"></script>
<script src="<?php echo e(asset('assets/js/datetimepicker.js')); ?>"></script>

<script type="text/javascript">
  $('#customer_id').select2({placeholder: "<?php echo app('translator')->get('fleet.selectCustomer'); ?>"});
  $('#driver_id').select2({placeholder: "<?php echo app('translator')->get('fleet.selectDriver'); ?>"});
  $('#vehicle_id').select2({placeholder: "<?php echo app('translator')->get('fleet.selectVehicler'); ?>"});
  $('#pickup').datetimepicker({format: 'YYYY-MM-DD HH:mm:ss',sideBySide: true,icons: {
              previous: 'fa fa-arrow-left',
              next: 'fa fa-arrow-right',
              up: "fa fa-arrow-up",
              down: "fa fa-arrow-down"
  }});
  $('#dropoff').datetimepicker({format: 'YYYY-MM-DD HH:mm:ss',sideBySide: true,icons: {
              previous: 'fa fa-arrow-left',
              next: 'fa fa-arrow-right',
              up: "fa fa-arrow-up",
              down: "fa fa-arrow-down"
            }
  });

  function get_driver(from_date,to_date){
    $.ajax({
      type: "POST",
      headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
      url: "<?php echo e(url('admin/get_driver')); ?>",
      data: "req=new&from_date="+from_date+"&to_date="+to_date,
      success: function(data2){
        $("#driver_id").empty();
        $("#driver_id").select2({placeholder: "<?php echo app('translator')->get('fleet.selectDriver'); ?>",data:data2.data});
      },
      dataType: "json"
    });
  }

  function get_vehicle(from_date,to_date){
    $.ajax({
      type: "POST",
      headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
      url: "<?php echo e(url('admin/get_vehicle')); ?>",
      data: "req=new&from_date="+from_date+"&to_date="+to_date,
      success: function(data2){
        $("#vehicle_id").empty();
        $("#vehicle_id").select2({placeholder: 'Select Vehicle',data:data2.data});
      },
      dataType: "json"
    });
  }

  $(document).ready(function() {
    $("#d_pickup").on("change",function(){
      var address=$(this).find(":selected").data("address");
      $("#pickup_addr").val(address);
    });

    $("#d_dest").on("change",function(){
      var address=$(this).find(":selected").data("address");
      $("#dest_addr").val(address);
    });

    $("#pickup").on("dp.change", function (e) {
      var to_date=$('#dropoff').data("DateTimePicker").date().format("YYYY-MM-DD HH:mm:ss");
      var from_date=e.date.format("YYYY-MM-DD HH:mm:ss");
      get_driver(from_date,to_date);
      // get_vehicle(from_date,to_date);
      $('#dropoff').data("DateTimePicker").minDate(e.date);
    });

    $("#dropoff").on("dp.change", function (e) {
      $('#pickup').data("DateTimePicker").date().format("YYYY-MM-DD HH:mm:ss")
      var from_date=$('#pickup').data("DateTimePicker").date().format("YYYY-MM-DD HH:mm:ss");
      var to_date=e.date.format("YYYY-MM-DD HH:mm:ss");

      get_driver(from_date,to_date);
      // get_vehicle(from_date,to_date);
    });

    $("#vehicle_id").on("change",function(){
      var driver = $(this).find(":selected").data("driver");
      $("#driver_id").val(driver).change();
    });
  });
</script>
<script type="text/javascript">

  //Flat red color scheme for iCheck
  $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
    checkboxClass: 'icheckbox_flat-green',
    radioClass   : 'iradio_flat-green'
  })
</script>
<script type="text/javascript" language="javascript">
$("#vehicle_id").on('change',function(){
  $("#mileage").val($("#vehicle_id option:selected").data('base-mileage'));
  $("#waiting_time").val("0");
  $("#total").val($("#vehicle_id option:selected").data('base-fare'));
  $("#day").val("1");
  var tax_charges = (Number('<?php echo e($tax_percent); ?>') * Number($('#total').val()))/100;
  $('#total_tax_charge_rs').val(tax_charges);
  $('#tax_total').val(Number($('#total').val()) + Number(tax_charges));
});

$(".sum").change(function(){
  // alert($("#base_km_1").val());
  // alert($('.vtype').data('base_km_1'));
  // console.log($("#type").val());
    var day = $("#day").find(":selected").val();
    if(day == 1){
      var base_km = $("#vehicle_id option:selected").data('base_km_1');
      var base_fare = $("#vehicle_id option:selected").data('base_fare_1');
      var wait_time = $("#vehicle_id option:selected").data('wait_time_1');
      var std_fare = $("#vehicle_id option:selected").data('std_fare_1');
        if(Number($("#mileage").val()) <= Number(base_km)){
          var total = Number(base_fare) + (Number($("#waiting_time").val()) * Number(wait_time));
        }
        else{
          var sum = Number($("#mileage").val() - base_km) * Number(std_fare);
      var total = Number(base_fare) + Number(sum) + (Number($("#waiting_time").val()) * Number(wait_time));
      }
    }

    if(day == 2){
      var base_km = $("#vehicle_id option:selected").data('base_km_2');
      var base_fare = $("#vehicle_id option:selected").data('base_fare_2');
      var wait_time = $("#vehicle_id option:selected").data('wait_time_2');
      var std_fare = $("#vehicle_id option:selected").data('std_fare_2');
        if(Number($("#mileage").val()) <= Number(base_km)){
          var total = Number(base_fare) + (Number($("#waiting_time").val()) * Number(wait_time));
        }
        else{
          var sum = Number($("#mileage").val() - base_km) * Number(std_fare);
      var total = Number(base_fare) + Number(sum) + (Number($("#waiting_time").val()) * Number(wait_time));
      }
    }

    if(day == 3){
      var base_km = $("#vehicle_id option:selected").data('base_km_3');
      var base_fare = $("#vehicle_id option:selected").data('base_fare_3');
      var wait_time = $("#vehicle_id option:selected").data('wait_time_3');
      var std_fare = $("#vehicle_id option:selected").data('std_fare_3');
        if(Number($("#mileage").val()) <= Number(base_km)){
          var total = Number(base_fare) + (Number($("#waiting_time").val()) * Number(wait_time));
        }
        else{
          var sum = Number($("#mileage").val() - base_km) * Number(std_fare);
          var total = Number(base_fare) + Number(sum) + (Number($("#waiting_time").val()) * Number(wait_time));
      }
    }
    $("#total").val(total);
    var tax_charges = (Number('<?php echo e($tax_percent); ?>') * Number($('#total').val()))/100;
    $('#total_tax_charge_rs').val(tax_charges);
    $('#tax_total').val(Number($('#total').val()) + Number(tax_charges));
  });

  $('#total').on('change',function(){
    var tax_charges = (Number('<?php echo e($tax_percent); ?>') * Number($('#total').val()))/100;
    $('#total_tax_charge_rs').val(tax_charges);
    $('#tax_total').val(Number($('#total').val()) + Number(tax_charges));
  });
</script>

<?php if(Hyvikk::api('google_api') == "1"): ?>
  <script>
  function initMap() {
    $('#pickup_addr').attr("placeholder","");
    $('#dest_addr').attr("placeholder","");
      // var input = document.getElementById('searchMapInput');
      var pickup_addr = document.getElementById('pickup_addr');
      new google.maps.places.Autocomplete(pickup_addr);

      var dest_addr = document.getElementById('dest_addr');
      new google.maps.places.Autocomplete(dest_addr);

      // autocomplete.addListener('place_changed', function() {
      //     var place = autocomplete.getPlace();
      //     document.getElementById('pickup_addr').innerHTML = place.formatted_address;
      // });
  }
  </script>
  <script src="https://maps.googleapis.com/maps/api/js?key=<?php echo e(Hyvikk::api('api_key')); ?>&libraries=places&callback=initMap" async defer></script>
<?php endif; ?>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\fm\framework\resources\views/booking_quotation/edit.blade.php ENDPATH**/ ?>