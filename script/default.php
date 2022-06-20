<?php
ob_start();
$top="customer/top/top.tpl";
$middle="customer/middle/middle.tpl";
$bottom="customer/bottom/bottom.tpl";
$indexfile="customer/index.tpl";
	
$title = 'Morpheus Homepage';
$home_page = 'Home';

$db->orderBy ("display_order","asc");
$category_list = $db->get('category');
	
$localvars = array("top"=>$top,"bottom"=>$bottom,"middle"=>$middle,"title"=>$title,"home_page"=>$home_page,"category_list"=>$category_list);
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}

$smarty->display($indexfile);
?>