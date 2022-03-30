<?php
session_start();
ob_start();
include_once("lib/config.php");

$global_arr = array();

$file = '';

if (isset($_GET["file"])){	
   $file = $_GET["file"];	
}
else if (isset($_POST["file"])){	
   $file = $_POST["file"];		
}

$include_script = "script/" . $file . ".php";

if (file_exists($include_script)){	
    include_once($include_script);	
}
else{	
	include_once("script/default.php");
}
?>