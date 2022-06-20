<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/product/product_list.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$top_title  = "Morpheus Product List";
$active_page = "video";
$page_js_folder = 'product';
$page_js_name   = 'products';

// Product Status Change Code from Listing
if(isset($_POST['status_change'])) {
	$product_id = $_POST['product_id'];	
	$status   	 = $_POST['status_val'];	
	$data 	     = Array ('status' =>$status);
	$db->where('product_id', $product_id);
	$db->update('product',$data);
}

// Product Delete Code
if(isset($_POST['delete_data']) && $_POST['delete_data'] == 'Y') {
   $product_ids = explode(",",$_POST['products_id']);
   $db->where('product_id',$product_ids, 'IN');
   $list=$db->get('product',null,'product_img');
   foreach($list as $list_img) {
	  $path = '../assets/uploads/product/'.$list_img['product_img'];
      unlink($path);
   }
   
   $db->where('product_id',$product_ids, 'IN');
   $db->delete('product');
   
   $db->where('product_id',$product_ids, 'IN');
   $db->delete('product_category');
   
   $db->where('product_id',$product_ids, 'IN');
   $db->delete('product_extra_fields');
   exit;
}

// Update Display Order for Product
if(isset($_POST['update_display_order']) && $_POST['update_display_order'] == 'Y') {
	$product_data = json_decode($_POST['product_data'], TRUE);
	foreach($product_data as $product_order){
		$product_id    = $product_order['product_id'];
		$display_order = $product_order['display_order'];
		$data 	     = Array ('display_order' =>$display_order);
		$db->where('product_id', $product_id);
		$db->update('product',$data);
	}
	echo 'true';
	exit;
}

$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>"Product List","top_title"=>$top_title,"active_page"=>$active_page,"page_js_folder"=>$page_js_folder,"page_js_name"=>$page_js_name);	
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>