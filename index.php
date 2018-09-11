<?php
require_once ('config.php');
if (isset($_SESSION['userlogin'])) {
	$grub=strtolower($_SESSION['grub']);
	if($grub=="pkimle"){header("location:".$c_url."/psi/deploy1");}
	if($grub=="psi"){header("location:".$c_url."/pkimle/deploy1");}
} else {
    header("location:".$c_url."/login");
}
 
?>