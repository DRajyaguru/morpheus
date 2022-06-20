<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>{$title}</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="description" content=""> 
	<meta name="keywords" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../admin/assets/images/favicon.ico" />
    {include file="assets/css/main_css.tpl"}
</head>
<body class="header-fixed header-tablet-and-mobile-fixed aside-fixed aside-secondary-disabled">
 <!--begin::Main-->
 <!--begin::root-->
 <div class="d-flex flex-column flex-root">
  <!--begin::page-->
  <div class="page d-flex flex-row flex-column-fluid">
   {include file=$left}
    <!--begin::Wrapper-->
	 <div class="wrapper d-flex flex-column flex-row-fluid" id="kt_wrapper">
       {include file=$header} 
   	   {include file=$middle}
   	   {include file=$footer}
     </div>
    <!--end::Wrapper--> 
  </div> 
  <!--end::page-->
 </div>  
 <!--end::root-->  
   {include file="assets/js/main_js.tpl"}
</body>
</html>