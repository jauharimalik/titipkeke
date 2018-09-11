<?php 
if (empty($_POST['username']) && empty($_POST['password'])) {
    header("location:$c_url");
} else {   
	error_reporting(E_ALL | E_STRICT); 
	require_once(ROOT.DS."lib/anti_xss.lib.php");
	$hasilakhir = mysql_query($ceklast);
    while ($row=mysql_fetch_array($hasilakhir)){
    $_SESSION['userlogin'] = $row['username'];
	$_SESSION['grub'] = $row['grub'];
	$_SESSION['nip_pegawai'] = $row['nip_pegawai'];
	$_SESSION['nm_pegawai'] = $row['nm_pegawai'];
	$grub=strtolower($_SESSION['grub']);
	if($grub=="psi"){ header("location:".$c_url."/psi/deploy1");}
	else{header("location:".$c_url."/pkimle/deploy2");}
	}
}	