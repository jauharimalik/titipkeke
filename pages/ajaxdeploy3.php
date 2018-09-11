<?php
if (!isset($_SESSION['userlogin'])) { header("location:".$c_url."/keluar"); } 
	if(!empty($_POST['kd_permohonan'])){
		$kd_permohonan = $_POST['kd_permohonan'];
		$app1="and (td_permohonan.kd_aplikasi='" . $kd_permohonan . "')";
	} else { 
		$kd_permohonan = ""; 
		$app1="and (td_permohonan.kd_aplikasi!='')";
	}
	if(!empty($_POST['status'])){
		$status = ucwords(strtolower($_POST['status']));
		if($status=="Request"){$app2="and (td_permohonan.status ='" . $status . "') and  ( NOT EXISTS (SELECT * FROM td_approval where td_permohonan.kd_permohonan=td_approval.kd_permohonan))";}
		else{$app2="and (td_approval.status = '" . $status . "')";}
		
	} else {
		$app2="";
	}

	if(!empty($_POST['pemohon'])){
		$pemohon = $_POST['pemohon'];
		$app3="and (td_permohonan.nip_pemohon='" . $pemohon . "') ";
	} else {$app3="";}
	if(!empty($_POST['tanggal'])){
		$tanggal = $_POST['tanggal'];
		$tanggal =  date('Y-m-d',strtotime( $tanggal ));
		$app4="and( td_permohonan.tgl_deploy between '$tanggal' and '$tanggal')";
	} else {$app4="";}
	if(isset($_POST['triger'])){$triger=1;} else { $triger=0;}
	$que =	"SELECT 
		
td_permohonan.kd_permohonan,td_permohonan.no_nd,
td_permohonan.tgl_deploy,
td_permohonan.kd_aplikasi,
td_permohonan.nip_pemohon,
td_permohonan.nip_atasan_pemohon,
td_permohonan.jns_deploy,
td_permohonan.ket_fitur,
td_permohonan.ket_service,
td_permohonan.ket_table,
td_permohonan.file_name,
td_permohonan.fileusman,
td_permohonan.filedetail,
td_permohonan.fileuat,
td_approval.catatan,
td_approval.nip_petugas,
td_approval.tgl_approval,
td_approval.status,
td_permohonan.status AS status2,
td_permohonan.tgl_rekam,
td_approval.kd_approval

		from td_approval right join td_permohonan on td_approval.kd_permohonan = td_permohonan.kd_permohonan where (td_permohonan.kd_permohonan >0) $app1 $app2 $app3 $app4";
		
	$total=mysql_num_rows (mysql_query($que));
	if(($total<=0)&&($triger<1)){ $que  = "SELECT * FROM td_permohonan WHERE NOT EXISTS (SELECT * FROM td_approval where td_permohonan.kd_permohonan=td_approval.kd_permohonan)";}
	$total2=mysql_num_rows (mysql_query($que));


?>
<style>
table.dataTable{width: 100%;}
.scrollsamping{
    overflow-y: hidden;
    width: 100%;
    overflow-x: scroll;	
}
</style>

				<div class="col-12">
				  <!-- /.card -->
				  <div class="card">
					<!-- /.card-header -->
					<div class="card-body scrollsamping">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Detail</th>
									<th>No.Permohonan</th>
									<th>Status</th>
									<th>Aplikasi</th>
									<th>Tanggal</th>
									<th>Nama</th>
									<th>Jenis</th>
									<th>Ket.Fitur</th>
									<th>Ket.Service</th>
									<th>Ket.Table</th>
									<th>File.war</th>
									<th>User Manual</th>
									<th>File Detail</th>
									<th>File UAT</th>
									
								</tr>
							</thead>
							<tbody>
							<?php
								if($total2>=1){
								$result = mysql_query($que);
								while ($data = mysql_fetch_array($result)) { 
									$kode_per=$data['kd_permohonan'];
									
									$q_nama = "SELECT * from tr_aplikasi where (kd_aplikasi like '%" . $data['kd_aplikasi'] . "%')";
									$data_nama = mysql_fetch_array(mysql_query($q_nama));
									
									$q_peg = "SELECT * from  tr_pegawai  where (nip_pegawai like '%" . $data['nip_pemohon'] . "%')";
									$data_peg = mysql_fetch_array(mysql_query($q_peg));
										
									$q_jns = "SELECT * from  tr_jns_deploy  where (kd_jns_deploy like '%" . $data['jns_deploy'] . "%')";
									$data_jns = mysql_fetch_array(mysql_query($q_jns));
									
									$q_appr = "SELECT * from td_approval left join tr_pegawai on td_approval.nip_petugas = tr_pegawai.nip_pegawai where (td_approval.kd_permohonan='".$kode_per."')";
									$data_appr = mysql_fetch_array(mysql_query($q_appr));
									
									$statusnya=$data_appr['status']; 
									if(!isset($statusnya)){ $statusnya="Request";}
									
									$q_peg2 = "SELECT nm_pegawai from  tr_pegawai  where (nip_pegawai like '%" . $data_appr['nip_petugas'] . "%')";
									$data_peg2 = mysql_fetch_array(mysql_query($q_peg2));
								?>	
								<tr>
									<td><a class="btn btn-block btn-primary btn-sm" href="<?php echo $c_url."/pkimle/deploy3/detail-".$kode_per ?>"><i class="fa fa-edit"></i> Detail</a></td>								
									<td><?php echo $kode_per;?></td>
									<td><?php echo $statusnya; ?></td>
									<td><?php echo $data_nama['nm_aplikasi_pendek']; ?></td>
									<td><?php echo $data['tgl_deploy']; ?></td>
									<td><?php echo $data_peg['nm_pegawai']; ?></td>
									<td><?php echo $data_jns['ur_deploy']; ?></td>
									<td><?php echo $data['ket_fitur']; ?></td>
									<td><?php echo $data['ket_service']; ?></td>
									<td><?php echo $data['ket_table']; ?></td>
									<td><?php if(!empty($data['file_name'])){?><a class="btn btn-block btn-primary btn-sm" href="<?php echo $c_url."/download/4/".$kode_per ?>"><i class="fa fa-download"></i> <?php echo $data['file_name']; ?></a><?php }  ?></td>
									<td><?php if(!empty($data['fileusman'])){?><a class="btn btn-block btn-primary btn-sm" href="<?php echo $c_url."/download/1/".$kode_per ?>"><i class="fa fa-download"></i> <?php echo $data['fileusman']; ?></a><?php }  ?></td>
									<td><?php if(!empty($data['filedetail'])){?><a class="btn btn-block btn-primary btn-sm" href="<?php echo $c_url."/download/2/".$kode_per ?>"><i class="fa fa-download"></i> <?php echo $data['filedetail']; ?></a><?php }  ?></td>
									<td><?php if(!empty($data['fileuat'])){?><a class="btn btn-block btn-primary btn-sm" href="<?php echo $c_url."/download/3/".$kode_per ?>"><i class="fa fa-download"></i> <?php echo $data['fileuat']; ?></a><?php }  ?></td>
									
								</tr>	
								<?php }} ?>
							</tbody>
						</table>
					</div>
					
					<!-- /.card-body -->
				  </div>
				  <!-- /.card -->
				</div>
			
	