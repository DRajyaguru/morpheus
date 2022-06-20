<?php
ob_start();
$top="customer/top/top.tpl";
$middle="customer/middle/purchase/checkout.tpl";
$bottom="customer/bottom/bottom.tpl";
$indexfile="customer/index.tpl";
	
$title = 'Morpheus - Checkout';
$customer_id = $_SESSION['customer_id'];

/*echo '<pre>';
print_r($_SESSION["credits_purchase"]);
exit;*/
//unset($_SESSION["credits_purchase"]);
$login_url = HTTP_HOST.ROOT_DIR_PATH.'index.php?file=customer/login';

// Add Credits
if(isset($_POST['action']) && $_POST["action"] == 'add') {
	$credits_item = 'credits_item_';
	$credits_id = $_POST['credits_id'];
	$credits	= $_POST['credits'];
	$amount     = $_POST['amount'];

	$counter = 1;
    if(isset($_SESSION["credits_purchase"]))
	{	
		//$x = end(explode("_",end($_SESSION["credits_purchase"])['credits_item']));
		$end_value = end($_SESSION["credits_purchase"]);
		$credits_item_val  = $end_value['credits_item'];
		$credits_item_last = explode("_", $credits_item_val );
		$counter           = end($credits_item_last) + 1;
		
		$credits_array = array(
			 	'credits_item' =>  $credits_item.$counter,
				'credits_id'   =>  $credits_id,  
		);
		$_SESSION["credits_purchase"][] = $credits_array;
	}
	else
	{
		$credits_array = array(
		 		'credits_item' =>  $credits_item.$counter,
				'credits_id'  =>  $credits_id,  
		);
		$_SESSION["credits_purchase"][] = $credits_array;
	}
	
	if($_SESSION['customer_email']=='')	{
	   header("Location: ".$login_url);
	} else {
	   header("Location: ".$_SERVER['PHP_SELF'].'?'.$_SERVER['QUERY_STRING']);
	}
}

// Remove Credits
if(isset($_POST['action']) && $_POST["action"] == 'remove')
{
	$credits_item = $_POST['credits_item'];
	foreach($_SESSION["credits_purchase"] as $keys => $values)
	{
	  if($values["credits_item"] == $credits_item)
	  {
		unset($_SESSION["credits_purchase"][$keys]);
		$_SESSION["credits_purchase"] = array_values($_SESSION["credits_purchase"]);
	  }
	}
	exit;
}

if (isset($_SESSION['credits_purchase']) && !empty($_SESSION['credits_purchase'])) {
	$credits_array = array();
	$total_credits = 0;
	$total_amount = 0;
	foreach($_SESSION["credits_purchase"] as $keys => $values){
		$credits_item = $values['credits_item'];
		$credits_id  = $values['credits_id'];
		$credits_info = $db->where('credits_id', $credits_id)->where('status', 'Y')->getOne("credits","credits_id,credits,amount");
		$total_credits = $total_credits + $credits_info['credits'];
		$total_amount  = $total_amount + $credits_info['amount'];
		$credits_array[$credits_item] = array("credits_item"=>$credits_item,"credits_id"=>$credits_id,"credits"=>$credits_info['credits'],"amount"=>$credits_info['amount']);
	}
	$credits_array_serialize = serialize($credits_array);
	
	$db->where ("customer_id",$customer_id);
	$list=$db->getOne('credits_cart');
	if($list) {
      $update_data = array ("total_credits"=>$total_credits,"total_amount"=>$total_amount,"credits_details"=>$credits_array_serialize);
	  $db->where ('customer_id', $customer_id);
	  $db->update('credits_cart', $update_data);
	} else {
      $insert_data = array ("customer_id"=>$customer_id,"total_credits"=>$total_credits,"total_amount"=>$total_amount,"credits_details"=>$credits_array_serialize);	
	  $db->insert('credits_cart', $insert_data);
	}
}

$credits_details = array();
$credits_info = $db->where('customer_id',$customer_id)->getOne("credits_cart");
$credits_details = unserialize($credits_info['credits_details']);

if ($_SESSION['customer_email']=='' || !$credits_details) {
	header("Location: ".$login_url);
}

if (!isset($_SESSION['credits_purchase']) && empty($_SESSION['credits_purchase']) && $credits_details) {
	foreach($credits_details as $credits_details_data) {
		$credits_array = array(
			'credits_item' =>  $credits_details_data['credits_item'],
			'credits_id'   =>  $credits_details_data['credits_id'],  
	   );
	   $_SESSION["credits_purchase"][] = $credits_array;
	}
}

$localvars = array("top"=>$top,"bottom"=>$bottom,"middle"=>$middle,"title"=>$title,"credits_details"=>$credits_details,"credits_info"=>$credits_info);
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}

$smarty->display($indexfile);
?>