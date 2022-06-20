<?php
	session_start();
	unset($_SESSION["check_timeout"]);
	unset($_SESSION["customer_id"]);
	unset($_SESSION["customer_name"]);
	unset($_SESSION["customer_email"]);
	session_destroy();
	$home_url = HTTP_HOST.ROOT_DIR_PATH;
	header("Location: ".$home_url);
?>