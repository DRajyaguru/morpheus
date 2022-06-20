<section id="category-banner">
 <div class="category-bg-img" style="background-image:url(assets/uploads/category/{$category_data.category_img|replace:' ':'%20'})">
  <div class="category-container">
   <h1>{$category_data.category_name}</h1>
   {if $category_data.description}<div class="category-description">{$category_data.description}</div>{/if}
  </div>
 </div>
</section>

<section id="product-listing">
 <div class="container">
  <div class="row">
  {if $product_data}
   {section name=list loop=$product_data} 
    <div class="col-lg-3 col-md-4 col-6">
     <div class="video-content{if $product_data[list].static_video_link neq ''} w-100{/if}">
      <div class="video-image{if $product_data[list].static_video_link neq ''} vimeo-video{/if}">
       {if $product_data[list].static_video_link neq ''}
        <iframe src="{$product_data[list].static_video_link}?loop=1" frameborder="0" allow="autoplay; fullscreen" class="video-img" style="background-image: url(assets/uploads/product/{$product_data[list].product_img})"></iframe>
       {else} 
        <a href="index.php?file=product/product&product_id={$product_data[list].product_id}"><img src="assets/uploads/product/{$product_data[list].product_img}" /></a>
        <div class="list-play-icon">
         <span><img src="assets/img/play-icon.png" /></span>
        </div>
       {/if}
        
      </div> 
      <div class="video-short-info">
       <h3><a href="index.php?file=product/product&product_id={$product_data[list].product_id}">{$product_data[list].name}</a></h3>
       <span class="video-credit" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Morpheus Token"><img src="assets/img/token.png" /> {$product_data[list].credits}</span>
      </div>
     </div>
    </div>
   {/section}
  {else}
    <span class="no-videos">There are no videos listed under this category</span>
  {/if}
  </div>
 </div>
</section>