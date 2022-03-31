<?php
check_security();

$header		= ADMIN_TEMPLATE_PATH."admin/top/top.tpl";
$left 		= ADMIN_TEMPLATE_PATH."admin/left/left.tpl";
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/dashboard/list.tpl";
$footer		= ADMIN_TEMPLATE_PATH."admin/bottom/bottom.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/index.tpl";

$page = 'dashboard';
$top_title = 'Morpheus Dashboard';
$active_page = "dashboard";
	
$localvars = array("header"=>$header,"left"=>$left,"middle"=>$middle,"footer"=>$footer,"title"=>"Dashboard","page"=>$page,"top_title"=>$top_title,"active_page"=>$active_page);
$localvars = array_merge($global_arr, $localvars);

//while (list($key, $value) = each ($localvars)){
//$smarty->assign($key, $value);}

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}
$smarty->display($indexfile);	
?>