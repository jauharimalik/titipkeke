<?php require_once ('config.php'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="x-ua-compatible" content="ie=edge">

	<title>Ready</title>
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- DataTables -->
	<link rel="stylesheet" href="<?php echo $c_url;?>/assets/plugins/datatables/dataTables.bootstrap4.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="<?php echo $c_url;?>/assets/dist/css/adminlte.min.css">
	<link rel="stylesheet" href="<?php echo $c_url;?>/assets/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
	<!-- Google Font: Source Sans Pro -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    <link href="<?php echo $c_url;?>/assets/plugins/select2/select2.css" rel="stylesheet"/>  
	<!-- jQuery -->
	<script src="<?php echo $c_url;?>/assets/plugins/jquery/jquery.min.js"></script>	
	<style>
		.dropdown-menu{ background: #343a40;}
		.dropdown-menu a:hover{ background: #343a40;}
		.navbar-nav>.user-menu>.dropdown-menu {
			border-top-right-radius: 0;
			border-top-left-radius: 0;
			padding: 1px 0 0 0;
			border-top-width: 0;
			width: 280px;
		}
		.navbar-nav>.user-menu>.dropdown-menu>li.user-header>img {
			z-index: 5;
			height: 90px;
			width: 90px;
			margin:20px auto;
			display:block;
			border: 3px solid;
			border-color: rgba(255,255,255,0.2);
		}
		.navbar-nav>.user-menu>.dropdown-menu>li.user-header>p>small {
			display: block;
			font-size: 12px;
		}		
		.navbar-nav>.user-menu>.dropdown-menu>.user-footer {
			background-color: #f9f9f9;
			padding: 10px;
			display: block;
			float: left;
			width: 100%;
		}
		.navbar-nav>.user-menu>.dropdown-menu>.user-footer .btn-default {
			color: #666666;
		}		
		.navbar-nav>.user-menu>.dropdown-menu>li.user-header>p {
			z-index: 5;
			color: #fff;
			color: rgba(255,255,255,0.8);
			font-size: 17px;
			text-align: center;
			margin-top: 10px;
		}	
	.box-body {
		border-top-left-radius: 0;
		border-top-right-radius: 0;
		border-bottom-right-radius: 3px;
		border-bottom-left-radius: 3px;
		padding: 10px;
	}

.box {
    position: relative;
    border-radius: 3px;
    background: #ffffff;
    border-top: 3px solid #d2d6de;
    margin-bottom: 20px;
    width: 100%;
    box-shadow: 0 1px 1px rgba(0,0,0,0.1);
}	
box.box-primary {
    border-top-color: #3c8dbc;
}
	.main-footer {margin: 0 20px;}
	.content{min-height:600px}		
	</style>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
	<table style="border:0px;background: #1E90FF!important;width: 100%;padding: 0 0 0 20px;" class="navbar navbar-expand bg-white navbar-light border-bottom">
		<tbody>
		  <tr>
			<td><h1 style="color: #FFD700; font-family: Bauhous 93"><b>  READY</b></h1>
				<h4 style="color: #FFD700"><b>   Release And Deploy Management System</b></h4>
			</td>
		  </tr>
		</tbody>
    </table>
<?php if (isset($_SESSION['userlogin'])) { ?>
    
	<!-- Navbar -->
	<nav class="navbar navbar-expand bg-dark navbar-light border-bottom">
		<!-- Left navbar links -->
		<ul class="navbar-nav">
<?php
	$grub=strtolower($_SESSION['grub']);
	if($grub=="psi"){
?>
			<li class="nav-item dropdown">
				<a class="nav-link" data-toggle="dropdown" href="#" aria-expanded="true">
				  Deploy Aplikasi
				</a>
				<div class="dropdown-menu dropdown-menu-lg dropdown-menu-left">
				  <div class="dropdown-divider"></div>	  
				  <a href="<?php echo $c_url;?>/psi/deploy1" class="dropdown-item">		  
					Permohonan Aplikasi
				  </a>
				  <div class="dropdown-divider"></div>
				</div>
			</li>  
			<li class="nav-item dropdown">
				<a class="nav-link" data-toggle="dropdown" href="#" aria-expanded="true">
				  Browse Permohonan
				</a>
				<div class="dropdown-menu dropdown-menu-lg dropdown-menu-left">
				  <div class="dropdown-divider"></div>	  
				  <a href="<?php echo $c_url;?>/psi/deploy3" class="dropdown-item">		  
					Data Permohonan
				  </a>
				</div>
			</li> 	  
<?php } else {?>
			<li class="nav-item dropdown">
				<a class="nav-link" data-toggle="dropdown" href="#" aria-expanded="true">
				  Deploy Aplikasi
				</a>
				<div class="dropdown-menu dropdown-menu-lg dropdown-menu-left">
				  <div class="dropdown-divider"></div>	  
				  <a href="<?php echo $c_url;?>/pkimle/deploy1" class="dropdown-item">		  
					Permohonan Aplikasi
				  </a>
				  <div class="dropdown-divider"></div>
				  <a href="<?php echo $c_url;?>/pkimle/deploy2"  class="dropdown-item">
					Approve Deploy
				  </a>
				</div>
			</li>  
			<li class="nav-item dropdown">
				<a class="nav-link" data-toggle="dropdown" href="#" aria-expanded="true">
				  Browse Permohonan
				</a>
				<div class="dropdown-menu dropdown-menu-lg dropdown-menu-left">
				  <div class="dropdown-divider"></div>	  
				  <a href="<?php echo $c_url;?>/pkimle/deploy3" class="dropdown-item">		  
					Data Permohonan
				  </a>
				</div>
			</li> 	  
		
<?php } ?>			

		</ul>

	<ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <!-- Notifications Dropdown Menu -->
	</ul>
	<div class="navbar-custom-menu">	
		<ul class="nav navbar-nav">
			<li class="dropdown user user-menu open">
				<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
				  <img src="<?php echo $c_url;?>/user.png" class="user-image" alt="User Image">
				  <span class="hidden-xs"><?php echo ucwords(strtolower($_SESSION['nm_pegawai'])); ?></span>
				</a>
				<ul class="dropdown-menu">
				  <!-- User image -->
				  <li class="user-header">
					<img src="<?php echo $c_url;?>/user.png" class="img-circle" alt="User Image">

					<p>
					  <?php echo ucwords(strtolower($_SESSION['nm_pegawai'])) ; ?>
					  <small>NIK : <?php echo ucwords($_SESSION['nip_pegawai']); ?> - Divisi : <?php echo ucwords($grub); ?></small>
					</p>
				  </li>
				  <!-- Menu Body -->
				  <li class="user-footer">
					<div class="pull-left">
					  <a href="<?php echo $c_url;?>/gantipassword" class="btn btn-primary btn-flat">Ganti Password</a>
					</div>
					<div class="pull-right">
					  <a href="<?php echo $c_url;?>/keluar" class="btn btn-primary btn-flat">Sign out</a>
					</div>
				  </li>
				</ul>
			</li>      
		</ul>		
	</div>	
	</nav>

<?php } ?>	
  <!-- /.navbar -->


  <!-- Content Wrapper. Contains page content -->
  <div class="content">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">

        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
<?php
if(isset($_REQUEST["p"])){
	$p=$_REQUEST["p"];
	
	$title= ucwords($p);
	$file = "pages/".$p . ".php";
	$p_home = "pages/login.php";
	$e404 = "pages/keluar.php";
	if (is_readable($file)) {require $file;}
	else if(empty($p)){require $p_home;}
	else {require $e404; }
	
	
} 
?>		
		</div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content -->



  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-block-down">
      
    </div>
    <!-- Default to the left -->
    <small>Copyright &copy; <?php echo date("Y");?> <a href="<?php echo $c_url;?>">Pkimle</a> - All rights reserved - Versi <?php echo _VERSION; ?>.</small>
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->


<!-- Bootstrap 4 -->
<script src="<?php echo $c_url;?>/assets/plugins/select2/select2.min.js"></script>
<script src="<?php echo $c_url;?>/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables -->
<script src="<?php echo $c_url;?>/assets/plugins/datatables/jquery.dataTables.js"></script>
<script src="<?php echo $c_url;?>/assets/plugins/datatables/dataTables.bootstrap4.js"></script>
<!-- SlimScroll -->
<script src="<?php echo $c_url;?>/assets/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="<?php echo $c_url;?>/assets/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<?php echo $c_url;?>/assets/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<?php echo $c_url;?>/assets/dist/js/demo.js"></script>


<script>
  $(function () {
	$(".e1").select2();  
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>
</body>
</html>
