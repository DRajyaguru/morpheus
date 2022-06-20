<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/product/product_add.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$title      = "Product Add";
$top_title  = "Morpheus Add Product";
$active_page = "video";
$page_js_folder = 'product';
$page_js_name   = 'save-product';
$category_list=$db->get('category',null,'category_id,category_name');
$product_list  = array();
$product_category_data = array();
$product_extrafields_data = array();

// Product Add & Update Code
if(isset($_POST['add_product']) && $_POST['add_product'] == 'Y') {	
	$storyboard_id	   =  $_POST["storyboard_id"];	
	$name        	   =  $_POST["video_name"];
	$sku               =  $_POST["sku"];
	$price             =  $_POST["price"];
	$credits           =  $_POST["credits"];
	$static_video_link =  $_POST["static_video_preview"];
	$description	   =  $_POST["description"];
	$video_img_url	   =  strtok($_POST["video_img_url"], '?');
	$clean_url		   =  $_POST["clean_url"];
	$meta_title		   =  $_POST["meta_title"];
	$meta_description  =  $_POST["meta_description"]; 
	$status			   =  $_POST["status"] == 'Y'?'Y':'N';
	$date_added        =  date('Y-m-d H:i:s');
	if($price == '') {
	   $price = '0.00';	
	}
	if($credits == '') {
	   $credits = 0;
	}
	
	if($_POST['product_id']!='') {
		$product_id = $_POST['product_id'];
		$update_product = array ("name"=>$name,"sku"=>$sku,"price"=>$price,"credits"=>$credits,"static_video_link"=>$static_video_link,"description"=>$description,"clean_url"=>$clean_url,"meta_title"=>$meta_title,"meta_description"=>$meta_description,"status"=>$status);
		$db->where ('product_id', $product_id);
		$db->update('product', $update_product);
		// echo $this->db->last_query();exit;
		// echo '<pre>';print_r($update_product);exit;
		
		$db->where('product_id',$product_id);
   		$db->delete('product_category');
		
		foreach($_POST['label'] as $key=>$value)
		{
		  $extra_fields_id = $key;
		  $extra_field_label = $value['extra_fields_label'];
		  if($extra_field_label == '') {
		   $extra_field_label = $db->where('product_extra_fields_id', $extra_fields_id)->getValue("product_extra_fields","extra_field_name");
		  }
		  
		  $update_product_extra_fields = array ("extra_field_label"=>$extra_field_label);
		  $db->where ('product_extra_fields_id', $extra_fields_id);
		  $db->update('product_extra_fields', $update_product_extra_fields);
		}
		foreach($_POST['position'] as $key=>$value)
		{
		  $extra_fields_id = $key;
		  $display_order = $value['extra_fields_order'];
		  $update_product_extra_fields = array ("display_order"=>$display_order);
		  $db->where ('product_extra_fields_id', $extra_fields_id);
		  $db->update('product_extra_fields', $update_product_extra_fields);
		}
		
	} else {
		$ext = pathinfo($video_img_url, PATHINFO_EXTENSION);
		$video_img = $storyboard_id.'.'.$ext;
		file_put_contents('../assets/uploads/product/'.$video_img, file_get_contents($video_img_url));
		
		$insert_product = array ("storyboard_id"=>$storyboard_id,"name"=>$name,"sku"=>$sku,"price"=>$price,"credits"=>$credits,"static_video_link"=>$static_video_link,"description"=>$description,"product_img"=>$video_img,"clean_url"=>$clean_url,"meta_title"=>$meta_title,"meta_description"=>$meta_description,"status"=>$status,"date_added"=>$date_added);
		$product_id = $db->insert('product', $insert_product);
		// echo $this->db->last_query();exit;
		// echo '<pre>';print_r($product_id);exit;
		
		$extra_fields_name =  $_POST['extra_fields'];
		$extra_fields_list = explode(',',$extra_fields_name);
		foreach($extra_fields_list as $extra_fields) {
		  $field_name      = $extra_fields;
		  $field_names     = str_replace(' ', '-', $field_name);
		  $field_label     = $field_names.'_Label';
		  $field_position  = $field_names.'_Position'; 
		  $field_value     = $_POST[$field_names];
		  $field_label     = $_POST[$field_label];
		  $field_position  = $_POST[$field_position];
		  if($field_label==''){
			 $field_label = $field_name; 
		  }
		  $insert_product_extra_fields = array ("product_id"=>$product_id,"extra_field_name"=>$field_name,"extra_field_label"=>$field_label,"extra_field_value"=>$field_value,"display_order"=>$field_position);
		  $db->insert('product_extra_fields', $insert_product_extra_fields);	
		}
	}
	$category_ids      =  $_POST["select_category"];
	foreach($category_ids as $category_id) {
	  $insert_product_category = array ("product_id"=>$product_id,"category_id"=>$category_id);
	  $db->insert('product_category', $insert_product_category);	
	}
	exit;
}

