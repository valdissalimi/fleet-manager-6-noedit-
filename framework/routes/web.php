<?php

Route::group(['middleware' => ['IsInstalled', 'lang_check_user', 'front_enable']], function () {
    // define all routes here
    Route::get('/', 'FrontEnd\HomeController@index')->name('frontend.home');
    Route::get('contact', 'FrontEnd\HomeController@contact')->name('frontend.contact');
    Route::get('about', 'FrontEnd\HomeController@about')->name('frontend.about');
    Route::post('user-login', 'FrontEnd\HomeController@user_login');
    Route::get('booking-history/{id}', 'FrontEnd\HomeController@booking_history')->middleware('auth_user')->name('frontend.booking_history');
    Route::post('user-logout', 'FrontEnd\HomeController@user_logout');

    Route::get('forgot-password', 'FrontEnd\HomeController@forgot');
    Route::post('forgot-password', 'FrontEnd\HomeController@send_reset_link');
    Route::get('reset-password/{token}', 'FrontEnd\HomeController@reset');
    Route::post('reset-password', 'FrontEnd\HomeController@reset_password');

    Route::post('user-register', 'FrontEnd\HomeController@customer_register');
    Route::post('send-enquiry', 'FrontEnd\HomeController@send_enquiry')->name('user.enquiry');
    Route::post('book', 'FrontEnd\HomeController@book')->middleware('auth_user');
});

// Route::get('/', 'FrontendController@index')->middleware('IsInstalled');
// if (env('front_enable') == 'no') {
//     Route::get('/', function () {
//         return redirect('admin');
//     })->middleware('IsInstalled');
// } else {
//     Route::get('/', 'FrontendController@index')->middleware('IsInstalled');
// }
Route::post('redirect-payment', 'FrontEnd\HomeController@redirect_payment')->name('redirect-payment');
Route::get('redirect-payment/{method}/{booking_id}', 'FrontEnd\HomeController@redirect');

Route::get('installation', 'LaravelWebInstaller@index');
Route::post('installed', 'LaravelWebInstaller@install');
Route::get('installed', 'LaravelWebInstaller@index');
Route::get('migrate', 'LaravelWebInstaller@db_migration');
Route::get('migration', 'LaravelWebInstaller@migration');
Route::get('upgrade', 'UpdateVersion@upgrade')->middleware('canInstall');
Route::get('upgrade3', 'UpdateVersion@upgrade3')->middleware('canInstall');
Route::get('upgrade4', 'UpdateVersion@upgrade4')->middleware('canInstall');
Route::get('upgrade4.0.2', 'UpdateVersion@upgrade402')->middleware('canInstall');
Route::get('upgrade4.0.3', 'UpdateVersion@upgrade403')->middleware('canInstall');
Route::get('upgrade5', 'UpdateVersion@upgrade5')->middleware('canInstall');
Route::get('upgrade6', 'UpdateVersion@upgrade6')->middleware('canInstall');

// stripe payment integration
Route::get('stripe/{booking_id}', 'PaymentController@stripe');
Route::get('stripe-success', 'PaymentController@stripe_success');
Route::get('stripe-cancel', 'PaymentController@stripe_cancel');

// razorpay payment integration
Route::get('razorpay/{booking_id}', 'PaymentController@razorpay');
Route::post('razorpay-success', 'PaymentController@razorpay_success');
Route::get('razorpay-failed', 'PaymentController@razorpay_failed');

// cash payment
Route::get('cash/{booking_id}', 'PaymentController@cash');

Route::get('sample-payment', function () {
    return view('payments.test_pay');
});

// Route::post('redirect-payment', 'PaymentController@redirect_payment');

// Route::get('all-data', function () {
//     $bookings = BookingPaymentsModel::latest()->get();
//     foreach ($bookings as $booking) {
//         if ($booking->payment_details != null) {
//             echo "<pre>";
//             print_r(json_decode($booking->payment_details));
//             echo "---------------------------------------------<br>";
//         }
//     }
// });
