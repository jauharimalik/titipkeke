<?php
if (!isset($_SESSION['userlogin'])) { header("location:".$c_url."/keluar"); } 
$kd_permohonan=$_GET['kd_permohonan'];
$queryutama1 = "SELECT * from td_permohonan where (kd_permohonan like '%" . $kd_permohonan . "%')";
$resultutama1 = mysql_query($queryutama1);
$row2 = mysql_fetch_array($resultutama1);

$q_peg = "SELECT * from  tr_pegawai  where (nip_pegawai like '%" . $row2['nip_pemohon'] . "%')";
$result_peg = mysql_query($q_peg);
$data_peg = mysql_fetch_array($result_peg);
?>
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
				<?php if(isset($objQuery)){ ?>
					<div class="alert alert-success alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true" align="center">&times;</button>
						<i class="fa fa-info-circle"></i> <strong> Berhasil Aprrove Permohonan Deploy</strong>
					</div> 
				<?php  echo '<META HTTP-EQUIV="Refresh" Content="5; URL='.$c_url.'/pkimle/deploy2">'; }  ?>			
				<!-- Horizontal Form -->
				<div class="card card-info">
				  <div class="card-header">
					<h3 class="card-title"><b>History Deployment </b></h3>
				  </div>
				  <!-- /.card-header -->
				  <!-- form start -->				  
					<div class="card-body">
        <div class="col-md-12">
          <!-- The time line -->
          <ul class="timeline">
            <!-- timeline time label -->
            <li class="time-label">
                  <span class="bg-red">
                    <?php echo tgl_indo(date('Y-m-d', strtotime($row2['tgl_rekam']))); ?>
                  </span>
            </li>
            <!-- /.timeline-label -->
            <!-- timeline item -->
            <li>
              <i class="fa fa-file bg-blue"></i>
              <div class="timeline-item">
				<span class="time"><i class="fa fa-clock-o"></i> <?php echo date('H:i:s', strtotime($row2['tgl_rekam'])); ?></span>
                <h3 class="timeline-header"><a><?php echo  $data_peg['nm_pegawai'];?></a> - Mengajukan Permohonan Deploy Baru</h3>

              </div>
            </li>
<?php						
$query_tanggal1 = "SELECT * from tr_history  where (tr_history.kd_permohonan = '" . $kd_permohonan . "') order by tr_history.tanggal_proses desc";
$result_tanggal1 = mysql_query($query_tanggal1);
?>
<?php						
    $i = 0;
    while ($data_result_tanggal1 = mysql_fetch_array($result_tanggal1)) {  //fetch the result from query into an array
		$kode_per=$data_result_tanggal1['kd_permohonan'];
		$tanggal_proses=$data_result_tanggal1['tanggal_proses'];
		$catatan= $data_result_tanggal1['catatan'];
		
        $petugas = "SELECT nm_pegawai from  tr_pegawai  where (nip_pegawai like '%" . $data_result_tanggal1['nip_petugas'] . "%')";
        $petugas2 = mysql_query($petugas);
        $petugas3 = mysql_fetch_array($petugas2);		
?>
            <!-- timeline time label -->
            <li class="time-label">
                  <span class="bg-red">
                    <?php echo tgl_indo(date('Y-m-d', strtotime($tanggal_proses))); ?>
                  </span>
            </li>
            <!-- /.timeline-label -->
            <!-- timeline item -->
            <li>
              <i class="fa fa-file bg-blue"></i>
              <div class="timeline-item">
				<span class="time"><i class="fa fa-clock-o"></i> <?php echo date('H:i:s', strtotime($tanggal_proses)); ?></span>
                <h3 class="timeline-header"><a><?php echo  $petugas3['nm_pegawai'];?></a> - Merubah Status : <?php echo $data_result_tanggal1['status'];?></h3>
				<?php if(isset($catatan)){ ?><div class="timeline-body">Catatan : <?php echo $catatan; ?></div> <?php } ?>
              </div>
            </li>
	<?php } ?>	
 
          </ul>
        </div>
        <!-- /.col -->


					</div>
					<!-- /.card-body -->
					<div class="card-footer">
						<form class="form-horizontal" action="<?php echo $c_url."/".$grub."/deploy3";?>" method="POST" enctype="multipart/form-data">	
						<input type="hidden" name="kd_permohonan2" value="<?php echo $kd_permohonan;?>">
						<input class="btn btn-danger  float-right" type="SUBMIT" name="cari" id="CANCEL" value="Kembali" />	
						</form>							
					</div>
					<!-- /.card-footer -->				
				</div>
				<!-- /.card -->
				<!-- general form elements disabled -->
				
				<!-- /.card -->
			</div>
            </div>