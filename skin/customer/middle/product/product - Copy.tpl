<div class="inner-page-content">
 <section>
  <div class="container">
   <div class="row">
    <div class="col-lg-6">
      <div class="product-video">
       <img src="assets/uploads/product/{$product_data.product_img}" alt="{$product_data.name}">
       <a href="#" class="video-play-icon">
		<img src="assets/img/video-play-icon.png" alt="Play icon">
       </a>
      </div>
    </div>
    <div class="col-lg-5 offset-md-1">
     <div class="video-info">
      <h1 class="video-title">Video 1</h1>
      <h5 class="category-name">Real Estate</h5><h5 class="video-sku">ID: 886675908</h5>
      <div class="video_credits">
       <span>18 credits</span>
      </div> 
      <div class="video_res_info">
       <span>3840 x 2160 px ProRes 422 (HQ)</span><span>23.98 fps</span><span>MOV</span><span>1 GB</span>
      </div>
      <button type="button" title="Continue with purchase" class="continue_purchase" disabled="disabled">Continue with purchase</button>
      <hr />
      <div class="video_short_info">
       <span>Includes our <a href="#">standard license</a>.</span>
       <span class="short_desc">Description:  Aerial View of Beijing Traffic Jam</span>
      </div>
     </div> 
    </div>
   </div>
  </div>
 </section>
 <section class="pt-0 generate_video_section">
  <form method="post" action="#" class="generate_video_form">
  <div class="container">
   <div class="row">
    <div class="col-lg-12">
     <h2>Generate Video</h2>
     <hr />
    </div> 
    <div class="col-lg-6">
      <div class="row">
       <div class="col-md-6">
        <div class="form-group">
         <label for="first_name">First Name *</label>
         <input type="text" class="form-control" id="first_name">
        </div>
       </div>
       <div class="col-md-6">
        <div class="form-group">
         <label for="last_name">Last Name *</label>
         <input type="text" class="form-control" id="last_name">
        </div>
       </div>
       <div class="col-md-12">
        <div class="form-group">
         <label for="contact_no">Contact Number *</label>
         <input type="text" class="form-control" id="contact_no">
        </div>
       </div>
       <div class="col-md-12">
        <div class="form-group">
          <label for="email_id">Email Address *</label>
         <input type="text" class="form-control" id="email_id">
        </div>
       </div>
       <div class="col-md-12">
         <div class="form-group">
          <label for="website">Website Address</label>
          <input type="text" class="form-control" id="website">
         </div>
        </div>
        <div class="col-md-12">
         <div class="form-group">
          <label for="care_or_lic_no">CaRe or License Number </label>
          <input type="text" class="form-control" id="care_or_lic_no">
         </div>
        </div>
        <div class="col-md-8">
          <span class="logo_place">Logo Placeholder</span>
        </div>
        <div class="col-md-4">
         <div class="form-group">
          <button type="button" name="btn_upload" class="btn_upload">Upload</button>
         </div>
        </div>
       </div>
     </div>
    <div class="col-lg-5 offset-lg-1">
      <div class="row">
       <div class="col-md-10 position-relative mb-5 offset-right-2">
        <span class="format_label">Format</span> 
        <select class="form-select select_format" name="select_format">
          <option>MP4</option>
        </select>
       </div> 
       <div class="col-md-10 mb-5 offset-right-2">
        <ul class="video_quality">
         <li><a href="#">Web</a></li>
         <li><a href="#">HD Web</a></li>
         <li><a href="#">HD</a></li>
         <li><a href="#">4K</a></li>
        </ul>
       </div>
       <div class="col-md-10 offset-right-2">
        <input type="submit" value="Preview" name="btn_preview" class="video_preview btn btn-primary float-end" />
       </div>
      </div>
    </div>
   </div>
  </div>
  </form>
 </section>
</div>