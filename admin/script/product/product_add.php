<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/product/product_add.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$page 		= "product";
$title      = "Product Add";
$top_title  = "Morpheus Add Product";
$active_page = "inventory";

$category_list=$db->get('category',null,'category_id,category_name');

if(isset($_POST['add_product']) && $_POST['add_product'] == 'Y') {
	/*echo '<pre>';
	print_r($_POST);
	exit;*/
	
    $category_ids      =  $_POST["select_category"];
	$extra_fields_name = $_POST['extra_fields_name'];
	$storyboard_id	   =  $_POST["storyboard_id"];	
	$name        	   =  $_POST["video_name"];
	$sku               =  $_POST["sku"];
	$price             =  $_POST["price"];
	$credits           =  $_POST["credits"];
	$description	   =  $_POST["description"];
	$product_img   	   =  '';
	$clean_url		   =  $_POST["clean_url"];
	$meta_title		   =  $_POST["meta_title"];
	$meta_description  =  $_POST["meta_description"]; 
	$status			   =  $_POST["status"] == 'Y'?'Y':'N';
	$date_added        =  date('Y-m-d H:i:s');
	
	$insert_product = array ("storyboard_id"=>$storyboard_id,"name"=>$name,"sku" =>$sku,"price"=>$price,"credits"=>$credits,"description"=>$description,"product_img"=>"","clean_url"=>$clean_url,"meta_title"=>$meta_title,"meta_description"=>$meta_description,"status"=>$status,"date_added"=>$date_added);
	$product_id = $db->insert('product', $insert_product);
	$category_ids_list = explode(',',$category_ids);
	foreach($category_ids_list as $category_id) {
	  $insert_product_category = array ("product_id"=>$product_id,"category_id"=>$category_id);
	  $db->insert('product_category', $insert_product_category);	
	}
	
	$extra_fields_list = explode(',',$extra_fields_name);
	foreach($extra_fields_list as $extra_fields) {
		$field_name  = $extra_fields;
		$field_value = $_POST[$field_name];
		$insert_product_extra_fields = array ("product_id"=>$product_id,"extra_field_name"=>$field_name,"extra_field_value"=>$field_value);
	    $db->insert('product_extra_fields', $insert_product_extra_fields);	
	}
	exit;
}

$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>$title,"page"=>$page,"top_title"=>$top_title,"category_list"=>$category_list,"active_page"=>$active_page);	
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>