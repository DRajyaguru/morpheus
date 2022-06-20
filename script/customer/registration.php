<?php
ob_start();
$top="customer/top/top.tpl";
$middle="customer/middle/customer/registration.tpl";
$bottom="customer/bottom/bottom.tpl";
$indexfile="customer/index.tpl";
	
$title = 'Morpheus - Registration';

if($_SESSION['customer_email']!='')
{
	$home_url = HTTP_HOST.ROOT_DIR_PATH;
	header("Location: ".$home_url);
}
$db->where('webpage_id','3');
$description = $db->getValue('webpage','description');


//Customer Email already exist check code
if(isset($_POST['type']) && $_POST['type'] == 'customer_email_check') {
	$email_id = $_POST["email_id"];
	
	$db->where ("email_id",$email_id);
	$list=$db->getOne('customer');
	if($list) {
      $response = 'false';
	} else {
      $response = 'true';
	}
	echo $response;
	exit;
}

//Customer Registration
if(isset($_POST['btn_get_started']))
{
    $first_name    = $_POST['first_name'];
	$last_name     = $_POST['last_name'];
	$email_id      = $_POST['email_id'];
	$password      = $_POST['password'];
	$status      =  'N';
	$date_added  =  date('Y-m-d H:i:s');
	$data = array ("first_name"=>$first_name,"last_name"=>$last_name,"email_id"=>$email_id,"password"=>$password,"status"=>$status,"date_added"=>$date_added);	
	$db->insert('customer', $data);
	$_SESSION['customer_register']='Yes';
	header("Location: index.php?file=customer/login");
}

$localvars = array("top"=>$top,"bottom"=>$bottom,"middle"=>$middle,"title"=>$title,'description'=>$description);
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}

$smarty->display($indexfile);
?>