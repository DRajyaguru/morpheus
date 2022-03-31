<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/category/category_add.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$page 		= "category";
$title      = "Category Add";
$top_title  = "Morpheus Add Category";
$category_list       = array();
$active_page = "video";

// Category Add & Update Code
if(isset($_POST['add_category']) && $_POST['add_category'] == 'Y') {
	$category_name     =  $_POST["category_name"];
	$description	   =  $_POST["description"];	
	$category_img      =  '';
	$img_name    	   =  $_POST['img_name'];
	$clean_url		   =  $_POST["clean_url"];
	$meta_title		   =  $_POST["meta_title"];
	$meta_description  =  $_POST["meta_description"]; 
	$status			   =  $_POST["status"] == 'Y'?'Y':'N';
	$date_added        =  date('Y-m-d H:i:s');
	
	if($_FILES['file']['name'] != '' && $_FILES['file']['name'] != $img_name){
		$category_img = $_FILES['file']['name'];
		$img_location = '../assets/uploads/category/'.$category_img;
		move_uploaded_file($_FILES['file']['tmp_name'], $img_location);
	}
	
	if($_POST['category_id']!='') {
		$category_id = $_POST['category_id'];
		if($img_name=='') {
			$db->where('category_id',$category_id);
			$category_img_remove = $db->getOne('category','category_img');
			$img_unlink = $category_img_remove['category_img'];
			if($_FILES['file']['name'] != $img_unlink) {
			  $path = '../assets/uploads/category/'.$img_unlink;
      		  unlink($path);
			}
		} else {
			$category_img = $img_name;
		}
		
		$update_data = array ("category_name"=>$category_name,"description"=>$description,"category_img" =>$category_img,"clean_url"=>$clean_url,"meta_title"=>$meta_title,"meta_description"=>$meta_description,"status"=>$status);
		$db->where ('category_id', $category_id);
		$db->update('category', $update_data);
		exit;
	} else {
		$insert_data = array ("category_name"=>$category_name,"description"=>$description,"category_img" =>$category_img,"clean_url"=>$clean_url,"meta_title"=>$meta_title,"meta_description"=>$meta_description,"status"=>$status,"date_added"=>$date_added);
		$db->insert('category', $insert_data);
		exit;
	}
}


if(isset($_POST['type']) && $_POST['type'] == 'category_name_check') {
	$category_name = $_POST["category_name"];
	$category_id = $_POST["category_id"]; 
	
	$db->where ("category_name",$category_name);
	if($category_id!=0) {
	  $db->where ("category_id",$category_id,"!=");
	}
	$list=$db->getOne('category');
	if($list) {
      $json['valid'] = false;
	} else {
      $json['valid'] = true;
	}
	echo json_encode($json);
	exit;
}

//Clean URL check code
if(isset($_POST['type']) && $_POST['type'] == 'clean_url_check') {
	$clean_url = $_POST["clean_url"];
	$category_id = $_POST["category_id"]; 
	
	$db->where ("clean_url",$clean_url);
	if($category_id!=0) {
	  $db->where ("category_id",$category_id,"!=");
	}
	$list=$db->getOne('category');
	if($list) {
      $json['valid'] = false;
	} else {
      $json['valid'] = true;
	}
	echo json_encode($json);
	exit;
}

//Category data fetch for edit
if(isset($_GET['axn']) && $_GET['axn'] == 'edit') {
	$top_title  = "Morpheus Edit Category";
	$title      = "Category Edit";
	$category_id	= $_GET["category_id"]; 
	$db->where ("category_id",$category_id);
	$category_list = $db->getOne('category');
}

$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>$title,"page"=>$page,"top_title"=>$top_title,"category_list"=>$category_list,"active_page"=>$active_page);	
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>