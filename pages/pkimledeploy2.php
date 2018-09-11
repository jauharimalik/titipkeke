<?php  if (!isset($_SESSION['userlogin'])) { header("location:".$c_url."/keluar"); } require_once hak("psi"); ?>
<style>
table.dataTable{width: 250%;}
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
					<h3 class="card-title"><b>Approval Permohonan</b></h3>
				  </div>
				  <!-- /.card-header -->
				  <!-- form start -->
					<div class="card-body">
						<div class="col-sm-6" style="float:left">
							<div class="form-group">
								<label class="control-label col-sm-4" for="nomor">Kode Permohonan</label>
								<select name="kd_permohonan" id="kd_permohonan" class="e1 form-control  col-sm-8" >
								<option value="">-Kode Permohonan-</option>
								<?php
									//$query = "select p.`kd_permohonan` cc,p.`no_nd`, p.`tgl_deploy`, p.`kd_aplikasi`, p.`nip_pemohon`, p.`nip_atasan_pemohon`, p.`jns_deploy`, p.`ket_fitur`, p.`ket_service`, p.`ket_table`, p.`file_name`, p.`tgl_rekam`, a.kd_approval, a.nip_petugas, a.status, a.catatan, a.tgl_approval, a.boole from td_permohonan p left join td_approval a on p.kd_permohonan = a.kd_permohonan";
									$query="SELECT * FROM td_permohonan ";
									$querypencarian=mysql_query($query);
									
									while ($row = mysql_fetch_array($querypencarian)) {
											echo "<option value='".$row['kd_permohonan']."'>".$row['kd_permohonan']."</option>";
									}
								?>
								</select>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="nomor">Status</label>
								<select name="status" id="status"  class="e1 form-control  col-sm-8" >
								<option value=""> -Status- </option>
								<?php 
									for($i=0;$i<=8;$i++){
										echo "<option value='$kdstatus[$i]'>$kdstatus[$i]</option>";
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
			<div class="container" id="hasilcari2">   
			
<?php
if (isset($_POST['cari'])) {
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
	if(!empty($_POST['kd_permohonan'])){
		$kd_permohonan = $_POST['kd_permohonan'];
		$app1="and (td_permohonan.kd_permohonan =" . $kd_permohonan . " )";
	} else { 
		$kd_permohonan = ""; 
		$app1="and (td_permohonan.kd_permohonan!='')";
	}
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
	if($total<1){ $que  = "SELECT * FROM td_permohonan WHERE NOT EXISTS (SELECT * FROM td_approval where td_permohonan.kd_permohonan=td_approval.kd_permohonan)";	}
}
else {	
	$que  = "SELECT * FROM td_permohonan WHERE NOT EXISTS (SELECT * FROM td_approval where td_permohonan.kd_permohonan=td_approval.kd_permohonan)";		
}
$result = mysql_query($que);
?>

				<div class="col-12">
				  <!-- /.card -->
				  <div class="card">
					<!-- /.card-header -->
					<div class="card-body scrollsamping">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>Proses</th>								
									<th>Kode Permohonan</th>
									<th>Status</th>
									<th>Aplikasi</th>
									<th>Tanggal Request</th>
                                                                        <th>Tanggal Estimasi Release</th>
									<th>Nama Pemohon</th>
									<th>Jenis Deploy</th>
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
									<td><a class="btn btn-block btn-primary btn-sm" href="<?php echo $c_url."/pkimle/deploy2/tom-".$kode_per ?>"><i class="fa fa-edit"></i> Proses</a></td>								
									<td><?php echo $kode_per;?></td>
									<td><?php echo $statusnya; ?></td>
									<td><?php echo $data_nama['nm_aplikasi_pendek']; ?></td>
									<td><?php echo $data['tgl_rekam']; ?></td>
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
		url:"<?php echo $c_url;?>/ajaxdeploy2",
		data :  { kd_permohonan : kd_permohonan, status : status, pemohon : pemohon, tanggal : tanggal,triger : triger},
		success:function(data){
			$("#hasilcari2").html(data);
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