<?php
check_security();


$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/webpage/webpage_list.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$page 		= "webpage_list";
$top_title  = "Morpheus Webpage List";
$active_page = "webpage";

//Webpage status check code
if(isset($_POST['status_change'])) {
	$webpage_id = $_POST['webpage_id'];	
	$status   	 = $_POST['status_val'];	
	$data 	     = Array ('status' =>$status);
	$db->where('webpage_id', $webpage_id);
	$db->update('webpage',$data);
}

//Webpage delete code
if(isset($_POST['delete_data']) && $_POST['delete_data'] == 'Y') {
    
  $webpage_ids = explode(",",$_POST['delete_webpages']); 
  $db->where('webpage_id',$webpage_ids, 'IN');
  $db->delete('webpage');
  exit;
}

$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>'Webpage List',"page"=>$page,"top_title"=>$top_title,"active_page"=>$active_page);	
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>