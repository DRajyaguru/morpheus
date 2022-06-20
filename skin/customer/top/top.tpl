<!-- ======= Header ======= -->
<header id="header" class="fixed-top d-flex align-items-center">
 <div class="container d-flex align-items-center justify-content-between">
  <a href="index.php" class="logo">
   {assign var=logo_path value='assets/img/logo.png'}
   {if $smarty.const.COMPANY_LOGO}{$logo_path = 'assets/uploads/company_details/'|cat:$smarty.const.COMPANY_LOGO}{/if}
   <img src={$logo_path} alt="Logo" class="img-fluid" />
  </a>
  {*<nav id="navbar" class="navbar">
    <ul>
      <li><a class="nav-link scrollto" href="#">Video</a></li>
      <li><a class="nav-link scrollto" href="index.php?file=webpage/webpage&webpage_id=1">About</a></li>
      <li><a class="nav-link scrollto" href="index.php?file=webpage/webpage&webpage_id=8">Contact</a></li>
    </ul>
    <i class="bi bi-list mobile-nav-toggle"></i>
  </nav>*}<!-- .navbar -->
  <div id="rightbar" class="rightbar">
    <ul>
      {*<li><a class="nav-link scrollto search-icon" href="#"><i class="bi bi-search"></i></a></li>*}
      <li class="video-link"><a class="nav-link scrollto" href="#">Videos</a></li>
      <li class="minicart-icon"><a class="nav-link scrollto" href="index.php?file=purchase/cart"><img src="assets/img/basket-icon.png" alt="Mini Cart"/></a><span>{$smarty.const.CART_COUNTER}</span></li>
      <li class="dropdown"><a href="#" class="top-logo"><img src="assets/img/header-top-logo.png" alt="Header top logo" /> <i class="bi bi-caret-down-fill"></i></a>
        <ul>
         {if $smarty.session.customer_email eq ''}
          <li><a href="index.php?file=customer/login"><i class="bi bi-box-arrow-right"></i>Sign In</a></li>
          <li><a href="index.php?file=customer/registration"><i class="bi bi-pencil-square"></i>Sign Up</a></li>
         {else} 
          <li><a href="#"><i class="bi bi-person"></i>Hi, {$smarty.session.customer_name}</a></li> 
          <li><a href="#"><i class="bi bi-nut"></i>Account Settings</a></li>
          <li><a href="#"><i class="bi bi-clock-history"></i>Order History</a></li>
          <li><a href="index.php?file=customer/logout"><i class="bi bi-box-arrow-down"></i>Logout</a></li>
         {/if} 
        </ul>
      </li>
    </ul>
  </div>
 </div>
</header>
<!-- End Header -->