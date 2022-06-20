<section id="webpage-banner">
 <div class="webpage-bg-content"{if $webpage_data.banner_img neq ''} style='background-image:url(assets/uploads/webpage/{$webpage_data.banner_img|replace:' ':'%20'})' {else} style='background-image:url(assets/img/main-banner.jpg)'{/if} >
  <div class="webpage-container" >
   <h1>{$webpage_data.page_title|replace:'and':'&'}</h1>
  </div>
 </div>
</section>
<section>
 <div class="container">
  <div class="row">
   <div class="col-12">
    {if $webpage_data.description|strstr:"Coming Soon.."}
      <div class="coming_soon_description">{$webpage_data.description|regex_replace:"/(<p>|<p [^>]*>|<\\/p>)/":""}</div>
    {else}
      <div class="webpage_description">{$webpage_data.description}</div>
    {/if}
   </div>
  </div>
 </div>
</section>