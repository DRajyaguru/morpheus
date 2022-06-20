<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/company_details/company_detail.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$top_title  = "Morpheus Company Details";
$active_page = "settings";
$page_js_folder = 'company_details';
$page_js_name   = 'company_detail';
$company_data = array();

if(isset($_POST['company_detail']) && $_POST['company_detail'] == 'Y') {
	$company_name      =  $_POST["company_name"];
	$company_details	 =  $_POST["company_details"];
	$company_email		 =  $_POST["company_email"];
	$company_logo		   =  '';
    $img_name    	   =  $_POST['img_name'];
	$company_address   =  $_POST["company_address"];
    $company_phone_no  =  $_POST["company_phone_no"];
    $company_id = $_POST["company_id"];

    if($_FILES['file']['name'] != '' && $_FILES['file']['name'] != $img_name){
      $company_logo = $_FILES['file']['name'];
      $img_location = '../assets/uploads/company_details/'.$company_logo;
      move_uploaded_file($_FILES['file']['tmp_name'], $img_location);
      $update_data = array ("company_name"=>$company_name,"company_details"=>$company_details,"company_email"=>$company_email,"company_logo"=>$company_logo,"company_address"=>$company_address,"company_phone_no"=>$company_phone_no);
    }
    else{
      $update_data = array ("company_name"=>$company_name,"company_details"=>$company_details,"company_email"=>$company_email,"company_address"=>$company_address,"company_phone_no"=>$company_phone_no);
    }   
    
    $db->where('company_id',$company_id);
    $db->update('company_details', $update_data);
}

$company_data = $db->getOne('company_details');

$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>'Company Details',"top_title"=>$top_title,"active_page"=>$active_page,"page_js_folder"=>$page_js_folder,"page_js_name"=>$page_js_name,"company_data"=>$company_data);	
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>