<?php
ob_start();
$top="customer/top/top.tpl";
$middle="customer/middle/credit/credit_purchase.tpl";
$bottom="customer/bottom/bottom.tpl";
$indexfile="customer/index.tpl";
	
$title = 'Morpheus - Credit Purchase';

$credits_data = $db->orderby('credits','ASC')->get('credits');

$localvars = array("top"=>$top,"bottom"=>$bottom,"middle"=>$middle,"title"=>$title,"credits_data"=>$credits_data);
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}

$smarty->display($indexfile);
?>