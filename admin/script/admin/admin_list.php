<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/admin/admin_list.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$page 		= "admin";
$top_title  = "Morpheus Admin List";
$active_page = 'users';

// Admin Status Change Code from Listing
if(isset($_POST['status_change'])) {
	$admin_id = $_POST['admin_id'];	
	$status   = $_POST['status_val'];	
	$data 	  =	Array ('status' =>$status);
	$db->where('admin_id', $admin_id);
	$db->update('admin',$data);
}

// Admin Add & Update Code
if(isset($_POST['add_admin']) && $_POST['add_admin'] == 'Y') {
	$admin_id       =   $_POST["admin_id"];
	$first_name		=	$_POST["first_name"];
	$last_name		=	$_POST["last_name"];
	$email			=	$_POST["admin_email"]; 
	$password	  	=	$_POST["admin_password"]; 	
	$status			=	$_POST["status"];
	$status		    =	$status == 'Y'?'Y':'N';
	$date_added     =   date('Y-m-d H:i:s');
	
	if($admin_id==0) {
		$insert_data = array ("first_name"=>$first_name,"last_name"=>$last_name,"email" =>$email,"password" => $password,"status"=>$status,"date_added"=>$date_added);
		$db->insert('admin', $insert_data);
	} else {	
		$update_value = array ("first_name"=>$first_name,"last_name"=>$last_name,"email" =>$email,"password" => $password,"status"=>$status);
		$db->where ('admin_id', $admin_id);
	    $db->update('admin',$update_value);
	}
	exit;
}

// Admin Delete Code
if(isset($_POST['delete_data']) && $_POST['delete_data'] == 'Y') {
   $admin_ids = explode(",",$_POST['admins_id']); 
   $db->where('admin_id',$admin_ids, 'IN');
   $db->delete('admin');
   exit;
}

// Admin Email already exist Code
if(isset($_POST['type']) && $_POST['type'] == 'email_exist_check') {
	$email	= $_POST["admin_email"]; 
	$admin_id	= $_POST["admin_id"]; 
	
	$db->where ("email",$email);
	if($admin_id!=0) {
	  $db->where ("admin_id",$admin_id,"!=");
	}
	$list=$db->get('admin');
	if(count($list) == 1) {
      $json['valid'] = false;
	} else {
      $json['valid'] = true;
	}
	echo json_encode($json);
	exit;	
}

// Admin Data fetch for Edit
if(isset($_POST['edit_admin']) && $_POST['edit_admin'] == 'Y') {
	$admin_id	= $_POST["admin_id"]; 
	$db->where ("admin_id",$admin_id);
	$list=$db->getOne('admin');
	echo json_encode($list);
	exit;	
}
	
$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>"Admin List","page"=>$page,"top_title"=>$top_title,"active_page"=>$active_page);	
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>