        <?php if (!isset($_SESSION['userlogin'])) { header("location:".$c_url."/keluar"); } 
        if (isset($_POST['simpan'])) {
            $nomor = $_POST['nomor'];
            $tanggal = $_POST['tanggal'];
            $tanggal = date('Y/m/d', strtotime($tanggal));
            $aplikasi = $_POST['aplikasi'];
            $pemohon = $_POST['pemohon'];
            $atasan = $_POST['atasan'];
            $jenis = $_POST['jenis'];


            if (isset($_POST['fitur'])) {
                $ket_fitur = $_POST['fitur'];
            } else {
                $ket_fitur = "";
            }
            if (isset($_POST['service'])) {
                $ket_service = $_POST['service'];
            } else {
                $ket_service = "";
            }
            if (isset($_POST['tabel'])) {
                $ket_table = $_POST['tabel'];
            } else {
                $ket_table = "";
            }

            $tgl_rekam = date("Y/m/d H:i:s");

            if (!empty($_FILES['file']['name'])) {
			$aplikasi = $_POST['aplikasi'];
			$hasil=mysql_query("select * from tr_aplikasi where kd_aplikasi='$aplikasi'");
			$r=mysql_fetch_array($hasil);
			
			$nilai=$r['nm_aplikasi_pendek'];
			//nambah upload
				if(($_FILES["file1"]["name"])!=""){
				$filename1 = $_FILES['file1']['name'];
                $source1 = $_FILES['file1']['tmp_name'];
                $type1 = $_FILES['file1']['type'];
				
                $name1 = explode('.', $filename1);
                $target1 = 'upload/' . $name1[0] . '-' . time() . '-'.(rand(10,9999)).'/';
				$target12 = ROOT."/".$target1;
                $lokasi1 = $target1 . $_FILES["file1"]["name"];
                if (!file_exists($target12)) { mkdir($target12);}			
                copy($_FILES["file1"]["tmp_name"], $target12 . $_FILES["file1"]["name"]);			
				} else {$filename1 = "";$lokasi1="";}
			//selesai upload	
				
				if(($_FILES["file2"]["name"])!=""){
				$filename2 = $_FILES['file2']['name'];
                $source2 = $_FILES['file2']['tmp_name'];
                $type2 = $_FILES['file2']['type'];
			
                $name2 = explode('.', $filename2);
                $target2 = 'upload/' . $name2[0] . '-' . time() .'-'.(rand(10,9999)). '/';
				$target22 = ROOT."/".$target2;
                $lokasi2 = $target2 . $_FILES["file2"]["name"];
				if (!file_exists($target22)) { mkdir($target22);}
                copy($_FILES["file2"]["tmp_name"], $target22 . $_FILES["file2"]["name"]);					
				}else {$filename2 = "";$lokasi2="";}
				if(($_FILES["file3"]["name"])!=""){
				$filename3 = $_FILES['file3']['name'];
                $source3 = $_FILES['file3']['tmp_name'];
                $type3 = $_FILES['file3']['type'];

                $name3 = explode('.', $filename3);
                $target3 = 'upload/' . $name3[0] . '-' . time() . '-'.(rand(10,9999)).'/';
				$target32 = ROOT."/".$target3;
                $lokasi3 = $target3 . $_FILES["file3"]["name"];
                if (!file_exists($target32)) { mkdir($target32);}			
                copy($_FILES["file3"]["tmp_name"], $target32 . $_FILES["file3"]["name"]);		
				}else {$filename3 = "";$lokasi3="";}
				
				$filename = $_FILES['file']['name'];
                $source = $_FILES['file']['tmp_name'];
                $type = $_FILES['file']['type'];

                $name = explode('.', $filename);
                $target = 'upload/' . $name[0] . '-' . time() . '-'.(rand(10,9999)).'/';
				$target2 = ROOT."/".$target;
                $lokasi = $target . $_FILES["file"]["name"];
                if (!file_exists($target2)) { mkdir($target2);}			
                copy($_FILES["file"]["tmp_name"], $target2 . $_FILES["file"]["name"]);
				
            }
			
			
            //*** Insert Record ***//
            $strSQL = "INSERT INTO td_permohonan";
            $strSQL .= "(no_nd,tgl_deploy,kd_aplikasi,nip_pemohon,nip_atasan_pemohon,jns_deploy,tgl_rekam,ket_fitur,ket_service,ket_table,file_name, fileusman,filedetail,fileuat) "
                    . "VALUES ('" . $nomor . "','" . $tanggal . "','" . $aplikasi . "','" . $pemohon . "','" . $atasan . "','" . $jenis . "','" . $tgl_rekam . "','" . $ket_fitur . "','" . $ket_service . "','" . $ket_table . "','" . $filename . "','" . $filename1 . "','" . $filename2. "','" . $filename3 . "')";
            $objQuery = mysql_query($strSQL);

            $queryfile = "select * from td_permohonan where no_nd='" . $nomor . "' and tgl_deploy='" . $tanggal . "' and tgl_rekam='" . $tgl_rekam . "'";
            $que23 = mysql_query("$queryfile");
            while ($row23 = mysql_fetch_array($que23)) {
                $kdpmhn23 = $row23['kd_permohonan'];
            }

            $strSQL24 = "INSERT INTO td_deploy_file";
              
         $strSQL24 .= "(kd_permohonan,file_name,type_file,deskripsi,deskripsi_usman,deskripsi_detail,deskripsi_uat,fileusman,filedetail,fileuat) "
                    . "VALUES ('" . $kdpmhn23 . "','" . $filename . "','" . $type . "',
					'" . $lokasi . "','" . $lokasi1 . "','" . $lokasi2 . "','" . $lokasi3 . "','" . $filename1. "','" . $filename2. "','" . $filename3. "')";
             $objQuery24 = mysql_query($strSQL24);
			?>		
			<div class="container">
            <div class="row">
                <div class="col-md-12">
    <?php if ($objQuery) { ?>
                        <div class="alert alert-success alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true" align="center">&times;</button>
                            <i class="fa fa-info-circle"></i> <strong>Berhasil Mengajukan Permohonan Deploy - Dengan Kode Permohonan: <?php echo $kdpmhn23; ?></strong>
                        </div> 

            <?php } else { ?>
                        <div class="alert alert-danger alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true" align="center">&times;</button>
                            <i class="fa fa-info-circle"></i> <strong>Gagal Permohonan Deploy</strong>
                        </div>
        <?php } ?>
			
                </div>
            </div>
			</div>
<?php } ?>	<meta http-equiv="Refresh" content="15;url=<?php echo $c_url;?>">		