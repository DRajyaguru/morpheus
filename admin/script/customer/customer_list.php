<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/customer/customer_list.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$page 		= "customer_list";
$top_title  = "Morpheus Customer List";
$active_page = "users";

if(isset($_POST['status_change'])) {
	$customer_id = $_POST['customer_id'];	
	$status   	 = $_POST['status_val'];	
	$data 	     = Array ('status' =>$status);
	$db->where('customer_id', $customer_id);
	$db->update('customer',$data);
}
if(isset($_POST['delete_data']) && $_POST['delete_data'] == 'Y') {
    
  $customer_ids = explode(",",$_POST['delete_customer']); 
  $db->where('customer_id',$customer_ids, 'IN');
  $db->delete('customer');
  exit;
}

$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>'Customer List',"page"=>$page,"top_title"=>$top_title,"active_page"=>$active_page);	
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>