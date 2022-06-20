<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/marketing/marketing.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$page 		= "marketing_page";
$top_title  = "Morpheus Marketing Page";
$page_js_folder = 'marketing';
$page_js_name   = 'marketing';
$marketing_data = array();
$active_page = "settings";

if(isset($_POST['market']) && $_POST['market'] == 'Y') {
  
  $default_page_title           = $_POST["default_page_title"];
  $default_meta_description     = $_POST["default_meta_description"];
  $seo_clean_url        = $_POST['seo_clean_url'];
  $google_analytics     = $_POST["google_analytics"];
  $facebook_pixel_code  = $_POST['facebook_pixel_code'];
  $other                = $_POST['other'];
  $market_id            = $_POST["market_id"];
  echo $other;

  $update_data = array ("default_page_title"=>$default_page_title,"default_meta_description"=>$default_meta_description,"seo_clean_url"=>$seo_clean_url,"google_analytics"=>$google_analytics,"facebook_pixel_code"=>$facebook_pixel_code,"other"=>$other);
  $db->where('market_id',$market_id);
  $db->update('marketing', $update_data);
  echo '<pre>';print_r($update_data);
}
$marketing_data = $db->getOne('marketing');


$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>'Marketing Form',"page"=>$page,"top_title"=>$top_title,"links_data"=>$links_data,"marketing_data"=>$marketing_data,"page_js_folder"=>$page_js_folder,"page_js_name"=>$page_js_name,"active_page"=>$active_page);	
$localvars = array_merge($global_arr, $localvars);
// echo '<pre>';print_r($localvars);exit;
foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>


