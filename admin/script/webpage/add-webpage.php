<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/webpage/add-webpage.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$page 		= "webpage";
$top_title  = "Morpheus Webpage Form";

// echo 1;
// exit;
if(isset($_POST['status_change'])) {
	$webpage_id = $_POST['webpage_id'];	
	$status   = $_POST['status_val'];
	$data 	  =	Array ('status' =>$status);
	$db->where('webpage_id', $webpage_id);
	$db->update('webpage',$data);
}
if(isset($_POST['add_webpage'])) {
	$page_title		=	$_POST["page_title"];
    $description    =   $_POST["description"];
	$status			=	$_POST["status"];
	$status		    =	$status == 'Y'?'Y':'N';
	$seo_title   	=	$_POST["seo_title"];
	$seo_url  		=	$_POST["seo_url"];
	$seo_description  	=	$_POST["seo_description"];
	$data = array ("page_title"=>$page_title,"description"=>$description,"status"=>$status,"seo_title"=>$seo_title,"seo_url"=>$seo_url,"seo_description"=>$seo_description);
	$db->insert('webpage', $data);
	// echo "<pre>";
	// echo $this->db->last_query($data);
	exit;
}

if(isset($_POST['delete_data'])) {
   $db->where('webpage_id',$_POST['delete_webpage'], 'IN');
   $db->delete('webpage');
   exit;
}
$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>'Webpage Form',"page"=>$page,"top_title"=>$top_title);	
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>