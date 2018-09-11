<?php if (!isset($_SESSION['userlogin'])) { header("location:".$c_url."/keluar"); } ?>
<style>
table.dataTable{width: 150%;}
.scrollsamping{
    overflow-y: hidden;
    width: 100%;
    overflow-x: scroll;	
}
</style>
			<div class="container"> 
			<div class="col-12">
				<!-- Horizontal Form -->
				<div class="card card-info">
				  <div class="card-header">
					<h3 class="card-title"><b>Browse Permohonan</b></h3>
				  </div>
				  <!-- /.card-header -->
				  <!-- form start -->
					<div class="card-body">
						<div class="col-sm-6" style="float:left">
							<div class="form-group">
								<label class="control-label col-sm-4" for="nomor">Aplikasi</label>
								<select name="kd_permohonan" id="kd_permohonan" class="e1 form-control  col-sm-8" >
								<option value="">-Aplikasi-</option>
								<?php
								$query_aplikasi = "select * from tr_aplikasi where kd_aplikasi<99 order by nm_aplikasi_pendek asc";
								$que = mysql_query($query_aplikasi);
								while ($row = mysql_fetch_array($que)) {
									echo "<option value='".$row['kd_aplikasi']."'>".$row['nm_aplikasi_pendek']."</option>";
								} echo "<option value='99'>Aplikasi Lainya</option>";
								?>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="nomor">Status</label>
								<select name="status" id="status"  class="e1 form-control  col-sm-8" >
								<option value=""> -Status- </option>
								<?php 
									for($i=0;$i<=8;$i++){
										if(strtolower($statusbaru)==strtolower($kdstatus[$i])){
											echo "<option value='$kdstatus[$i]' selected='selected'>$kdstatus[$i]</option>";
										}else{
											echo "<option value='$kdstatus[$i]'>$kdstatus[$i]</option>";
										}
									}
								?>
								</select>
							</div> 
						</div>
						<div class="col-sm-6" style="float:left">
							<div class="form-group">
								<label class="control-label col-sm-4" for="nomor">Nama Pemohon</label>
								<select name="pemohon" id="pemohon" class="e1 form-control  col-sm-8" >
								<option value="">-Nama Pemohon-</option>
								<?php
									$query = "select * from tr_pegawai order by nm_pegawai";
									$que = mysql_query("$query");
									while ($row = mysql_fetch_array($que)) {
										echo "<option value='".$row['nip_pegawai']."'>".$row['nm_pegawai']."</option>";
									}
								?>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Tanggal Estimasi Release</label>
								<input type="date" id="tanggal" placeholder="tanggal" class="form-control  col-sm-8" name="tanggal">
							</div>
						</div>
					</div>
					<!-- /.card-body -->
					<div class="card-footer">
						<input class="btn btn-info" type="SUBMIT" name="cari" id="cari" value="Cari Aplikasi">
						
					</div>
					<!-- /.card-footer -->
				</div>
				<!-- /.card -->
				<!-- general form elements disabled -->
				
				<!-- /.card -->
			</div>
            </div>
			<div id="hasildownload"></div>
			<div class="container scrollsamping" id="hasilcari2">
						<?php
						if (isset($_POST['cari'])) {	if(!empty($_POST['kd_permohonan'])){
		$kd_permohonan = $_POST['kd_permohonan'];
		$app1="and (td_permohonan.kd_aplikasi='" . $kd_permohonan . "')";
	} else { 
		$kd_permohonan = ""; 
		$app1="";
	}
	if(!empty($_POST['status'])){
		$status = ucwords(strtolower($_POST['status']));
		if($status=="Request"){$app2="and (td_permohonan.status ='" . $status . "') and  ( NOT EXISTS (SELECT * FROM td_approval where td_permohonan.kd_permohonan=td_approval.kd_permohonan))";}
		else{$app2="and (td_approval.status = '" . $status . "')";}
		
	} else {
		$app2="";
	}
	if(isset($_POST['kd_permohonan2'])){$kd_permohonan2=$_POST['kd_permohonan2'];$app5="and (td_permohonan.kd_permohonan=" . $kd_permohonan2 . ")";}
	else{$app5="";}

	if(!empty($_POST['pemohon'])){
		$pemohon = $_POST['pemohon'];
		$app3="and (td_permohonan.nip_pemohon='" . $pemohon . "') ";
	} else {$app3="";}
	if(!empty($_POST['catatan'])){
		$catatan = $_POST['catatan'];
		$app6="and (td_approval.catatan='" . $catatan . "') ";
	} else {$app6="";}
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

		from td_approval right join td_permohonan on td_approval.kd_permohonan = td_permohonan.kd_permohonan where (td_permohonan.kd_permohonan >0) $app5 $app1 $app2 $app3 $app4";
	$total=mysql_num_rows (mysql_query($que));
	$quepkimle=$que;
	if($total<1){ $que  = "SELECT * FROM td_permohonan WHERE NOT EXISTS (SELECT * FROM td_approval where td_permohonan.kd_permohonan=td_approval.kd_permohonan)";	}
						} else {	
							$que  = "SELECT * FROM td_permohonan WHERE NOT EXISTS (SELECT * FROM td_approval where td_permohonan.kd_permohonan=td_approval.kd_permohonan)";	
							if($grub=="pkimle"){
								$quepkimle  = "SELECT * from td_approval left join td_permohonan on td_approval.kd_permohonan = td_permohonan.kd_permohonan where (td_approval.status !='' )";
							} else {
								$quepkimle  = "SELECT * FROM td_permohonan WHERE NOT EXISTS (SELECT * FROM td_approval where td_permohonan.kd_permohonan=td_approval.kd_permohonan)";
							}
							}

						$resultpkimle= mysql_query($quepkimle);
						$result = mysql_query($que);
						?>
					<div class="card-body">
						<table id="example1" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>Dettail</th>
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
							
							while ($datapkimle = mysql_fetch_array($resultpkimle)) { 
								$kode_perkimle=$datapkimle['kd_permohonan'];
								
								$q_nama = "SELECT * from tr_aplikasi where (kd_aplikasi like '%" . $datapkimle['kd_aplikasi'] . "%')";
								$data_nama = mysql_fetch_array(mysql_query($q_nama));
								
								$q_peg = "SELECT * from  tr_pegawai  where (nip_pegawai like '%" . $datapkimle['nip_pemohon'] . "%')";
								$data_peg = mysql_fetch_array(mysql_query($q_peg));
									
								$q_jns = "SELECT * from  tr_jns_deploy  where (kd_jns_deploy like '%" . $datapkimle['jns_deploy'] . "%')";
								$data_jns = mysql_fetch_array(mysql_query($q_jns));
								
								$q_appr = "SELECT * from td_approval left join tr_pegawai on td_approval.nip_petugas = tr_pegawai.nip_pegawai where (td_approval.kd_permohonan='".$kode_perkimle."')";
								$data_appr = mysql_fetch_array(mysql_query($q_appr));
								
								$statusnya=$data_appr['status']; 
								if(!isset($statusnya)){ $statusnya="Request";}
								
								$q_peg2 = "SELECT nm_pegawai from  tr_pegawai  where (nip_pegawai like '%" . $data_appr['nip_petugas'] . "%')";
								$data_peg2 = mysql_fetch_array(mysql_query($q_peg2));
							?>	
							<tr>
								<td><a class="btn btn-block btn-primary btn-sm" href="<?php echo $c_url."/pkimle/deploy3/detail-".$kode_perkimle ?>"><i class="fa fa-edit"></i> Detail</a></td>							
								<td><?php echo $kode_perkimle;?></td>
								<td><?php echo $statusnya; ?></td>
								<td><?php echo $data_nama['nm_aplikasi_pendek']; ?></td>
								<td><?php echo $datapkimle['tgl_deploy']; ?></td>
								<td><?php echo $data_peg['nm_pegawai']; ?></td>
								<td><?php echo $data_jns['ur_deploy']; ?></td>
								<td><?php echo $datapkimle['ket_fitur']; ?></td>
								<td><?php echo $datapkimle['ket_service']; ?></td>
								<td><?php echo $datapkimle['ket_table']; ?></td>
								<td><?php if(!empty($datapkimle['file_name'])){?><a class="btn btn-block btn-primary btn-sm" href="<?php echo $c_url."/download/4/".$kode_perkimle ?>"><i class="fa fa-download"></i> <?php echo $datapkimle['file_name']; ?></a><?php }  ?></td>
									<td><?php if(!empty($datapkimle['fileusman'])){?><a class="btn btn-block btn-primary btn-sm" href="<?php echo $c_url."/download/1/".$kode_perkimle ?>"><i class="fa fa-download"></i> <?php echo $datapkimle['fileusman']; ?></a><?php }  ?></td>
									<td><?php if(!empty($datapkimle['filedetail'])){?><a class="btn btn-block btn-primary btn-sm" href="<?php echo $c_url."/download/2/".$kode_perkimle ?>"><i class="fa fa-download"></i> <?php echo $datapkimle['filedetail']; ?></a><?php }  ?></td>
									<td><?php if(!empty($datapkimle['fileuat'])){?><a class="btn btn-block btn-primary btn-sm" href="<?php echo $c_url."/download/3/".$kode_perkimle ?>"><i class="fa fa-download"></i> <?php echo $datapkimle['fileuat']; ?></a><?php }  ?></td>
								
							</tr>	
							<?php } ?>
							</tbody>
						</table>
	
					</div>
					
					<!-- /.card-body -->
				  </div>
				  <!-- /.card -->
				</div>

			</div>
<script>
function caridata2(){
	var kd_permohonan=$("#kd_permohonan").val();
	var status=$("#status").val();
	var pemohon=$("#pemohon").val();
	var tanggal=$("#tanggal").val();
	var triger=1;
	$.ajax({ 
		type:"post", 
		url:"<?php echo $c_url;?>/ajaxdeploy3",
		data :  { kd_permohonan : kd_permohonan, status : status, pemohon : pemohon, tanggal : tanggal,triger : triger},
		success:function(data){
			$("#hasilcari2").html(data);
			    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
		}
	});
};

$("#cari").click(function(){caridata2();});
</script>