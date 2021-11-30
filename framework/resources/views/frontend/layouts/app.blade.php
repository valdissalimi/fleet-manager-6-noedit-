<!DOCTYPE html>
@php($language = Hyvikk::frontend("language"))
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap & Other library css -->
    <title>{{ Hyvikk::get('app_name') }}</title>
    <link rel="stylesheet" href="{{ asset('assets/frontend/libraries/bootstrap/dist/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/frontend/css/animate.css')}}">
    <link rel="stylesheet" href="{{ asset('assets/frontend/libraries/fontawesome/css/all.min.css')}}">
    <!-- slick -->
    <link rel="stylesheet" href="{{ asset('assets/frontend/libraries/slider/slick/slick.css')}}">
    <!-- Dropdown -->
    <link rel="stylesheet" href="{{ asset('assets/frontend/libraries/dropdown/css/nice-select.css')}}">
    
    {{-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.18/dist/css/bootstrap-select.min.css"> --}}
    <!-- Date time picker -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <!-- Checkboxes and radios -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
    <!-- Template CSS -->
    <link rel="stylesheet" href="{{ asset('assets/frontend/css/style.css')}}">
    <link rel="stylesheet" href="{{asset('assets/plugins/select2/select2.min.css')}}">
    @yield('css')
  </head>

  <!-- BODY START -->

  <body @if($language == "Arabic-ar") dir="rtl" @endif>
    <!-- Wrapper -->
      @include('frontend.includes.navigation')
      <!-- ALL SECTIONS -->
      <section id="content">
        @yield('content')
        {{-- @include('frontend.home') --}}
        
        <!---------------------- Modal --------------------------->
        <div class="login-modal-wrapper animated fadeInUp faster" id="login-modal">
            <div class="login-modal" role="document">
                <div class="modal-content">
                    <div class="modal-body px-0">
                        <div class="container-fluid h-100">
                            <div class="row h-100  back-primary">
                                <div class="col-sm-5 d-flex flex-column justify-content-center align-items-center animated fadeInUp delay-05s">
                                    <img src="{{ asset('assets/frontend/images/fleet-login.png')}}" alt="">
                                </div>
                                <div class="col-sm-7 d-flex flex-column justify-content-center align-items-center animated fadeInUp delay-05s">
                                    <h2 class="modal-title pl-3 text-left w-100 mb-3">
                                        @lang('frontend.register')
                                        <div class="modal-close" data-close="login-modal">
                                            <img src="{{ asset('assets/frontend/icons/fleet-close-white.png')}}">
                                        </div>
                                    </h2>
                                    @if (count($errors->register) > 0)
                                        <div class="alert alert-danger xs-mt mb-4">
                                        <ul>
                                        @foreach ($errors->register->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                        </ul>
                                        </div>
                                    @endif
                                    <form action="{{ url('user-register') }}" method="POST">
                                        {!! csrf_field() !!}
                                        <div class="row w-100 m-0 p-0">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="label-animate">@lang('frontend.first_name')</label>
                                                    <input type="text" class="text-input" name="first_name" value="{{ old('first_name') }}" required>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="label-animate">@lang('frontend.last_name')</label>
                                                    <input type="text" class="text-input" name="last_name" value="{{ old('last_name') }}" required>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="checkboxes form-group">
                                                    <div class="pretty p-default p-round">
                                                        <input type="radio" name="gender" value="1" checked>
                                                        <div class="state custom-state">
                                                            <label class="text-white">@lang('frontend.male')</label>
                                                        </div>
                                                    </div>
                                                    <div class="pretty p-default p-round">
                                                        <input type="radio" name="gender" value="0" {{ (old('gender') == "0") ? "checked" : "" }}>
                                                        <div class="state custom-state">
                                                            <label class="text-white">@lang('frontend.female')</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="label-animate">@lang('frontend.email')</label>
                                                    <input type="text" class="text-input" name="email" value="{{ old('email') }}" required>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="label-animate">@lang('frontend.phone')</label>
                                                    <input type="text" class="text-input" name="phone" value="{{ old('phone') }}" required>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="label-animate">@lang('frontend.password')</label>
                                                    <input type="password" class="text-input" name="password" required>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="label-animate">@lang('frontend.confirm_password')</label>
                                                    <input type="password" class="text-input" name="confirm_password" required>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <textarea class="text-input" cols="30" rows="4" name="address" placeholder="@lang('frontend.your_address')">{{ old('address') }}</textarea>
                                            </div>
                                            <input class="tab-button ml-3 mt-5" type="submit" value="@lang('frontend.sign_up')">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>
     </section>
     @include('frontend.includes.footer')

      <!-- END ALL SECTIONS -->
    <!-- END WRAPPER -->
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script src="{{ asset('assets/frontend/js/jquery.js')}}"></script>
    <script src="{{ asset('assets/frontend/js/popper.js')}}"></script>
    <script src="{{ asset('assets/frontend/libraries/bootstrap/dist/js/bootstrap.min.js')}}"></script>
    <!-- PLUGINS -->
    <!-- slick carousel -->
    <script src="{{ asset('assets/frontend/libraries/slider/slick/slick.min.js')}}"></script>
    <!-- Nice select -->
    <script src="{{ asset('assets/frontend/libraries/dropdown/js/jquery.nice-select.min.js')}}"></script>
    
    {{-- <script>
    $(document).ready(function() {
        $('#vehicle_type').selectpicker();
    });
    </script> --}}
     
    <!-- Date time picker -->
    <script src="{{ asset('assets/frontend/js/moment.js')}}"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    {{-- <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.18/dist/js/bootstrap-select.min.js"></script> --}}
    <script src="{{ asset('assets/frontend/js/main.js')}}"></script>
    <script src="{{asset('assets/plugins/select2/select2.full.min.js')}}"></script>

    @yield('scripts')
    @yield('javascript')
    @if (count($errors->register) > 0)
    <script type="text/javascript">
         $('#login-modal').addClass('active'); 
    </script>
    @endif

    @if(session('success'))
    <script type="text/javascript">
        $('#login-popup').addClass('active'); 
        $('#login-popup').removeClass('fadeOutDown'); 
    </script>
    @endif

    @if (count($errors->login) > 0)
    <script>
        $('#login-popup').addClass('active');
        $('#login-popup').removeClass('fadeOutDown'); 
    </script>
    @endif

    <script>
    $(function(){
        var current = location.pathname;
        $('.navbar-nav a').each(function(){
            var $this = $(this);
            //alert(current.substring(current.lastIndexOf('/') + 1));
            if($this.attr('href').substring(this.href.lastIndexOf('/') + 1) == current.substring(current.lastIndexOf('/') + 1)){
                $this.addClass('active');
            }
            
            if(current.substring(current.lastIndexOf('/') + 1) == '')
            {
                $('.navbar-nav a').first().addClass('active');
            }
        });

        $('.offcanvas-nav_links a').each(function(){
            var $this = $(this);
            //alert(current.split('/')[2]);
            if($this.attr('href').substring(this.href.lastIndexOf('/') + 1) == current.substring(current.lastIndexOf('/') + 1)){
                $this.addClass('active');
            }

            if(current.substring(current.lastIndexOf('/') + 1) == '')
            {
                $('.offcanvas-nav_links a').first().addClass('active');
            }
        });
    });

    window.setTimeout(function () { 
         $(".alert-success").alert('close'); 
    }, 3000);

    if ($(location).attr('href').substring($(location).attr('href').lastIndexOf('/') + 1) == "#login")
    {
        $('#login-popup').addClass('active');
        $('#login-popup').removeClass('fadeOutDown'); 
    }
    </script>
  </body>
  <!-- Body End -->
</html>
