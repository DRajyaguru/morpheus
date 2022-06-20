<div class="inner-page-content">
 <section class="download-section">
  <div class="container">
   <div class="row ms-0 me-0">
    <div class="col-lg-6 ps-0 pe-0">
     <div class="product-download-video">
      <video id="video" src="{$video_url}" controls="controls"></video> 
     </div>
    </div>
    <div class="col-lg-6 ps-0 pe-0 video-download-data">
     <div class="video-data">
       <span class="confirm-order-sign"><i class="bi bi-check2-circle"></i></span>
       <h1 class="video-title mb-2">Order #{$order_id}</h1> 
       <h4 class="mb-2">Thank you for your order.</h4>
       <div class="video_credits mb-1">
        <span data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Morpheus Token"><img src="assets/img/token.png">{$total_credits}<span class="fw-normal">Morpheus Token Used</span></span>
       </div>   
       <form method="post" action="index.php?file=order/download" id="downloadVideo">
       <input type="hidden" value="Y" name="download_video" />
       <input type="hidden" value="{$video_url}" name="video_link" />
       <button type="submit" form="downloadVideo" value="Submit" class="download_btn p-0 border-0"><i class="bi bi-download"></i>Download Video</button>
       </form>
    {* <a href="#" class="download_btn"><i class="bi bi-download"></i>Download Video</a>
       <ul class="video_quality">
        <li>Web<input type="radio" name="SelectResolution" value="480" title="640x480"></li>
        <li>HD Web<input type="radio" name="SelectResolution" value="720" title="1280x720"></li>
        <li>HD<input type="radio" name="SelectResolution" value="1080" title="1920x1080"></li>
        <li class="active">4K<input type="radio" name="SelectResolution" value="1080" title="1920x1080" checked="checked"></li>
       </ul> *}
     </div> 
    </div>
   </div>
  </div>
 </section>
</div>