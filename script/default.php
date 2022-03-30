<?php
ob_start();
$top="customer/top/top.tpl";
$middle="customer/middle/middle.tpl";
$bottom="customer/bottom/bottom.tpl";
$indexfile="customer/index.tpl";
	
$title = 'Front Page';
$home_page = 'Home';
	
$localvars = array("top"=>$top,"bottom"=>$bottom,"middle"=>$middle,"title"=>$title,"home_page"=>$home_page);
$localvars = array_merge($global_arr, $localvars);

//while (list($key, $value) = each ($localvars))

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}

$smarty->display($indexfile);
?>