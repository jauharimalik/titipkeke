<?php
if (isset($_SESSION['userlogin'])) {
	$grub=strtolower($_SESSION['grub']);
	if($grub=="psi"){
				echo '<META HTTP-EQUIV="Refresh" Content="0; URL='.$c_url.'/psi/deploy1">'; exit;
				}
} else {
    header("location:".$c_url."/login");
}