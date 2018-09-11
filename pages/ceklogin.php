<?php
if (empty($_POST['username']) && empty($_POST['password'])) {
    header("location:$c_url");
} else {   
error_reporting(E_ALL | E_STRICT); 
	require_once(ROOT.DS."lib/anti_xss.lib.php");
	if (anti_xss($c_url) == false){echo "Access Forbiden! (ANTI XSS)<br>"; exit();}

	$ceklogin2 = ROOT.DS."pages/ceklogin2.php";
	$username = $_POST['username'];
	$pw=$_POST['password'];
	$password = md5(sha1(md5($pw)));
	$password2 = md5($pw);
	
	$cek1 = "SELECT *
			FROM tr_pegawai
			WHERE (username='" . $username . "' and  (password='" . $password2 . "'))";	
	$ceklast=$cek1;		
	
	$hasil = mysql_query($cek1);
	$hasil_cek = mysql_num_rows($hasil);
	if ($hasil_cek == 0) {
		$cek2 = "SELECT *
			FROM tr_pegawai
			WHERE username='" . $username . "' and crypt='" . $password . "'";
		$hasil2 = mysql_query($cek2);
		$ceklast=$cek2;	
		$hasil_cek2 = mysql_num_rows($hasil2);
		if ($hasil_cek2 == 0) {
			$cek3 = "SELECT *
					FROM tr_pegawai
					WHERE (username='" . $username . "' and (`key`='" . $password . "'))";	
			$hasil3 = mysql_query($cek3);
			$ceklast=$cek3;	
			$hasil_cek3 = mysql_num_rows($hasil3);	
			if ($hasil_cek3 == 0) {
				header("location:$c_url");
			} else { require $ceklogin2;}
		} else { require $ceklogin2; }
	} else { require $ceklogin2;}
}