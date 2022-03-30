<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/credits/credits_list.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$page 		= "credits_list";
$top_title  = "Morpheus Credits List";
$credits_list = array();
$active_page = "credits";

if(isset($_POST['status_change'])) {
	$credits_id = $_POST['credits_id'];
	$status   	 = $_POST['status_val'];
	$data 	     = Array ('status' =>$status);
	$db->where('credits_id', $credits_id);
	$db->update('credits',$data);
}
if(isset($_POST['delete_data']) && $_POST['delete_data'] == 'Y') {
  $credits_ids = explode(",",$_POST['delete_credits']);
  $db->where('credits_id',$credits_ids, 'IN');
  $db->delete('credits');
  exit;
}

$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>'Credits Form',"page"=>$page,"top_title"=>$top_title,"credits_list"=>$credits_list,"active_page"=>$active_page);	
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>