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
            <div class="col-12" style="margin-bottom: 24px">
                        <h3 style="color:#E3E4E5; font-size: 20px; font-weight: 600">Deployed Strategies</h3>
                    </div>
                    @foreach($logs as $strategy)
                    <!-- Revenue Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card revenue-card" style="background: #17181A">
                            <div class="card-header" style="background: #17181A; border-bottom: 1px solid #27282D; position: relative">
                               <h3 style="font-size: 18px; line-height: 18px, font-weight: 600; color: #E3E4E5" class="m-0">{{$strategy->title}}</h3> 
                               <a style="position: absolute; right: 10px; top: 10px; cursor: pointer"><i class="bi bi-three-dots-vertical"></i></a>
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
                                        <h4 style="font-size: 14px; line-height: 14px, font-weight: 400; color: #E3E4E5;"></h4>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6 p-3">
                                        <h5 style="font-size: 14px; line-height: 14px, font-weight: 400; color: #959597;" >Lot size</h5>
                                        <h4 style="font-size: 14px; line-height: 14px, font-weight: 400; color: #E3E4E5;">{{ $tradeData->lot_size}}x <span style="color:#38C23D"><i class="bi bi-dot"></i> Active</span></h4>
                                    </div>
                                    
                                    <div class="col-6 p-3">
                                        <h5 style="font-size: 14px; line-height: 14px, font-weight: 400; color: #959597;" >P&L</h5>
                                        <h4 style="font-size: 14px; line-height: 14px, font-weight: 400; color: #38C23D;"></h4>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Revenue Card -->
                    @endforeach
        </div>
    </section>

</x-app-layout>
