<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/webpage/webpage_add.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$page 		= "webpage";
$top_title  = "Morpheus Add Webpage";
$webpage_list = array();
$active_page = "webpage";

//Webpage Add & Update Code
if(isset($_POST['add_webpage']) && $_POST['add_webpage'] == 'Y') {
	$page_title      =  $_POST["page_title"];
	$description	   =  $_POST["description"];	
	$clean_url		   =  $_POST["clean_url"];
	$meta_title		   =  $_POST["meta_title"];
	$meta_description  =  $_POST["meta_description"]; 
	$status			       =  $_POST["status"] == 'Y'?'Y':'N';
	$date_added        =  date('Y-m-d H:i:s');
		

	if($_POST['webpage_id']!='') {
		$webpage_id = $_POST['webpage_id'];				
		$update_data = array ("page_title"=>$page_title,"description"=>$description,"status"=>$status,"clean_url"=>$clean_url,"meta_title"=>$meta_title,"meta_description"=>$meta_description);
		$db->where ('webpage_id', $webpage_id);
		$db->update('webpage', $update_data);
		exit;
	} else {
		
		$insert_data = array ("page_title"=>$page_title,"description"=>$description,"status"=>$status,"clean_url"=>$clean_url,"meta_title"=>$meta_title,"meta_description"=>$meta_description,"date_added"=>$date_added);
		$db->insert('webpage', $insert_data);
		exit;
	}
}

//Webpage Name Already Exists Code
if(isset($_POST['type']) && $_POST['type'] == 'webpage_name_check') {
	$webpage_name = $_POST["page_title"];
	$webpage_id = $_POST["webpage_id"]; 
	
	$db->where ("page_title",$webpage_name);
	if($webpage_id!=0) {
	  $db->where ("webpage_id",$webpage_id,"!=");
	}
	$list=$db->getOne('webpage');
	if($list) {
      $json['valid'] = false;
	} else {
      $json['valid'] = true;
	}
	echo json_encode($json);
	exit;
}

//Check Clean URL Code
if(isset($_POST['type']) && $_POST['type'] == 'clean_url_check') {
	$clean_url = $_POST["clean_url"];
	$webpage_id = $_POST["webpage_id"]; 
	
	$db->where ("clean_url",$clean_url);
	if($webpage_id!=0) {
	  $db->where ("webpage_id",$webpage_id,"!=");
	}
	$list=$db->getOne('webpage');
	if($list) {
      $json['valid'] = false;
	} else {
      $json['valid'] = true;
	}
	echo json_encode($json);
	exit;
}

//Webpage data fetch for Edit
if(isset($_GET['axn']) && $_GET['axn'] == 'edit') {
	$top_title  = "Morpheus Edit Webpage";
	$title      = "Webpage Edit";
	$webpage_id	= $_GET["webpage_id"]; 
	$db->where ("webpage_id",$webpage_id);
	$webpage_list = $db->getOne('webpage');
		
}
$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>'Webpage Form',"axn"=>$axn,"page"=>$page,"top_title"=>$top_title,"webpage_list"=>$webpage_list,"active_page"=>$active_page);	
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>