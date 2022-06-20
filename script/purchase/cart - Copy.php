<?php
ob_start();
$top="customer/top/top.tpl";
$middle="customer/middle/purchase/cart.tpl";
$bottom="customer/bottom/bottom.tpl";
$indexfile="customer/index.tpl";
	
$title = 'Morpheus - Cart';
$customer_id = $_SESSION['customer_id'];
$customer_credits = $db->where('customer_id', $customer_id)->getValue("customer","total_credits");

if (!isset($_SESSION['customer_id']) && empty($_SESSION['customer_id'])) {
    $login_url = HTTP_HOST.ROOT_DIR_PATH.'index.php?file=customer/login';
	header("Location: ".$login_url);	
}

// Add Product
if(isset($_POST['action']) && $_POST["action"] == 'add') {
   $product_id = $_POST['product_id'];
   $products_info = $db->where('product_id',$product_id)->getOne("product");
   $storyboard_id = $products_info['storyboard_id'];
   $credits = $products_info['credits'];
   $products_data[$storyboard_id] = array("product_id"=>$products_info['product_id'],"storyboard_id"=>$products_info['storyboard_id'],"name"=>$products_info['name'],"credits"=>$products_info['credits'],"sku"=>$products_info['sku'],"image"=>$products_info['product_img']);
   
   $customers_cart_info = $db->where('customer_id', $customer_id)->getOne("customers_cart");
   if($db->count>0)
   {
	 $total_credits = 0;  
	 $video_details = unserialize($customers_cart_info['video_details']);
	 $products_data = $video_details + $products_data;
	 foreach($products_data as $products_data_credits) {
		$total_credits += $products_data_credits['credits'];
	 }
	 $products_array_serialize = serialize($products_data);
	 $update_data = array ("total_credits"=>$total_credits,"video_details"=>$products_array_serialize);
	 $db->where ('customer_id', $customer_id);
	 $db->update('customers_cart', $update_data);
   } else {
	 $products_array_serialize = serialize($products_data);  
   	 $insert_data = array ("customer_id"=>$customer_id,"total_credits"=>$credits,"video_details"=>$products_array_serialize);	
     $db->insert('customers_cart', $insert_data);
   }
}

// Remove Product
if(isset($_POST['action']) && $_POST["action"] == 'remove')
{
	$total_credits = 0;
	$total_element = 0;
	$customer_id = $_POST['customer_id'];
	$storyboard = $_POST['storyboard_id'];
	$customers_cart_info = $db->where('customer_id', $customer_id)->getOne("customers_cart");
	$products_data = unserialize($customers_cart_info['video_details']);
	unset($products_data[$storyboard]);
	foreach($products_data as $products_data_credits) {
		$total_credits += $products_data_credits['credits'];
		$total_element++;
	}
	$products_array_serialize = serialize($products_data); 
	$update_data = array ("total_credits"=>$total_credits,"video_details"=>$products_array_serialize); 
	$db->where ('customer_id', $customer_id);
	$db->update('customers_cart', $update_data);
	
	if(count($products_data) > 0) {
	   header("Location: ".$_SERVER['PHP_SELF'].'?'.$_SERVER['QUERY_STRING']);
	} else {
	   $home_url = HTTP_HOST.ROOT_DIR_PATH;
	   header("Location: ".$home_url);
	}
	
	/*$return_response[] = array("total_element"=>$total_element,"total_credits"=>$total_credits);
	echo json_encode($return_response);
	exit;*/
}

$cart_details = array();
$cart_info = $db->where('customer_id',$customer_id)->getOne("customers_cart");
$video_details = unserialize($cart_info['video_details']);

$localvars = array("top"=>$top,"bottom"=>$bottom,"middle"=>$middle,"title"=>$title,"customer_credits"=>$customer_credits,"video_details"=>$video_details,"cart_info"=>$cart_info);
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}

$smarty->display($indexfile);
?>