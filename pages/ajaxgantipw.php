<?php
if (!isset($_SESSION['userlogin'])) {
    header("location:" . $c_url . "/keluar");
}
else {
	if (empty($_POST['pw1']) && empty($_POST['pw2'])) {
		header("location:$c_url");
	} else {
		$username = $_SESSION['userlogin'];
		$pw=$_POST['pw1'];
		$password = md5($pw);
		$kunci = md5(sha1(md5($pw)));
		
		$pw2=$_POST['pw2'];
		$password2 = md5($pw2);
		
		$cekakun = "SELECT * FROM tr_pegawai WHERE (username='" . $username . "' and (`password`='" . $password . "'))";	
		$ubah = "UPDATE tr_pegawai SET password = '$password2' WHERE username='" . $username . "'";
		$hasilcek = mysql_query($cekakun);
		$kecocokan = mysql_num_rows($hasilcek);	
		if ($kecocokan == 0) {
			$cekakun2 = "SELECT * FROM tr_pegawai WHERE (username='" . $username . "' and (`key`='" . $kunci . "'))";	
			$hasilcek2 = mysql_query($cekakun2);
			$cekkunci = mysql_num_rows($hasilcek2);	
			if ($cekkunci == 0) {
				$pesanerror="Password lama salah !! Hubungi petugas untuk merubah passwordnya.";
				$alert="danger";
			} else {
				$queryubah = mysql_query($ubah);
				$pesanerror="Password sudah diganti !! Silahkan login lagi.";
				$alert="success";
			}			
		}
		else {
			$queryubah = mysql_query($ubah);
			$pesanerror="Password sudah diganti !! Silahkan login lagi.";	
			$alert="success";
		}
?>
            <div id="alertclose" class="alert alert-<?php echo $alert; ?> alert-dismissable">
                <button type="button" id="klosealert" class="close">&times;</button>
                <i class="fa fa-info-circle"></i> <strong> <?php echo $pesanerror; ?></strong>
            </div> 
<?php		
	}
}