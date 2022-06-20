<?php
ob_start();
$top="customer/top/top.tpl";
$middle="customer/middle/category/category.tpl";
$bottom="customer/bottom/bottom.tpl";
$indexfile="customer/index.tpl";
	
$title = 'Morpheus - Category Page';

if (!isset($_SESSION['customer_id']) && empty($_SESSION['customer_id'])) {
   $login_url = HTTP_HOST.ROOT_DIR_PATH.'index.php?file=customer/login';
   header("Location: ".$login_url);	
}

$category_id = $_GET['category_id'];
$db->where('category_id',$category_id);
$category_data = $db->getOne('category');

$db->orderBy ("p.display_order","asc");
$db->join("product p", "p.product_id=pc.product_id", "INNER");
$db->where('pc.category_id',$category_id)->where('p.status','Y');
$product_data = $db->get('product_category pc');

$localvars = array("top"=>$top,"bottom"=>$bottom,"middle"=>$middle,"title"=>$title,"category_data"=>$category_data,"product_data"=>$product_data);
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}

$smarty->display($indexfile);
?>