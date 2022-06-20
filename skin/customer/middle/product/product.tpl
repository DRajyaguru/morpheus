<div class="inner-page-content">
 <section class="video-section">
  <div class="container">
   <div class="row">
    <div class="col-lg-12">
     <h1 class="video-title">{$product_data.name}</h1>
    </div>
    <div class="col-lg-6">
      <div class="product-video{if $product_data.static_video_link neq ''} vimeo-video{/if}">
       {if $product_data.static_video_link neq ''}
        <iframe src="{$product_data.static_video_link}?loop=1" frameborder="0" allow="autoplay; fullscreen" class="video-img" style="background-image: url(assets/uploads/product/{$product_data.product_img})"></iframe>
       {else} 
        <img src="assets/uploads/product/{$product_data.product_img}" alt="{$product_data.name}" class="video-img">
       {/if}
       <div class="morpheus_generate_video">
        <!--<video controls autoplay muted>
        <source src="https://v.idomoo.com/4907/0000/bytf3b352jo0b2no2n333e2k98bsybs312z.mp4" type="video/mp4">
       </video>-->
       </div>
       <a href="#" class="video-play-icon">
		<img src="assets/img/video-play-icon.png" alt="Play icon">
       </a>
      </div>
      <div class="video-info new-video-info">
      <h5 class="category-name"><a href="index.php?file=category/category&category_id={$product_category_data[0].category_id}" title="{$product_category_data[0].category_name}">{$product_category_data[0].category_name}</a></h5><h5 class="video-sku">ID: {$product_data.sku}</h5>
      {if $product_data.description}<div class="short_desc mb-4">{$product_data.description}</div>{/if}
      
      <div class="video_credits">
       <span data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-bs-original-title="Morpheus Token"><img src="assets/img/token.png">{$product_data.credits}<span class="fw-normal">Morpheus Token</span></span>
      </div>
      <div class="video-terms-condition">
        <div class="col-md-12 mb-3 mt-3">
          <div class="form-group i_agree_terms"><input type="checkbox" name="terms_condition" class="terms_condition" value="Y" disabled="disabled" /><input type="hidden" name="accept_tc" class="accept_tc" /><span><a href="#" data-bs-toggle="modal" data-bs-target="#termsconditionModal" class="click_modal"><u>Accept License Terms</u></a>.</span></div>
          </div>
      </div>
      <div class="modal fade popup-modal" id="termsconditionModal" tabindex="-1" aria-labelledby="termsconditionModalTitle" aria-modal="true" role="dialog">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="termsconditionModalTitle">Terms & Conditions</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><i class="bi bi-x-lg"></i></button>
          </div>
          <div class="modal-body">
          <div class="webpage_description" id="termsconditionModalBody">{$description}</div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn text-light btn-accept-tc" disabled="disabled">Accept</button>
          </div>
        </div>
      </div>
    </div>
      {if $product_exist eq 0}
       <form method="post" action="index.php?file=purchase/cart" class="purchase_video">
        <input type="hidden" name="action" value="add" />
        <input type="hidden" name="product_id" value="{$product_data.product_id}" />
        <input type="hidden" name="storyboard_id" value="{$product_data.storyboard_id}" />
        <input type="submit" value="Continue with purchase" name="btn_continue_purchase" class="continue_purchase" disabled="disabled" />
       </form>
      {else}
        <a href="index.php?file=purchase/cart" class="view_cart">View Cart</a> 
      {/if}
      <hr />
      <div class="video_short_info">
       <span>Includes our <a href="#">Standard license</a>.</span>
      </div>
     </div>
    </div>
    <div class="col-lg-6 ps-lg-4 mt-lg-0 mt-sm-5 mt-4">
     <div class="generate_video_section new_video_section">
      <form method="post" action="index.php?file=product/product" class="generate_video_form new_video_form" id="generate_video_form" enctype="multipart/form-data">
      <input type="hidden" name="storyboard_id" value="{$product_data.storyboard_id}" />    
        <div class="row">
         <div class="col-lg-12">
          <h2>Customize Video</h2>
          <hr />
         </div> 
         <div class="col-lg-12">
          <div class="row">
           {section name=list loop=$product_extrafields_data} 
            {if $product_extrafields_data[list].extra_field_name|strstr:"image" || $product_extrafields_data[list].extra_field_name|strstr:"BG"}
              <div class="col-md-8 preview_img {$product_extrafields_data[list].extra_field_name|replace:' ':'-'}{if !$smarty.section.list.last} mb-3{else} mb-4{/if}">
                <span class="logo_place">{$product_extrafields_data[list].extra_field_label}</span>
              </div>
              <div class="col-md-4{if !$smarty.section.list.last} mb-3{else} mb-4{/if}">
               <div class="form-group">
                <label for="{$product_extrafields_data[list].extra_field_name|replace:' ':'-'}" class="btn btn_upload">Upload</label>
                <input id="{$product_extrafields_data[list].extra_field_name|replace:' ':'-'}" class="upload_file" type="file" />
                <input type="hidden" name="{$product_extrafields_data[list].extra_field_name|replace:' ':'-'}" class="bg_layer extra_fields_input" value="">
               </div>
              </div>
            {else}
              <div class="col-md-6">
               <div class="form-group">
                {assign "orignal_char" array('_', '-')}
                {assign "replace_char" array(' ', ' ')}
                <input type="text" class="form-control extra_fields_input{if $smarty.section.list.last} mb-4{/if}" name="{$product_extrafields_data[list].extra_field_name|replace:' ':'-'}" value="{$product_extrafields_data[list].extra_field_value}" id="{$product_extrafields_data[list].extra_field_name|replace:' ':'-'}" placeholder="{$product_extrafields_data[list].extra_field_label}" required>
               </div>
              </div>
            {/if}  
           {/section}
           <div class="col-md-12">
            <input type="hidden" name="SelectFormat" value="mp4" />
            <input type="hidden" name="SelectResolution" value="1080" />
        	<input type="submit" value="Preview" name="btn_preview" class="video_preview btn float-end" />
       	   </div>
          </div>
         </div>
       </div>
      </form>
         </div> 
        </div>
       </div>
      </div>
     </section>
</div>

<div class="video-overlay">
 <div class="video_overlay__inner">
  <div class="video_overlay__content">
   <span class="spinner"></span>
  </div>
 </div>
</div>