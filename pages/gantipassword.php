<?php
if(isset($_SESSION['userlogin'])){
$cek = "SELECT *
        FROM tr_pegawai
        WHERE username='" . $_SESSION['userlogin'] . "'";
$hasil = mysql_query($cek);
$hasil_cek = mysql_num_rows($hasil);
while ($row=mysql_fetch_array($hasil)){
    $username = $row['username'];
	$jabatan = $row['jabatan'];
	$grub = $row['grub'];
	$nip_pegawai = $row['nip_pegawai'];
	$nm_pegawai = $row['nm_pegawai'];
	$nickname=ucwords(strtolower($nm_pegawai));		
	$grub=strtoupper($_SESSION['grub']);
	
?>
<style>
    table.dataTable{width: 250%;}
    .scrollsamping{
        overflow-y: hidden;
        width: 100%;
        overflow-x: scroll;	
    }
	.profile-user-img  {display:block;}
	.jabatan{    width: 90%;margin: 20px auto;display: block;text-align: center;}
.form-control-feedback {
    position: absolute;
    margin-top: -35px;
    right: 20px;
    z-index: 2;
    display: block;
    width: 34px;
    height: 34px;
    line-height: 34px;
    text-align: center;
}
</style>
<div class="container"> 
<div class="row">
	<div class="col-md-3">
          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="<?php echo $c_url;?>/assets/dist/img/avatar5.png" alt="User profile picture">

              <h3 class="profile-username text-center"><?php echo $nickname; ?></h3>

              <p class="text-muted text-center"><b><?php echo $nip_pegawai; ?></b></p>
			  <small class="jabatan"><?php echo $jabatan; ?></small>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Grub</b> <a class="pull-right"><?php echo $grub; ?></a>
                </li>
                <li class="list-group-item">
                  <b>Username</b> <a class="pull-right"><?php echo $username; ?></a>
                </li>
              </ul>

              <a href="<?php echo $c_url;?>/keluar" class="btn btn-primary btn-block"><b>Sign Out</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          
          <!-- /.box -->
        </div>
    <div class="col-md-9">
        <div id="allert"></div> 		
        <!-- Horizontal Form -->
        <div class="card card-info">
            <div class="card-header">
                <h3 class="card-title"><b>Ganti Password Akun</b></h3>
            </div>  
                <div class="card-body">
					<div class="form-group has-feedback">
						<label class="control-label col-md-4" style="float:left" for="nomor">Password Lama</label>
						<input type="password" class="form-control col-md-7" id="pw1" placeholder="Password Lama" name="pw1">
						<span onclick="lihat('pw1')" class="control-label col-md-1 form-control-feedback"><i class="fa fa-eye"></i></span>
					</div>	
					<div class="form-group has-feedback">
						<label class="control-label col-md-4" style="float:left" for="nomor">Password Baru</label>
						<input type="password" class="form-control col-md-7" id="pw2" placeholder="Password Baru" name="pw2">
						<span onclick="lihat('pw2')" class="control-label col-md-1 form-control-feedback"><i class="fa fa-eye"></i></span>
					</div>	
					<div class="form-group has-feedback">
						<label class="control-label col-md-4" style="float:left" for="nomor">Konfirmasi Password Baru</label>
						<input type="password" class="form-control col-md-7" id="pw3" placeholder="Konfirmasi Password Baru" name="pw3">
						<span onclick="lihat('pw3')" class="control-label col-md-1 form-control-feedback"><i class="fa fa-eye"></i></span>
					</div>	
                </div>		
        </div>
        <!-- /.card-body -->
        <div class="card-footer">
            <input class="btn btn-success" type="SUBMIT" name="simpan" id="SUBMIT" value="Simpan" />				
        </div>
        <!-- /.card-footer -->
    </div>
    <!-- /.card -->
    <!-- general form elements disabled -->
</div>
    <!-- /.card -->
</div>
<script>
function lihat(a){
    var x = document.getElementById(a);
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }	
}

function gantipw(){
	var pw1=$("#pw1").val();
	var pw2=$("#pw2").val();
	var pw3=$("#pw3").val();	
	if(pw2!=pw3){alert("Konfirmasi Password Salah");}
	else{
		$.ajax({ 
			type:"post", 
			url:"<?php echo $c_url;?>/ajaxgantipw",
			data :  { pw1 : pw1, pw2:pw2, pw3:pw3 },
			success:function(data){
				$("#allert").html(data);
				$('html, body').animate({scrollTop: $("#allert").offset().top-100}, 1000);
				$("#klosealert").click(function(){$("#alertclose").hide();});	
			}
		});
	}
};


$("#SUBMIT").click(function(){gantipw();});	

</script>
<?php }} else {echo "<meta http-equiv='refresh' content='0;url=".$c_url."' />";} ?>
