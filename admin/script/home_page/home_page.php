<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/home_page/home_page.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";
$page 		= "home_page";
$top_title  = "Morpheus Home Page";
$page_js_folder = 'home_page';
$page_js_name   = 'home_page';
$home_page_data = array();
$links_data = array();
$active_page = "settings";


if(isset($_POST['home_page']) && $_POST['home_page'] == 'Y') {
	$top_banner      =  $_POST["top_banner"];
	$personlized_video_generator	 =  $_POST["personlized_video_generator"];
	$about_info		 =  $_POST["about_info"];
  $copyright   = $_POST["copyright"];
  $home_page_id = $_POST["home_page_id"];
 
  //Links Input fields and Checkbox data
  $links = $_POST["links"];
  $name = $_POST["link_name"];
  $url = $_POST["link_url"];
  $status = $_POST["link_status"];
  $tab = $_POST["open_new_tab"];

  //echo '<pre>';
  //print_r($tab);
  //exit;
  // print_r($_POST);
//Count links Data
for($i = 0; $i < count($name); $i++)
{
  $links[$i]["link_name"] = $name[$i];
  $links[$i]["link_url"] = $url[$i];
  $links[$i]["link_status"] = $status[$i];
  $links[$i]["open_new_tab"] = $tab[$i];
}
echo '<pre>';print_r($links);
//Serialize link data
$links = serialize($links);

  $update_data = array ("top_banner"=>$top_banner,"personlized_video_generator"=>$personlized_video_generator,"about_info"=>$about_info,"copyright"=>$copyright,"links"=>$links);
  $db->where('home_page_id',$home_page_id);
  $db->update('home_page',$update_data);
}
$home_page_data = $db->getOne('home_page');
$links_data = unserialize($home_page_data['links']);
// echo '<pre>';print_r($links_data);exit;
$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>'Home Page Form',"page"=>$page,"top_title"=>$top_title,"links_data"=>$links_data,"home_page_data"=>$home_page_data,"page_js_folder"=>$page_js_folder,"page_js_name"=>$page_js_name,"active_page"=>$active_page);
$localvars = array_merge($global_arr, $localvars);
// echo '<pre>';print_r($localvars);exit;
foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);
?>