<?php
if (!isset($_SESSION['userlogin'])) { header("location:".$c_url."/keluar"); } 
if(isset($_REQUEST['act'])){
	$act=$_REQUEST['act'];
	if($act=="1"){
		$data = mysql_query ("select * from td_deploy_file where kd_permohonan=" . $_REQUEST['kd_download']);
		if ($row = mysql_fetch_assoc($data)) {
			$deskripsi = $row['deskripsi_usman'];
			$filename = $row['fileusman']; 
			//$filename1 = $row['fileusman']; 
			//$filename2 = $row['filedetail']; 
			//$filename3 = $row['fileuat']; 
			$file=ROOT.DS.$deskripsi;
		}

		if( !file_exists($file)){ echo "Tidak Ada";}
		else { 
		// http headers for zip downloads
		header("Content-Description: File Transfer");
		header("Content-type: application/octet-stream");
		header("Content-Disposition: attachment; filename=\"".$filename."\"");
		//header("Content-Disposition: attachment; filename1=\"".$filename1."\"");
		//header("Content-Disposition: attachment; filename2=\"".$filename2."\"");
		//header("Content-Disposition: attachment; filename3=\"".$filename3."\"");


		header("Content-Length: ".filesize($file));
		ob_end_flush();
		@readfile($file);
			echo '<META HTTP-EQUIV="Refresh" Content="0; URL='.$ref.'">';
		}
	}
	else if($act=="2"){
		$data = mysql_query ("select * from td_deploy_file where kd_permohonan=" . $_REQUEST['kd_download']);
		if ($row = mysql_fetch_assoc($data)) {
			$deskripsi = $row['deskripsi_detail'];
			$filename = $row['filedetail']; 
			//$filename1 = $row['fileusman']; 
			//$filename2 = $row['filedetail']; 
			//$filename3 = $row['fileuat']; 
			$file=ROOT.DS.$deskripsi;
		}

		if( !file_exists($file)){ echo "Tidak Ada";}
		else { 
		// http headers for zip downloads
		header("Content-Description: File Transfer");
		header("Content-type: application/octet-stream");
		header("Content-Disposition: attachment; filename=\"".$filename."\"");
		//header("Content-Disposition: attachment; filename1=\"".$filename1."\"");
		//header("Content-Disposition: attachment; filename2=\"".$filename2."\"");
		//header("Content-Disposition: attachment; filename3=\"".$filename3."\"");


		header("Content-Length: ".filesize($file));
		ob_end_flush();
		@readfile($file);
			echo '<META HTTP-EQUIV="Refresh" Content="0; URL='.$ref.'">';
		}
	}
	else if($act=="3"){
		$data = mysql_query ("select * from td_deploy_file where kd_permohonan=" . $_REQUEST['kd_download']);
		if ($row = mysql_fetch_assoc($data)) {
			$deskripsi = $row['deskripsi_uat'];
			$filename = $row['fileuat']; 
			//$filename1 = $row['fileusman']; 
			//$filename2 = $row['filedetail']; 
			//$filename3 = $row['fileuat']; 
			
			$file=ROOT.DS.$deskripsi;
		}

		if( !file_exists($file)){ echo "Tidak Ada";}
		else { 
		// http headers for zip downloads
		header("Content-Description: File Transfer");
		header("Content-type: application/octet-stream");
		header("Content-Disposition: attachment; filename=\"".$filename."\"");


		header("Content-Length: ".filesize($file));
		ob_end_flush();
		@readfile($file);
			echo '<META HTTP-EQUIV="Refresh" Content="0; URL='.$ref.'">';
		}
	}	
	else if($act=="4"){
		$data = mysql_query ("select * from td_deploy_file where kd_permohonan=" . $_REQUEST['kd_download']);
		if ($row = mysql_fetch_assoc($data)) {
			$deskripsi = $row['deskripsi'];
			$filename = $row['file_name']; 
			$file=ROOT.DS.$deskripsi;
		}

		if( !file_exists($file)){ echo "Tidak Ada";}
		else { 
		// http headers for zip downloads
		header("Content-Description: File Transfer");
		header("Content-type: application/octet-stream");
		header("Content-Disposition: attachment; filename=\"".$filename."\"");


		header("Content-Length: ".filesize($file));
		ob_end_flush();
		@readfile($file);
			echo '<META HTTP-EQUIV="Refresh" Content="0; URL='.$ref.'">';
		}
	}	
}