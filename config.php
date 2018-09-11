<?php
define('ROOT', dirname(__FILE__));
define('DS',   DIRECTORY_SEPARATOR); 
define('SYS',  'system'.DS); 
define('APPS',  'app'.DS);
define('MOD',   'module'.DS);
define('DIR',  APPS . 'directories'.DS);
define('SELF', pathinfo(__FILE__, PATHINFO_BASENAME));
define('PHP_EXT',  '.php');
define('_VERSION',  '2.2');

$koneksi="localhost";
$userdb="root";
$pwdb="";
$tbdb="pkimle";

if (version_compare(phpversion(), '5.3.0', '<') == true) {exit('PHP5.3+ Required');}
date_default_timezone_set("Asia/Jakarta");
header('HTTP/1.1 200 OK');
//panggil class inti (core)
mysql_connect($koneksi,$userdb, $pwdb) or die('Could not connect: ' . mysql_error());
mysql_select_db($tbdb) or die('Queryi failed: ' . mysql_error());
session_start();

//def static variabel
//$c_url="http://10.102.103.100:8080/ready";
$c_url="http://localhost/pkimle";
$kdstatus= array('Request','Assesment','Approval','Deploying','Deployed','Deployment Failed','Testing','Release', 'Rollback');

if(isset($_SERVER['HTTP_REFERER'])){$ref=$_SERVER['HTTP_REFERER'];}
else{$ref="";}

function hak($a){
	$a=strtolower($a);
	if($a=="psi"){$a=ROOT.DS."lib/session_psi.php";}
	else{$a= ROOT.DS."lib/session_pekimle.php";}
	return $a;
}

require_once ROOT.DS."lib/indonesia.lib.php"
?>