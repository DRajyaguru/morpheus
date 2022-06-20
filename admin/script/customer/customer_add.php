<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/customer/customer_add.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$title      = "Customer Add";
$top_title  = "Morpheus Add Customer";
$active_page = "users";
$page_js_folder = 'customer';
$page_js_name   = 'save-customer';
$customer_list = array();

//Customer Add & Update code
if(isset($_POST['add_customer']) && $_POST['add_customer'] == 'Y') {
	$first_name      =  $_POST["first_name"];
	$last_name		 =  $_POST["last_name"];	
	$email_id		 =  $_POST["email_id"];
	$password		 =  $_POST["password"];
	$phone_no  		 =  $_POST["phone_no"];
	$address1   	 =  $_POST["address1"];
	$address2   	 =  $_POST["address2"];
	$city   		 =  $_POST["city"];
	$state   		 =  $_POST["state"];
	$country   		 =  $_POST["country"];
	$zipcode   		 =  $_POST["zipcode"];
	$total_credits   =  $_POST["total_credits"];
	$status			 =  $_POST["status"] == 'Y'?'Y':'N';
	$date_added      =  date('Y-m-d H:i:s');

	if($_POST['customer_id']!='') {
		$customer_id = $_POST['customer_id'];				
		$update_data = array ("first_name"=>$first_name,"last_name"=>$last_name,"email_id"=>$email_id,"password"=>$password,"phone_no"=>$phone_no,"address1"=>$address1,"address2"=>$address2,"city"=>$city,"state"=>$state,"country"=>$country,"zipcode"=>$zipcode,"total_credits"=>$total_credits,"status"=>$status);
		$db->where ('customer_id', $customer_id);
		$db->update('customer', $update_data);
	} else {
		$insert_data = array ("first_name"=>$first_name,"last_name"=>$last_name,"email_id"=>$email_id,"password"=>$password,"phone_no"=>$phone_no,"address1"=>$address1,"address2"=>$address2,"city"=>$city,"state"=>$state,"country"=>$country,"zipcode"=>$zipcode,"total_credits"=>$total_credits,"status"=>$status,"date_added"=>$date_added);
		$db->insert('customer', $insert_data);
	}
	exit;
}

//Customer Email already exist check code
if(isset($_POST['type']) && $_POST['type'] == 'customer_email_check') {
	$email_id = $_POST["email_id"];
	$customer_id = $_POST["customer_id"]; 
	
	$db->where ("email_id",$email_id);
	if($customer_id!=0) {
	  $db->where ("customer_id",$customer_id,"!=");
	}
	$list=$db->getOne('customer');
	if($list) {
      $json['valid'] = false;
	} else {
      $json['valid'] = true;
	}
	echo json_encode($json);
	exit;
}

//Customer Data fetch for Edit
if(isset($_GET['axn']) && $_GET['axn'] == 'edit') {
	$top_title  = "Morpheus Edit Customer";
	$title      = "Customer Edit";
	$customer_id	= $_GET["customer_id"]; 
	$db->where ("customer_id",$customer_id);
	$customer_list = $db->getOne('customer');		
}

$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>$title,"top_title"=>$top_title,"active_page"=>$active_page,"page_js_folder"=>$page_js_folder,"page_js_name"=>$page_js_name,"customer_list"=>$customer_list);	
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>