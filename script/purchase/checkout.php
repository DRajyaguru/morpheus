<?php
ob_start();
$top="customer/top/top.tpl";
$middle="customer/middle/purchase/checkout.tpl";
$bottom="customer/bottom/bottom.tpl";
$indexfile="customer/index.tpl";

$customer_data = array();

$title = 'Morpheus - Checkout';
$customer_id = $_SESSION['customer_id'];
$customer_credits = $db->where('customer_id', $customer_id)->getValue("customer","total_credits");
$login_url = HTTP_HOST.ROOT_DIR_PATH.'index.php?file=customer/login';

$customer_data = $db->where('customer_id',$customer_id)->getOne("customer");

$checkout_details = array();
$checkout_info = $db->where('customer_id',$customer_id)->getOne("customers_cart");
$video_details = unserialize($checkout_info['video_details']);

foreach($video_details as $video_details_data) {
 $video_sku_list[] = $video_details_data['product_sku'];
}
$video_sku = implode(", ",$video_sku_list);


if (!isset($_SESSION['customer_id']) && empty($_SESSION['customer_id'])) {
    $login_url = HTTP_HOST.ROOT_DIR_PATH.'index.php?file=customer/login';
	header("Location: ".$login_url);	
}

// Add Credits
if(isset($_POST['action']) && $_POST["action"] == 'add') {
   $credits_item = 'credits_item_';	
   $credits_id = $_POST['credits_id'];
   $credits	   = $_POST['credits'];
   $amount     = $_POST['amount'];
  
	   
   $credits_cart_info = $db->where('customer_id', $customer_id)->getOne("credits_cart");
	// echo $customer_data;exit;
	
   if($db->count>0)
   {
	 $total_credits = 0;  
	 $total_amount = 0;
	 $credits_details = unserialize($credits_cart_info['credits_details']);
	 $lastKey 		  = key(array_slice($credits_details, -1, 1, true));
	 $credits_item_last = explode("_", $lastKey );
	 $counter           = end($credits_item_last) + 1;
	 $credits_item 		= $credits_item.$counter; 
	 $credits_data[$credits_item] = array("credits_item"=>$credits_item,"credits_id"=>$credits_id,"credits"=>$credits,"amount"=>$amount);
	 
	 $credits_data = $credits_details + $credits_data;

	 foreach($credits_data as $credits_data_fetch) {
		$total_credits += $credits_data_fetch['credits'];
		$total_amount  += $credits_data_fetch['amount'];
	 }
	 $credits_array_serialize = serialize($credits_data);
	 $update_data = array ("total_credits"=>$total_credits,"total_amount"=>$total_amount,"credits_details"=>$credits_array_serialize);
	 $db->where ('customer_id', $customer_id);
	 $db->update('credits_cart', $update_data);
	 
   } else {
	 $credits_item = $credits_item.'_1';   
	 $credits_data[$credits_item_counter] = array("credits_item"=>$credits_item,"credits_id"=>$credits_id,"credits"=>$credits,"amount"=>$amount);
	 $credits_array_serialize = serialize($credits_data);  
   	 $insert_data = array ("customer_id"=>$customer_id,"total_credits"=>$credits,"total_amount"=>$amount,"credits_details"=>$credits_array_serialize);		
     $db->insert('credits_cart', $insert_data);
   }	
   header("Location: ".$_SERVER['PHP_SELF'].'?'.$_SERVER['QUERY_STRING']);
}

// Remove Credits
if(isset($_POST['action']) && $_POST["action"] == 'remove')
{
	$total_credits = 0;
	$total_amount = 0;
	
	$customer_id = $_POST['customer_id'];
	$credits_item = $_POST['credits_item'];
	
	$credits_cart_info = $db->where('customer_id', $customer_id)->getOne("credits_cart");
	$credits_data = unserialize($credits_cart_info['credits_details']);
	unset($credits_data[$credits_item]);
	foreach($credits_data as $credits_data_fetch) {
		$total_credits += $credits_data_fetch['credits'];
		$total_amount  += $credits_data_fetch['amount'];
	}
	$credits_array_serialize = serialize($credits_data); 
	$update_data = array ("total_credits"=>$total_credits,"total_amount"=>$total_amount,"credits_details"=>$credits_array_serialize);
	$db->where ('customer_id', $customer_id);
	$db->update('credits_cart', $update_data);	
	exit;
}

$credits_details = array();
$credits_info = $db->where('customer_id',$customer_id)->getOne("credits_cart");
$credits_details = unserialize($credits_info['credits_details']);

/*if(!$credits_details) {
 $home_url = HTTP_HOST.ROOT_DIR_PATH;
 header("Location: ".$home_url);	
}*/

$localvars = array("top"=>$top,"bottom"=>$bottom,"middle"=>$middle,"title"=>$title,"credits_details"=>$credits_details,"credits_info"=>$credits_info,"customer_credits"=>$customer_credits,"customer_data"=>$customer_data,"video_details"=>$video_details,"checkout_info"=>$checkout_info,"video_sku"=>$video_sku);
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}

$smarty->display($indexfile);
?>