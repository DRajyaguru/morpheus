<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/customer/customer_list.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$top_title  = "Morpheus Customer List";
$active_page = "users";
$page_js_folder = 'customer';
$page_js_name   = 'customers';

//Customer Status Check Code
if(isset($_POST['status_change'])) {
	$customer_id = $_POST['customer_id'];	
	$status   	 = $_POST['status_val'];	
	$data 	     = Array ('status' =>$status);
	$db->where('customer_id', $customer_id);
	$db->update('customer',$data);
}

//Customer Delete Code
if(isset($_POST['delete_data']) && $_POST['delete_data'] == 'Y') {
  $customer_ids = explode(",",$_POST['customers_id']); 
  $db->where('customer_id',$customer_ids, 'IN');
  $db->delete('customer');
  exit;
}

//Customer Add Batch Credit Code
if(isset($_POST['batch_credit']) && $_POST['batch_credit'] == 'Y') {
  $customer_ids  = $_POST['customer_ids']; 
  $total_credits = $_POST['total_credits'];	
  $db->rawQuery('UPDATE customer SET total_credits = total_credits + '.$total_credits.' where customer_id IN ('.$customer_ids.')');  
  exit;
}

$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>"Customer List","top_title"=>$top_title,"active_page"=>$active_page,"page_js_folder"=>$page_js_folder,"page_js_name"=>$page_js_name);	
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>