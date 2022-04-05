<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/order/order_list.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$page 		= "order_list";
$top_title  = "Morpheus Order List";
$active_page = "orders";

//order Status Check Code
if(isset($_POST['status_change'])) {
	$order_id = $_POST['order_id'];	
	$status   	 = $_POST['status_val'];	
	$data 	     = Array ('status' =>$status);
	$db->where('order_id', $order_id);
	$db->update('orders',$data);
}

//order Delete Code
if(isset($_POST['delete_data']) && $_POST['delete_data'] == 'Y') {
    
  $order_ids = explode(",",$_POST['delete_order']); 
  $db->where('order_id',$order_ids, 'IN');
  $db->delete('orders');
  exit;
}

$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>'Order List',"page"=>$page,"top_title"=>$top_title,"active_page"=>$active_page);	
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>