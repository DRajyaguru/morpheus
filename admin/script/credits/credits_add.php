<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/credits/credits_add.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$page 		= "credits";
$top_title  = "Morpheus Add Credits";
$credits_list = array();
$active_page = "credits";

//Credits Add & Update code
if(isset($_POST['add_credits']) && $_POST['add_credits'] == 'Y') {
	$package_name      =  $_POST["package_name"];
	$credits		 =  $_POST["credits"];	
	$amount		 =  $_POST["amount"];
	$description		 =  $_POST["description"];
	$status			 =  $_POST["status"] == 'Y'?'Y':'N';
	$date_added      =  date('Y-m-d H:i:s');
		

	if($_POST['credits_id']!='') {

		$credits_id = $_POST['credits_id'];				
		$update_data = array ("package_name"=>$package_name,"credits"=>$credits,"amount"=>$amount,"description"=>$description,"status"=>$status);
		$db->where ('credits_id', $credits_id);
		$db->update('credits', $update_data);
		exit;
	} else {
		$insert_data = array ("package_name"=>$package_name,"credits"=>$credits,"amount"=>$amount,"description"=>$description,"status"=>$status,"date_added"=>$date_added);
		$db->insert('credits', $insert_data);
    	exit;
	}
}

//Credits data fetch for Edit
if(isset($_GET['axn']) && $_GET['axn'] == 'edit') {
	$top_title  = "Morpheus Edit Credits";
	$title      = "Credits Edit";
	$credits_id	= $_GET["credits_id"]; 
	$db->where ("credits_id",$credits_id);
	$credits_list = $db->getOne('credits');		
}

$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>'Credits Form',"page"=>$page,"top_title"=>$top_title,"credits_list"=>$credits_list,"active_page"=>$active_page);	
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>