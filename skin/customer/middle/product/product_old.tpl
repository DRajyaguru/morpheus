<div class="inner-page-content">
 <section class="video-section">
  <div class="container">
   <div class="row video-general-info">
    <div class="col-lg-6">
      <div class="product-video">
       <img src="assets/uploads/product/{$product_data.product_img}" alt="{$product_data.name}" class="video-img">
       <div class="morpheus_generate_video">
        <!--<video controls autoplay muted>
        <source src="https://v.idomoo.com/4907/0000/bytf3b352jo0b2no2n333e2k98bsybs312z.mp4" type="video/mp4">
       </video>-->
       </div>
       <a href="#" class="video-play-icon">
		<img src="assets/img/video-play-icon.png" alt="Play icon">
       </a>
      </div>
      <div class="video_res_info">
       <span>3840 x 2160 px ProRes 422 (HQ)</span><span>23.98 fps</span><span>MOV</span><span>1 GB</span>
      </div>
    </div>
    <div class="col-lg-6">
     <div class="video-info">
      <h1 class="video-title">{$product_data.name}</h1>
      <h5 class="category-name">{$product_category_data[0].category_name}</h5><h5 class="video-sku">ID: {$product_data.sku}</h5>
      <div class="video_credits">
       <span>{$product_data.credits} credits</span>
      </div> 
      {if $product_exist eq 0}
       <form method="post" action="index.php?file=purchase/cart">
        <input type="hidden" name="action" value="add" />
        <input type="hidden" name="product_id" value="{$product_data.product_id}" />
        <input type="submit" value="Continue with purchase" name="btn_continue_purchase" class="continue_purchase" disabled="disabled" />
       </form>
      {else}
        <a href="index.php?file=purchase/cart" class="view_cart">View Cart</a> 
      {/if} 
      <!--<button type="button" title="Continue with purchase" class="continue_purchase" disabled="disabled">Continue with purchase</button>-->
      <hr />
      <div class="video_short_info">
       <span>Includes our <a href="#">standard license</a>.</span>
       <span class="short_desc">Description:  {$product_data.description|regex_replace:"/(<p>|<p [^>]*>|<\\/p>)/":""}</span>
      </div>
     </div> 
    </div>
   </div>
  </div>
 </section>
 <section class="pt-0 generate_video_section">
  <form method="post" action="index.php?file=product/product" class="generate_video_form" id="generate_video_form" enctype="multipart/form-data">
  <input type="hidden" name="storyboard_id" value="{$product_data.storyboard_id}" /> 
  <div class="container">
   <div class="row">
    <div class="col-lg-12">
     <h2>Customize Video</h2>
     <hr />
    </div> 
    <div class="col-lg-6">
      <div class="row">
       {section name=list loop=$product_extrafields_data} 
        {if $product_extrafields_data[list].extra_field_name|strstr:"Logo" || $product_extrafields_data[list].extra_field_name|strstr:"BG"}
          <div class="col-md-8 preview_img {$product_extrafields_data[list].extra_field_name|replace:' ':'-'}{if !$smarty.section.list.last} mb-3{/if}">
            <span class="logo_place">{$product_extrafields_data[list].extra_field_label}</span>
          </div>
          <div class="col-md-4{if !$smarty.section.list.last} mb-3{/if}">
           <div class="form-group">
            <label for="{$product_extrafields_data[list].extra_field_name|replace:' ':'-'}" class="btn btn_upload">Upload</label>
            <input id="{$product_extrafields_data[list].extra_field_name|replace:' ':'-'}" class="upload_file" type="file" />
            <input type="hidden" name="{$product_extrafields_data[list].extra_field_name|replace:' ':'-'}" class="bg_layer" value="">
           </div>
          </div>
        {else}
          <div class="col-md-12">
           <div class="form-group">
            {assign "orignal_char" array('_', '-')}
			{assign "replace_char" array(' ', ' ')}
            <!--<label for="{$product_extrafields_data[list].extra_field_name}">{$product_extrafields_data[list].extra_field_name|replace:'_':' '} *</label>
            <label for="{$product_extrafields_data[list].extra_field_name}">{$product_extrafields_data[list].extra_field_name|replace:$orignal_char:$replace_char} <span class="required">*</span></label>-->
            <label for="{$product_extrafields_data[list].extra_field_name}">{$product_extrafields_data[list].extra_field_label} <span class="required">*</span></label>
            <input type="text" class="form-control{if $smarty.section.list.last} mb-0{/if}" name="{$product_extrafields_data[list].extra_field_name|replace:' ':'-'}" value="{$product_extrafields_data[list].extra_field_value}" id="{$product_extrafields_data[list].extra_field_name|replace:' ':'-'}" required>
           </div>
          </div>
        {/if}  
       {/section}
       </div>
     </div>
    <div class="col-lg-5 offset-lg-1">
      <div class="row">
       <div class="col-lg-10 col-md-12 position-relative mb-5 md-mb-30 offset-right-2">
        <span class="format_label">Format</span> 
        <select class="form-select select_format" name="SelectFormat">
          <option value="mp4">MP4</option>
        </select>
       </div> 
       <div class="col-lg-10 col-md-12 mb-5 md-mb-30 offset-right-2">
        <ul class="video_quality">
         <li>Web<input type="radio" name="SelectResolution" value="480" title="640x480" /></li>
         <li>HD Web<input type="radio" name="SelectResolution" value="720" title="1280x720" /></li>
         <li>HD<input type="radio" name="SelectResolution" value="1080" title="1920x1080" /></li>
         <li class="active">4K<input type="radio" name="SelectResolution" value="1080" title="1920x1080" checked="checked" /></li>
        </ul>
       </div>
       <div class="col-lg-10 col-md-12 offset-right-2">
        <input type="submit" value="Preview" name="btn_preview" class="video_preview btn float-end" />
       </div>
      </div>
    </div>
   </div>
  </div>
  </form>
 </section>
</div>

<div class="video-overlay">
 <div class="video_overlay__inner">
  <div class="video_overlay__content">
   <span class="spinner"></span>
  </div>
 </div>
</div>