<?php
ob_start();
$top="customer/top/top.tpl";
$middle="customer/middle/webpage/webpage.tpl";
$bottom="customer/bottom/bottom.tpl";
$indexfile="customer/index.tpl";


$webpage_id = $_GET['webpage_id'];
$db->where('webpage_id',$webpage_id);
$webpage_data = $db->getOne('webpage');

$title = 'Morpheus - '.$webpage_data['page_title'];
$banner_img = $webpage_data['banner_img'];

$localvars = array("top"=>$top,"bottom"=>$bottom,"middle"=>$middle,"title"=>$title,"banner_img"=>$banner_img,"webpage_data"=>$webpage_data);
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}

$smarty->display($indexfile);
?>