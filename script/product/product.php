<?php
ob_start();
$top="customer/top/top.tpl";
$middle="customer/middle/product/product.tpl";
$bottom="customer/bottom/bottom.tpl";
$indexfile="customer/index.tpl";
	
$title = 'Morpheus - Video Page';

if (!isset($_SESSION['customer_id']) && empty($_SESSION['customer_id'])) {
   $login_url = HTTP_HOST.ROOT_DIR_PATH.'index.php?file=customer/login';
   header("Location: ".$login_url);	
}

$db->where('webpage_id','3');
$description = $db->getValue('webpage','description');

$product_id = $_GET['product_id'];
$product_data = $db->where('product_id',$product_id)->where('status', 'Y')->getOne("product");;

if (isset($_SESSION['customer_id']) && !empty($_SESSION['customer_id'])) {
	$customer_id = $_SESSION['customer_id'];
    $customers_cart_info = $db->where('customer_id', $customer_id)->getOne("customers_cart");
	if($db->count>0) {
	  $storyboard_key = $product_data['storyboard_id'];	
	  $products_data = unserialize($customers_cart_info['video_details']);
	  if (array_key_exists($storyboard_key,$products_data)) {
	     $product_exist = 1;
	  } else {
	     $product_exist = 0;
	  }
	}
}

$db->join("category c", "c.category_id=pc.category_id", "INNER");
$db->where('pc.product_id',$product_id);
$product_category_data = $db->get('product_category pc',null,'pc.product_id,c.category_id,c.category_name');

$db->orderBy("pef.display_order","asc");
$db->orderBy("pef.product_extra_fields_id","asc");
$db->join("product_extra_fields pef", "pef.product_id=p.product_id", "LEFT");
$db->where('p.product_id',$product_id);
$product_extrafields_data = $db->get('product p',null,'pef.*');

if(isset($_POST['img_upload']) && $_POST['img_upload'] == 'Y') {
   $filename = $_FILES['file']['name'];
   $file_explode = explode('.',$filename);
   $file_with_dash = preg_replace('/[ ,]+/', '-', trim($file_explode[0]));
   $filename = $file_with_dash.'.'.$file_explode[1];
   
   /* Location */
   $location = "assets/img/idomoo_upload/".$filename;
   $imageFileType = pathinfo($location,PATHINFO_EXTENSION);
   $imageFileType = strtolower($imageFileType);
   
   /* Valid extensions */
   $valid_extensions = array("jpg","jpeg","png");
   $response = 0;
   
   /* Check file extension */
   if(in_array(strtolower($imageFileType), $valid_extensions)) {
      /* Upload file */
      if(move_uploaded_file($_FILES['file']['tmp_name'],$location)){
        //$link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') ? "https://" : "http://";
        //$full_url = $link.$_SERVER['HTTP_HOST'].ROOT_DIR_PATH.$location;
		$full_url = HTTP_HOST.ROOT_DIR_PATH.$location;
        $response = $full_url;
      }
   }
   echo $response;
   exit;
}

if(isset($_POST['video_generate']) && $_POST['video_generate'] == 'Y') {
	$storyboard_id  = $_POST['storyboard_id'];
	$extra_fields_array = array_slice($_POST, 2, -2);
	$video_type = $_POST['SelectFormat'];
	$height 	= $_POST['SelectResolution'];
	$quality    = "23";
	
	foreach($extra_fields_array as $key=>$extra_fields_value) {
		/*if (strpos($key, 'BG') !== false || strpos($key, 'Logo') !== false) {
			$extra_fields_value = 'https://rep-digital.com/wp-content/uploads/2020/09/awesome-work.jpg';
		}*/
		$key = str_replace("-", " ", $key);
		$video_custom_data[] = ["key" => $key,"val"=> $extra_fields_value];
	}
	
    $headers = array(
		'Content-Type: application/json',
		'Authorization: Basic NDkwNzpTeldncm05bGJ3NzE5ZTRlYzIwYzc1OWJjYjM4OWI1N2Y3OGJhNGYwNDA5R1NaNHpNV05L',
		'Accept: application/json',
		'Connection: keep-alive'
		//'x-idomoo-api-mode: developer'
	);
	
    $storyboard_id =  array("storyboard_id" => $storyboard_id);	
	$output = array("output" => array("video" => array(["height" => $height, "video_type" => $video_type, "quality" => $quality])));
	$data = array('data' => $video_custom_data);
	$merge_array_data = array_merge($storyboard_id,$output,$data);
	$post_data = json_encode($merge_array_data);
	//echo '<pre>';
	//print_r($post_data);
	//exit;

    // Prepare new cURL resource
    $crl = curl_init('https://usa-api.idomoo.com/api/v2/storyboards/generate');
	curl_setopt($crl, CURLOPT_SSL_VERIFYPEER, false); // Not Checking SSL Certificate
    curl_setopt($crl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($crl, CURLINFO_HEADER_OUT, true);
    curl_setopt($crl, CURLOPT_POST, true);
    curl_setopt($crl, CURLOPT_POSTFIELDS, $post_data);
    
    // Set HTTP Header for POST request 
    curl_setopt($crl, CURLOPT_HTTPHEADER, $headers);
    
    // Submit the POST request
    $result = curl_exec($crl);
    
    $post_data = json_decode($result, true);
	//echo '<pre>';print_r($post_data);exit;
    
    echo $post_data['output']['video']['0']['links']['url'];
    exit; 
    
    // Close cURL session handle
    curl_close($crl);
}

$localvars = array("top"=>$top,"bottom"=>$bottom,"middle"=>$middle,"title"=>$title,"product_data"=>$product_data,"product_category_data"=>$product_category_data,"product_extrafields_data"=>$product_extrafields_data,"product_exist"=>$product_exist,'description'=>$description);
$localvars = array_merge($global_arr, $localvars);

foreach($localvars as $key => $value) {
  $smarty->assign($key,$value);
}

$smarty->display($indexfile);
?>