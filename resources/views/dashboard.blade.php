<x-app-layout>
    <div class="page-top" style="padding:60px 60px; background: #090909; background-image: url({{ asset('assets/img/head.jpg') }}); background-size: 100% 100%;">
      <h3 style="font-weight: 200; font-size: 32px">Welcome, {{ Auth::user()->name }}!</h3>
      <h1 style="font-weight: 300; font-size: 40px; margin-top: 12px">Let’s build a new strategy today.</h1>
      
      <div style="width: 60%; height: 72px; margin-top: 32px; position: relative">
          <input type="" style="width: 100%; height: 72px; background: #18181A; border: 1px solid #27282D; border-radius: 12px; padding: 12px 68px 12px 24px" placeholder="Write your strategy">
          <a style="position: absolute; right: 12px; top: 12px">
              <img src="{{ asset('assets/img/Button.svg') }}" style="height: 48px"/>
          </a>
      </div>
    </div><!-- End Page Title -->

    <section class="section dashboard" style="padding: 32px 48px; background: #101011; border-top: 1px solid #27282D">
        <div class="row">
             <?php 
                $showLoginPop = false;
                if($orders == "logout")
                {
                    $orders = [];
                    $showLoginPop = true;
                }
                    $types = array(
                        '1' => 'Buy',
                        '-1' => 'Sell'
                    );
                    $productTypes = array(
                     
                    );
                    $status = array(
                        1 => "Canceled",
                        2 => "Traded / Filled",
                        3 => "(Not used currently)",
                        4 => "Transit",
                        5 => "Rejected",
                        6 => "Pending",
                        7 => "Expired",
                    );

                    ?>

            <!-- Left side columns -->
            @if(!$showLoginPop)
            <div class="col-12">
                <div class="row">
                    <div class="" style="margin-bottom: 24px">
                        <h3 style="color:#E3E4E5; font-size: 20px; font-weight: 600">Overview</h3>
                    </div>
                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card" style="background: #18181A">

                            <div class="card-body">
                                <h5 class="card-title" style="color: #959597; font-size: 14px">Orders <span>| Today</span></h5>

                                <div class="d-flex align-items-center">
                                    <div
                                        style="background: none; border: 1px solid #4154f1"
                                        class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-cart"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6 style="color:#E3E4E5">{{ sizeof($orders) }}</h6>
                                        <span class="text-success small pt-1 fw-bold"></span> <span
                                            class="text-muted small pt-2 ps-1">Orders</span>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Sales Card -->
                    <!-- Revenue Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card revenue-card" style="background: #18181A">

                            <div class="card-body">
                                <h5 class="card-title" style="color: #959597; font-size: 14px">P&L <span>| Today</span></h5>

                                <div class="d-flex align-items-center">
                                    <div
                                        style="background: none; border: 1px solid #2eca6a"
                                        class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-currency-rupee"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6 style="color:#E3E4E5">₹{{ number_format($positions->overall->pl_total,2) }}</h6>
                                        <span class="text-success small pt-1 fw-bold">{{ number_format(($positions->overall->pl_total/3000) * 100,2) }}%</span> <span
                                            class="text-muted small pt-2 ps-1">increase</span>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Revenue Card -->

                    <!-- Revenue Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card revenue-card" style="background: #18181A">

                            <div class="card-body">
                                <h5 class="card-title" style="color: #959597; font-size: 14px">Positions <span>| Today</span></h5>

                                <div class="d-flex align-items-center">
                                    <div
                                    style="background: none; border: 1px solid #2eca6a"
                                        class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="">
                                        <i class="bi bi-layers-half"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6 style="color:#E3E4E5">{{ @$positions->overall->count_total }}</h6>
                                        <span class="text-success small pt-1 fw-bold">{{ @$positions->overall->count_open }}</span> <span
                                            class="text-muted small pt-2 ps-1">open</span>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Revenue Card -->


                    

                </div>
                <div class="row">
                     <div class="col-12" style="margin-bottom: 24px">
                        <h3 style="color:#E3E4E5; font-size: 20px; font-weight: 600">Deployed Strategies</h3>
                    </div>
                    @foreach($strategies as $strategy)
                    <!-- Revenue Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card revenue-card" style="background: #17181A">
                            <div class="card-header" style="background: #17181A; border-bottom: 1px solid #27282D">
                               <h3 style="font-size: 18px; line-height: 18px, font-weight: 600; color: #E3E4E5" class="m-0">{{$strategy->title}}</h3> 
                            </div>
                            <?php 
                                $tradeData = json_decode($strategy->data, false);
                            ?>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6 p-3">
                                        <h5 style="font-size: 14px; line-height: 14px, font-weight: 400; color: #959597;" >Asset</h5>
                                        <h4 style="font-size: 14px; line-height: 14px, font-weight: 400; color: #E3E4E5;">{{ $tradeData->asset->symbol}}</h4>
                                    </div>
                                    
                                    <div class="col-6 p-3">
                                        <h5 style="font-size: 14px; line-height: 14px, font-weight: 400; color: #959597;" >Positions</h5>
                                        <h4 style="font-size: 14px; line-height: 14px, font-weight: 400; color: #E3E4E5;">{{ @$positions->overall->count_open }}</h4>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6 p-3">
                                        <h5 style="font-size: 14px; line-height: 14px, font-weight: 400; color: #959597;" >Lot size</h5>
                                        <h4 style="font-size: 14px; line-height: 14px, font-weight: 400; color: #E3E4E5;">{{ $tradeData->lot_size}}x <span style="color:#38C23D"><i class="bi bi-dot"></i> Active</span></h4>
                                    </div>
                                    
                                    <div class="col-6 p-3">
                                        <h5 style="font-size: 14px; line-height: 14px, font-weight: 400; color: #959597;" >P&L</h5>
                                        <h4 style="font-size: 14px; line-height: 14px, font-weight: 400; color: #38C23D;">{{ number_format(($positions->overall->pl_total/3000) * 100,2) }}</h4>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Revenue Card -->
                    @endforeach
                </div>
            </div><!-- End Left side columns -->
            @endif


        </div>
    </section>
    
    @if($showLoginPop)
    <div class="" style="z-index: 2000; position: fixed; top: 0; left: 0; height: 100%; width: 100%; background: rgba(0,0,0,.5); display: flex; justify-content: center; align-items: center;">
        <h2 style="color: #FFF;">Please login to FYERS</h2>
        <br>&nbsp; &nbsp;
         <a class="btn btn-success" href="https://api.fyers.in/api/v2/generate-authcode?client_id={{Auth::user()->api_id}}&redirect_uri={{Auth::user()->redirect_uri}}&response_type=code&state=sample_state*/">
                    <i class="bi bi-box-arrow-in-right"></i>
                    <span>Login</span>
                </a>
    </div>
        
    @endif

</x-app-layout>
