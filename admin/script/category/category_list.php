<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/category/category_list.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$top_title  = "Morpheus Category List";
$active_page = "video";
$page_js_folder = 'category';
$page_js_name   = 'categories';

// Category Status Change Code from Listing
if(isset($_POST['status_change'])) {
	$category_id = $_POST['category_id'];	
	$status   	 = $_POST['status_val'];	
	$data 	     = Array ('status' =>$status);
	$db->where('category_id', $category_id);
	$db->update('category',$data);	
}

// Category Delete Code
if(isset($_POST['delete_data']) && $_POST['delete_data'] == 'Y') {
   $category_ids = explode(",",$_POST['categories_id']);
   $db->where('category_id',$category_ids, 'IN');
   $list=$db->get('category',null,'category_img');
   foreach($list as $list_img) {
	  $path = '../assets/uploads/category/'.$list_img['category_img'];
      unlink($path);
   }
   
   //$category_ids = explode(",",$_POST['categories_id']); 
   $db->where('category_id',$category_ids, 'IN');
   $db->delete('category');
   exit;
}

// Update Display Order for Category
if(isset($_POST['update_display_order']) && $_POST['update_display_order'] == 'Y') {
	$category_data = json_decode($_POST['category_data'], TRUE);
	foreach($category_data as $category_order){
		$category_id   = $category_order['category_id'];
		$display_order = $category_order['display_order'];
		$data 	     = Array ('display_order' =>$display_order);
		$db->where('category_id', $category_id);
		$db->update('category',$data);
	}
	echo 'true';
	exit;
}
	
$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>"Category List","top_title"=>$top_title,"active_page"=>$active_page,"page_js_folder"=>$page_js_folder,"page_js_name"=>$page_js_name);	
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>