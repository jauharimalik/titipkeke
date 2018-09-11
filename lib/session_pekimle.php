<?php
if (isset($_SESSION['userlogin'])) {
	$grub=strtolower($_SESSION['grub']);
	if($grub=="pkimle"){
	echo '<META HTTP-EQUIV="Refresh" Content="0; URL='.$c_url.'/pkimle/deploy1">';exit;}
} else {
    header("location:".$c_url."/login");
}