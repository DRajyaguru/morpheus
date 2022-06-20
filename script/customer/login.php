<?php
ob_start();
$top="customer/top/top.tpl";
$middle="customer/middle/customer/login.tpl";
$bottom="customer/bottom/bottom.tpl";
$indexfile="customer/index.tpl";
	
$title = 'Morpheus - Login';

if(isset($_SESSION['customer_id']) && !empty($_SESSION['customer_id']))
{
	$home_url = HTTP_HOST.ROOT_DIR_PATH;
	header("Location: ".$home_url);
}

// Customer Email exist check code
if(isset($_POST['type']) && $_POST['type'] == 'customer_email_check') {
	$email_id = $_POST["email_id"];
	
	$db->where ("email_id",$email_id);
	$list=$db->getOne('customer');
	if($list) {
      $response = 'true';
	} else {
      $response = 'false';
	}
	echo $response;
	exit;
}

if (isset($_SESSION['customer_register']) && $_SESSION['customer_register'] == 'Yes') {
    $_SESSION['customer_register'] = 'remove';
} else {
    unset($_SESSION["customer_register"]);
}

// Login Check
if(isset($_POST['login_check']) && $_POST['login_check'] == 'Y')
{
	$email_id = $_POST['email_id'];
	$password = $_POST['password'];
	$customer_info = $db->where('email_id', $email_id)->where('password', $password)->where('status', 'Y')->getOne("customer");
	if($db->count>0)
	{
		$_SESSION['check_timeout'] 	   = strtotime(date('m/d/Y h:i:s', time()));
		$_SESSION['customer_id']       = $customer_info['customer_id'];
		$_SESSION['customer_name']     = $customer_info['first_name'];
		$_SESSION['customer_email']    = $customer_info['email_id'];
		$_SESSION['customer_login']    = 'Yes';
		if(isset($_SESSION['videos_purchase']) && !empty($_SESSION['videos_purchase'])) {
		  $redirect_url = HTTP_HOST.ROOT_DIR_PATH.'index.php?file=purchase/cart';	
		} else {
		  $redirect_url = HTTP_HOST.ROOT_DIR_PATH;
		}
		echo $redirect_url;
	}
	else
	{
	    echo 0;
	}
	exit;
}

$localvars = array("top"=>$top,"bottom"=>$bottom,"middle"=>$middle,"title"=>$title);
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}

$smarty->display($indexfile);
?>