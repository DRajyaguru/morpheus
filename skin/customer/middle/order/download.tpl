<div class="inner-page-content">
 <section class="download-section">
  <div class="container">
   {assign var=total_video value=$video_info|count}
   <div class="row ms-0 me-0{if $total_video eq 1} justify-content-center{/if}">
    <div class="col-lg-12 mb-2 ps-3 pe-3 video-download-data">
     <div class="video-data">
       <span class="confirm-order-sign"><i class="bi bi-check2-circle"></i></span>
       <h1 class="video-title mb-2">Order #{$order_id}</h1> 
       <h4 class="mb-2">Thank you for your order.</h4>
       <div class="video_credits">
        <span data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Morpheus Token"><img src="assets/img/token.png">Total {$total_credits}<span class="fw-normal">Morpheus Token Used</span></span>
       </div>   
       {*<form method="post" action="index.php?file=order/download" id="downloadVideo">
       <input type="hidden" value="Y" name="download_video" />
       <input type="hidden" value="{$video_url}" name="video_link" />
       <button type="submit" form="downloadVideo" value="Submit" class="download_btn p-0 border-0"><i class="bi bi-download"></i>Download Video</button>
       </form>
       <a href="#" class="download_btn"><i class="bi bi-download"></i>Download Video</a>
       <ul class="video_quality">
        <li>Web<input type="radio" name="SelectResolution" value="480" title="640x480"></li>
        <li>HD Web<input type="radio" name="SelectResolution" value="720" title="1280x720"></li>
        <li>HD<input type="radio" name="SelectResolution" value="1080" title="1920x1080"></li>
        <li class="active">4K<input type="radio" name="SelectResolution" value="1080" title="1920x1080" checked="checked"></li>
       </ul> *}
     </div> 
    </div> 
    {foreach from=$video_info name=video_list item=list key=key}
     <div class="col-md-6 {if $smarty.foreach.video_list.iteration mod 2 eq 0}even{else}odd{/if}">
      <div class="product-download-video">
       <video id="video" src="{$video_info[$key].video_url}" controls="controls"></video> 
       <div class="video_sku mt-3">
        <h5 class="fw-bold">ID: {$video_info[$key].product_sku}</h5>
       </div>
       <div class="video_credits mt-1">
        <span data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Morpheus Token"><img src="assets/img/token.png">{$video_info[$key].credits}<span class="fw-normal">Morpheus Token</span></span>
       </div>
       <form method="post" action="index.php?file=order/download" id="downloadVideo_{$smarty.foreach.video_list.iteration}">
        <input type="hidden" value="Y" name="download_video" />
        <input type="hidden" value="{$video_info[$key].video_url}" name="video_link" />
        <button type="submit" form="downloadVideo_{$smarty.foreach.video_list.iteration}" value="Submit" class="download_btn p-0 border-0"><i class="bi bi-download"></i>Download Video</button>
       </form>
      </div>
     </div>
    {/foreach}
   </div>
  </div>
 </section>
</div>