<!-- ======= Hero Section ======= -->
<section id="hero-banner">
  {*<div class="banner-img">
    <div class="banner-container">
      <div class="banner-content">
        <span>Morpheus Videos</span>
        <h1>Custom Video Generator</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        <div>
          <a href="#" class="play-video"><img src="assets/img/banner-play-icon.png" /></a>
        </div>
      </div>
    </div>
    <div class="category-list">
     <ul>
      <li class="all"><a href="#">All Videos</a></li>
      {section name=list loop=$category_list} 
      <li><a href="index.php?file=category/category&category_id={$category_list[list].category_id}">{$category_list[list].category_name}</a></li>
      {/section}
     </ul> 
    </div>
  </div>*}
  <div class="banner-video-container">
   <iframe src="https://player.vimeo.com/video/705397764?background=1" class="banner-video" frameborder="0" allow="autoplay; fullscreen"></iframe>
  </div>
</section>
<!-- End Hero -->

<!-- ======= Main Section ======= -->
<main id="main">
<!-- ======= Start Category Listing Section ======= -->
<section id="category_list" class="category_list">
 <div class="container">
  <div class="row">
   {section name=list loop=$category_list} 
   <div class="col-xl-3 col-lg-4 col-md-6">
     <div class="home-category-box">
     <div class="home-category-top-info">
      <h2><a class="home-category-title" title="View {$category_list[list].category_name}" href="index.php?file=category/category&category_id={$category_list[list].category_id}">{$category_list[list].category_name}</a></h2>
      <p class="home-category-subtitle">{$category_list[list].description|regex_replace:"/(<p>|<p [^>]*>|<\\/p>)/":""}</p>
     </div>

     <a class="home-category-image-info" title="View {$category_list[list].category_name}" href="index.php?file=category/category&category_id={$category_list[list].category_id}">
      <div class="home-category-imageiconwrapper">
       <div class="home-category-imagewrapper">
        <img src="assets/uploads/category/{$category_list[list].category_img}" alt="{$category_list[list].category_name}" class="home-category-image">
       </div>

      <div class="home-category-icon">
        <span><img src="assets/img/play-icon.png" /></span>
      </div>
     </div>
     </a>
    </div>
   </div>
   {/section}
  </div>
 </div>
</section>
<!-- ======= End Category Listing Section ======= -->

<!-- ======= Start Custom Video Generator Section ======= -->
<section id="custom_video_generator" class="custom_video_generator">
  <div class="container">
  
    <div class="section-title">
      <h2>Personalized Custom Video Generator</h2>
      <p>So simple, anyone can use it. With just a few clicks of your mouse, you'll have customized content to share instantly</p>
    </div>

    <div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5">
      <div class="col icon-box">
        <img src="assets/img/video_template.png" title="Choose your video template" /> 
        <h6 class="title">1. Choose your video template</h6>
      </div>
      <div class="col icon-box">
        <img src="assets/img/custom_elements.png" title="Select and enter your custom elements" />  
        <h6 class="title">2. Select and enter your custom elements</h6>
      </div>
      <div class="col icon-box">
        <img src="assets/img/preview_video.png" title="Preview your video" /> 
        <h6 class="title">3. Preview your video</h6>
      </div>
      <div class="col icon-box">
        <img src="assets/img/approve_checkout.png" title="Approve & Checkout." /> 
        <h6 class="title">4. Approve & Checkout.</h6>
      </div>
      <div class="col icon-box">
        <img src="assets/img/download_video.png" title="INSTANTLY download your unique video" /> 
        <h6 class="title">5. INSTANTLY download your unique video</h6>
      </div>
    </div>

  </div>
</section>
<!-- End Custom Video Generator Section -->

</main>
<!-- End #main -->
<input type="hidden" class="login_session" value="{$smarty.session.customer_login}"  />
{if $smarty.session.customer_login}
  <div class="toast" id="loginNotify">
    <div class="toast-header">
      <strong class="me-auto">Successfully Login.</strong>
      <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
    </div>
  </div>
{/if}