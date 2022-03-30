<?php
error_reporting(0);

include_once("mysqli/MysqliDb.php");
include_once('smarty/Smarty.class.php');
$smarty = new Smarty;

$db = new Mysqlidb('localhost', 'root', '', 'morpheus');
if(!$db) die("Database error");

//$conn = mysqli_connect('localhost', 'root', '', 'morpheus');

function check_security()
{
  if(!isset($_SESSION["admin_user"]) && $_SESSION["admin_user"] == "")
  {
    header("Location:index.php?file=default");
    exit;
  }
}

$protocol = isset($_SERVER["HTTPS"]) ? 'https://' : 'http://';
$path_http = pathinfo($protocol . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF']);
$arrDirPath = explode("/", $path_http["dirname"]); 
$last_part = end($arrDirPath);

if ($last_part == "admin") {
    define("SERVER_ROOT_DIR_PATH", substr(getcwd(), 0, (strlen(getcwd()) - strlen($last_part))));
    $serverPath = $arrDirPath;
    array_pop($serverPath);
    $serverUrl = implode("/", $serverPath);
    define("SERVER_URL_PATH", $serverUrl . "/");         
} else {
    define("SERVER_ROOT_DIR_PATH", getcwd() . "/");          
    $serverUrl = implode("/", $arrDirPath);
    define("SERVER_URL_PATH", $serverUrl . "/");         
}

define("ADMIN_TEMPLATE_PATH", SERVER_ROOT_DIR_PATH . 'skin/');
?>