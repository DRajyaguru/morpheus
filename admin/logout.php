<?php
	session_start();
	$_SESSION["admin_user"]	= "";
	session_unset();
	session_destroy();
	header("Location: index.php?file=default");
?>