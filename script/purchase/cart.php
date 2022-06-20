<?php
ob_start();
$top="customer/top/top.tpl";
$middle="customer/middle/purchase/cart.tpl";
$bottom="customer/bottom/bottom.tpl";
$indexfile="customer/index.tpl";
	
$title = 'Morpheus - Cart';
$customer_id = $_SESSION['customer_id'];
$customer_credits = $db->where('customer_id', $customer_id)->getValue("customer","total_credits");

$videos_array = array();
if (!isset($_SESSION['customer_id']) && empty($_SESSION['customer_id'])) {
	if(isset($_POST['product_id']) && !empty($_POST['product_id'])) {
	  $product_id = $_POST['product_id'];
	  $videos_data = array_slice($_POST, 1, -1);
	  foreach($videos_data as $key=>$videos_data_fetch) {
		 $field_value = $videos_data_fetch;
		 $videos_array[$key] = $field_value;
	  }
	
	  $_SESSION["videos_purchase"][] = $videos_array;	
	}
    $login_url = HTTP_HOST.ROOT_DIR_PATH.'index.php?file=customer/login';
	header("Location: ".$login_url);	
} else {
	$customer_cart_exist = 0;
	$customers_cart_info = $db->where('customer_id', $customer_id)->getOne("customers_cart");
	if($db->count>0) {
	   $customer_cart_exist = 1;	
	}
	if(isset($_SESSION['videos_purchase']) && !empty($_SESSION['videos_purchase'])) {
	  foreach($_SESSION["videos_purchase"] as $key=>$videos_session) {
		$extra_fields[$key] = $videos_session;
		$extra_fields_data  = $extra_fields[$key];
		$product_id = $videos_session['product_id'];
	    $products_info = $db->where('product_id',$product_id)->getOne("product");  
		$storyboard_id = $products_info['storyboard_id'];
		$credits = $products_info['credits'];
		$products_info = array("product_id"=>$products_info['product_id'],"storyboard_id"=>$products_info['storyboard_id'],"product_name"=>$products_info['name'],"credits"=>$products_info['credits'],"product_sku"=>$products_info['sku'],"product_image"=>$products_info['product_img']);
		$products_data[$storyboard_id] = array_merge($products_info,$extra_fields_data);	
		
	    if($customer_cart_exist == 1) {
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
	    unset($_SESSION["videos_purchase"]);
	 }
  }
}
 
// Add Product
if(isset($_POST['action']) && $_POST["action"] == 'add') {
   $product_id = $_POST['product_id'];
   $extra_fields_data = array_slice($_POST, 1, -1);
   
   foreach($extra_fields_data as $key=>$extra_fields_data_fetch) {
	 $field_value = $extra_fields_data_fetch;  
	 $extra_fields[$key] = $field_value;
   }

   $extra_fields_data = $extra_fields;
   $products_info = $db->where('product_id',$product_id)->getOne("product");
   $storyboard_id = $products_info['storyboard_id'];
   $credits = $products_info['credits'];
   $products_info = array("product_id"=>$products_info['product_id'],"storyboard_id"=>$products_info['storyboard_id'],"product_name"=>$products_info['name'],"credits"=>$products_info['credits'],"product_sku"=>$products_info['sku'],"product_image"=>$products_info['product_img']);
   $products_data[$storyboard_id] = array_merge($products_info,$extra_fields_data);
   
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
	 header("Location: ".$_SERVER['PHP_SELF'].'?'.$_SERVER['QUERY_STRING']);
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
	   $db->where('customer_id', $customer_id)->delete('customers_cart'); 	
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