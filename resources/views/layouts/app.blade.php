<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Keycode') }}</title>

    <!-- Fonts -->
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="{{ asset('assets/img/favicon.png') }}" rel="icon">
    <link href="{{ asset('assets/img/apple-touch-icon.png') }}" rel="apple-touch-icon">

    <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,100..1000;1,9..40,100..1000&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="{{ asset('assets/vendor/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/vendor/bootstrap-icons/bootstrap-icons.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/vendor/boxicons/css/boxicons.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/vendor/quill/quill.snow.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/vendor/quill/quill.bubble.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/vendor/remixicon/remixicon.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/vendor/simple-datatables/style.css') }}" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="{{ asset('assets/css/style.css') }}" rel="stylesheet">

    <!-- Scripts -->
</head>

<body>


    <!-- ======= Sidebar ======= -->
    <aside id="sidebar" class="sidebar">
        <a href="/">
            <img src="{{ asset('assets/img/qlogo.png') }}" style="height: 40px"/>
        </a>
        <div class="" style="margin-top: 24px">
            <a style="display: inline-block; width: 100%; color: #ffffff; background: #575bc7; padding: 12px; border-radius: 12px"> <i style="" class="bi bi-plus"></i> Create strategy</a>
        </div>
        

        <ul class="sidebar-nav" id="sidebar-nav">

            <li class="nav-item">
                <a class="nav-link " href="{{ url('dashboard') }}">
                    <i class="bi bi-house"></i>
                    <span>Home</span>
                </a>
            </li><!-- End Dashboard Nav -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="{{ url('automated') }}">
                    <i class="bi bi-stack"></i>
                    <span> Strategies </span>
                </a>
            </li><!-- End Profile Page Nav -->

             <li class="nav-item">
                <a class="nav-link collapsed" href="{{ url('orders') }}">
                    <i class="bi bi-cart"></i>
                    <span>Report</span>
                </a>
            </li><!-- End Profile Page Nav -->
       

           


        </ul>
        <div style="position: absolute; bottom: 24px; width: calc(100% - 40px)">
            <ul class="sidebar-nav">
                <li class="nav-item">
                    <a class="nav-link collapsed" href="/">
                        <i class="bi bi-life-preserver"></i>
                        <span>Support</span>
                     </a>
                </li><!-- End Login Page Nav -->
                    
        
                   
                <li class="nav-item">
                    <a class="nav-link collapsed" href="https://api.fyers.in/api/v2/generate-authcode?client_id={{Auth::user()->api_id}}&redirect_uri={{Auth::user()->redirect_uri}}&response_type=code&state=sample_state*/">
                        <i class="bi bi-box-arrow-in-right"></i>
                        <span>Connect to Broker</span>
                     </a>
                </li><!-- End Login Page Nav -->
            </ul>
            <a class="nav-link nav-profile d-flex align-items-center pe-0 pt-2 w-100" style="border-top: 1px solid #27282D" href="#"
            data-bs-toggle="dropdown">
            <img src="assets/img/profile-img.jpg" style="width: 40px" alt="Profile" class="rounded-circle">
            <div class="">
                <span class="d-none d-md-block dropdown-toggle ps-2">{{ Auth::user()->name}}</span>
             <span class="ps-2" style="font-size: 12px; color: #475467">{{ Auth::user()->email}}</span>
            </div>
            
        </a><!-- End Profile Iamge Icon -->
        </div>
         

    </aside><!-- End Sidebar-->

    <main id="main" class="main">
        {{ $slot }}
    </main><!-- End #main -->

    <!-- ======= Footer ======= -->
    <footer id="footer" class="footer">
        <div class="copyright">
            &copy; Copyright <strong><span>QuantEdge</span></strong>. All Rights Reserved
        </div>
    </footer><!-- End Footer -->

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="{{ asset('assets/vendor/apexcharts/apexcharts.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/chart.js/chart.umd.js') }}"></script>
    <script src="{{ asset('assets/vendor/echarts/echarts.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/quill/quill.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/simple-datatables/simple-datatables.js') }}"></script>
    <script src="{{ asset('assets/vendor/tinymce/tinymce.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/php-email-form/validate.js') }}"></script>

    <!-- Template Main JS File -->
    <script src="{{ asset('assets/js/main.js') }}"></script>

</body>

</html>
