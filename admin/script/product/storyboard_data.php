<?php
if(isset($_POST['storyboard']) && $_POST['storyboard'] == 'Y') {
	$storyboard_id = $_POST['storyboard_id'];
	$curl = curl_init();

	curl_setopt_array($curl, [
	  CURLOPT_URL => "https://usa-api.idomoo.com/api/v2/storyboards/".$storyboard_id,
	  CURLOPT_RETURNTRANSFER => true,
	  CURLOPT_SSL_VERIFYPEER => 0, // Not Checking SSL Certificate
	  CURLOPT_ENCODING => "",
	  CURLOPT_MAXREDIRS => 10,
	  CURLOPT_TIMEOUT => 30,
	  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
	  CURLOPT_CUSTOMREQUEST => "GET",
	  CURLOPT_HTTPHEADER => [
		"Authorization: Basic NDkwNzpTeldncm05bGJ3NzE5ZTRlYzIwYzc1OWJjYjM4OWI1N2Y3OGJhNGYwNDA5R1NaNHpNV05L",
		"Content-Type: application/json"
	  ],
	]);
	
	$response = curl_exec($curl);
	$err = curl_error($curl);
	
	curl_close($curl);
	
	if ($err) {
	  echo "cURL Error #:" . $err;
	} else {
		echo $response;
		exit;
	  $storyboard_response = json_decode($response, true);
	  print_r($storyboard_response);
	  exit;
	}
}
?>