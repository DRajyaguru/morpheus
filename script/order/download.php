<?php
ob_start();
$top="customer/top/top.tpl";
$middle="customer/middle/order/download.tpl";
$bottom="customer/bottom/bottom.tpl";
$indexfile="customer/index.tpl";
	
$title = 'Morpheus - Order Confirmation Page';

// Initialize a file URL to the variable
//$url = 'https://v.idomoo.com/4907/0000/bq35283k30j2ciahbk1xn2yb2n22ws66937e83o3e.mp4';      
//$file_name = basename($url);
//file_put_contents($file_name, file_get_contents($url));

if(isset($_POST['download_video']) && $_POST['download_video'] == 'Y') {	
  $file = $_POST['video_link'];
  header ("Content-type: octet/stream");
  header ("Content-disposition: attachment; filename=".basename($file).";");
  readfile($file);
  exit;
}

if (!isset($_SESSION['customer_id']) && empty($_SESSION['customer_id'])) {
   $login_url = HTTP_HOST.ROOT_DIR_PATH.'index.php?file=customer/login';
   header("Location: ".$login_url);
}

if(isset($_POST['complete_checkout']) && $_POST['complete_checkout'] == 'Y') {
  $customer_info = serialize(array_slice($_POST,1, -1));

  $customer_id   = $_SESSION['customer_id'];
  $customers_cart_info = $db->where('customer_id', $customer_id)->getOne("customers_cart");
  $total_credits = $customers_cart_info['total_credits'];
  $video_details = $customers_cart_info['video_details'];
  $status = 'Completed';
  $order_date = date('Y-m-d');

  $insert_order_data = array ("customer_id"=>$customer_id,"customer_info"=>$customer_info,"total_credits"=>$total_credits,"video_details"=>$video_details,"status"=>$status,"order_date"=>$order_date);
  $order_id = $db->insert('orders', $insert_order_data);

  $video_info = unserialize($video_details);
  
  $db->rawQuery('UPDATE customer SET total_credits = total_credits - '.$total_credits.' where customer_id = '.$customer_id.'');
  
  $db->where('customer_id', $customer_id)->delete('customers_cart');
} else {
  /*$order_id = 12;
  $order_detail = $db->where('orders_id', $order_id)->getOne('orders');	
  $total_credits = $order_detail['total_credits'];
  $video_info = unserialize($order_detail['video_details']);*/
  $home_url = HTTP_HOST.ROOT_DIR_PATH;
  header("Location: ".$home_url);
}

$localvars = array("top"=>$top,"bottom"=>$bottom,"middle"=>$middle,"title"=>$title,"order_id"=>$order_id,"total_credits"=>$total_credits,"video_info"=>$video_info);
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}

$smarty->display($indexfile);
?>