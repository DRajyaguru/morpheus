<?php
$middle 	= ADMIN_TEMPLATE_PATH."admin/middle/default.tpl";
$indexfile	= ADMIN_TEMPLATE_PATH."admin/indexblank.tpl";
$invalid_login = '';
$page = 'login';
$page_js_folder = 'sign-in';
$page_js_name   = 'general';

// Admin Login Code
if(isset($_POST['username'])){
	$username = $_POST['username'];
	$password = $_POST['password'];
	$db->where ('email', $username );
	$db->where ('password', $password);
	$cols = Array ("admin_id","first_name","email");
	$credentials = $db->getOne('admin',$cols);
	if(!empty($credentials))
	{
	  $_SESSION['admin_user'] = $credentials["email"];
	  header("location:index.php?file=dashboard/list");
	  exit;
	} else {
	  $invalid_login = 'Y'; 	
	}
}

if(isset($_SESSION['admin_user'])&& $_SESSION['admin_user'] != '')
{
   header("location:index.php?file=dashboard/list");
   exit;
}

$localvars=array("middle"=>$middle,"title"=>"Morpheus Login","invalid_login"=>$invalid_login,"page"=>$page,"page_js_folder"=>$page_js_folder,"page_js_name"=>$page_js_name);
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}

$smarty->assign($key,$value);
$smarty->display($indexfile);
?>