// Storyboard ID already exist Code
if(isset($_POST['type']) && $_POST['type'] == 'storyboard_id_check') {
	$storyboard_id = $_POST["storyboard_id"];
	$product_id = $_POST["product_id"]; 
	
	$db->where ("storyboard_id",$storyboard_id);
	if($product_id!=0) {
	  $db->where ("product_id",$product_id,"!=");
	}
	$list=$db->getOne('product');
	if($list) {
      $json['valid'] = false;
	} else {
      $json['valid'] = true;
	}
	echo json_encode($json);
	exit;
}

// Video Name already exist Code
if(isset($_POST['type']) && $_POST['type'] == 'video_name_check') {
	$video_name = $_POST["video_name"];
	$product_id = $_POST["product_id"]; 
	
	$db->where ("name",$video_name);
	if($product_id!=0) {
	  $db->where ("product_id",$product_id,"!=");
	}
	$list=$db->getOne('product');
	if($list) {
      $json['valid'] = false;
	} else {
      $json['valid'] = true;
	}
	echo json_encode($json);
	exit;
}

// Product SKU already exist Code
if(isset($_POST['type']) && $_POST['type'] == 'sku_check') {
	$sku = $_POST["sku"];
	$product_id = $_POST["product_id"]; 
	
	$db->where ("sku",$sku);
	if($product_id!=0) {
	  $db->where ("product_id",$product_id,"!=");
	}
	$list=$db->getOne('product');
	if($list) {
      $json['valid'] = false;
	} else {
      $json['valid'] = true;
	}
	echo json_encode($json);
	exit;
}

// Product Clean URL already exist Code
if(isset($_POST['type']) && $_POST['type'] == 'clean_url_check') {
	$clean_url = $_POST["clean_url"];
	$product_id = $_POST["product_id"]; 
	
	$db->where ("clean_url",$clean_url);
	if($product_id!=0) {
	  $db->where ("product_id",$product_id,"!=");
	}
	$list=$db->getOne('product');
	if($list) {
      $json['valid'] = false;
	} else {
      $json['valid'] = true;
	}
	echo json_encode($json);
	exit;
}

// Product Data fetch for Edit
if(isset($_GET['axn']) && $_GET['axn'] == 'edit') {
	$top_title  = "Morpheus Edit Product";
	$title      = "Product Edit";
	$product_id	= $_GET["product_id"]; 
	$db->where ("product_id",$product_id);
	$product_list = $db->getOne('product');
	
	$db->join("category c", "c.category_id=pc.category_id", "INNER");
    $db->where('pc.product_id',$product_id);
    $product_category_data = $db->get('product_category pc',null,'c.category_id');
	
	$product_category_list=array();
	foreach($product_category_data as $v) {
		array_push($product_category_list, $v['category_id']);
	}

    $db->orderBy("pef.display_order","asc");
    $db->orderBy("pef.product_extra_fields_id","asc");
    $db->join("product_extra_fields pef", "pef.product_id=p.product_id", "LEFT");
    $db->where('p.product_id',$product_id);
    $product_extrafields_data = $db->get('product p',null,'pef.product_id,pef.product_extra_fields_id,pef.extra_field_name,pef.extra_field_label,pef.extra_field_value,pef.display_order');
}

$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>$title,"top_title"=>$top_title,"active_page"=>$active_page,"page_js_folder"=>$page_js_folder,"page_js_name"=>$page_js_name,"category_list"=>$category_list,"product_list"=>$product_list,"product_category_data"=>$product_category_data,"product_extrafields_data"=>$product_extrafields_data,"product_category_list"=>$product_category_list);	
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>