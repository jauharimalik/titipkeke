<?php 
require_once ('config.php'); 
if(isset($_REQUEST["p"])){
	$p=$_REQUEST["p"];
	$title= ucwords($p);
	$file = "pages/".$p . ".php";
	$p_home = "pages/home.php";
	$e404 = "pages/404.php";
	if (is_readable($file)) {require $file;}
	else if(empty($p)){require $p_home;}
	else {require $e404; }
} 