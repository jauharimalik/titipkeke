<?php
if (!isset($_SESSION['userlogin'])) {
    header("location:" . $c_url . "/keluar");
}
require_once hak("psi");
$kd_permohonan = $_GET['kd_permohonan'];
$que = "SELECT * from td_permohonan where (kd_permohonan like '%" . $kd_permohonan . "%')";
$result = mysql_query($que);
$row2 = mysql_fetch_array($result);

$querycekstatus = "SELECT * from td_approval where (kd_permohonan like '%" . $kd_permohonan . "%')";
$cekstatus = mysql_fetch_array(mysql_query($querycekstatus));
if ($cekstatus['status'] == "") {
    $statusbaru = "Request";
} else {
    $statusbaru = $cekstatus['status'];
}

if (isset($_POST['simpan'])) {
    $nip_petugas = $_SESSION['nip_pegawai'];
    $now = date('Y-m-d');
    $status = $_POST['status'];
    $catatan = $_POST['catatan'];
    $kd_permohonan = $_POST['kode'];
    //$nama_pegawai= $data_peg2['nm_pegawai'];
    $q_peg2 = "SELECT * from  `tr_pegawai`  where `nip_pegawai`='$nip_petugas'";
    $result_peg2 = mysql_query($q_peg2);
    $data_peg2 = mysql_fetch_array($result_peg2);
    $nm_petugas = $data_peg2['nm_pegawai'];

    $true = 0;
    $q_kd_permohonan = "SELECT kd_permohonan from  `td_approval`";
    $result_kd_perm = mysql_query($q_kd_permohonan);
    $result = [];
    while ($row_perm = mysql_fetch_array($result_kd_perm)) {
        array_push($result, $row_perm);
        if ($row_perm['kd_permohonan'] == $kd_permohonan) {
            $true = 1;
        }
    }
    //*** Insert Record ***//
    if ($true == 1) {
        $strSQL = "UPDATE td_approval SET status = '$status', nip_petugas = '" . $_SESSION['nip_pegawai'] . "', catatan = '$catatan' WHERE kd_permohonan = '$kd_permohonan'";
        $objQuery = mysql_query($strSQL);
    } else {
        $strSQL = "INSERT INTO td_approval(`nip_petugas`, `status`, `catatan`,`kd_permohonan`) VALUES ('" . $_SESSION['nip_pegawai'] . "','$status','$catatan','$kd_permohonan')";
        //$strSQL="update td_permohonan set `status`='$status', `catatan`='$catatan', `tanggal_approval`='$now' where `kd_permohonan`='$kd_permohonan'";
        $objQuery = mysql_query($strSQL);
    }

    $strSQL2 = "SELECT * from  `td_approval`  where `kd_permohonan`='$kd_permohonan'";
    $carikode = mysql_fetch_array(mysql_query($strSQL2));
    $kd_approval = $carikode['kd_approval'];
    $strSQL3 = "INSERT INTO tr_history(`kd_approval`,`nip_petugas`, `status`, `catatan`,`kd_permohonan`) VALUES ('$kd_approval','" . $_SESSION['nip_pegawai'] . "','$status','$catatan','$kd_permohonan')";
    $objQuery2 = mysql_query($strSQL3);
}
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
        <?php if (isset($objQuery)) { ?>
            <div class="alert alert-success alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true" align="center">&times;</button>
                <i class="fa fa-info-circle"></i> <strong> Berhasil Aprrove Permohonan Deploy</strong>
            </div> 
            <?php echo '<META HTTP-EQUIV="Refresh" Content="5; URL=' . $c_url . '/pkimle/deploy2">';
        }
        ?>			
        <!-- Horizontal Form -->
        <div class="card card-info">
            <div class="card-header">
                <h3 class="card-title"><b>Persetujuan Approval</b></h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form class="form-horizontal" method="POST" enctype="multipart/form-data">				  
                <div class="card-body">

                    <div style="float:left;" class="form-group col-md-6">
                        <label class="control-label col-sm-12" for="nomor">Nama Petugas</label>
                        <div class="selectContainer">
                            <div class="col-sm-12">
                                <div class="form-group">
<?php echo $_SESSION['nm_pegawai']; ?>
                                    <input type="hidden" name="kode" value="<?php echo $kd_permohonan; ?>" >	
                                </div>
                            </div>
                        </div>
                    </div> 
                    <div style="float:left;" class="form-group col-md-6">
                        <label class="control-label col-sm-12" for="nomor">Status</label>
                        <div class=" selectContainer">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <select name="status" class="e1 form-control col-md-12" id="status" >
                                        <?php
                                        for ($i = 0; $i <= 8; $i++) {
                                            if (strtolower($statusbaru) == strtolower($kdstatus[$i])) {
                                                echo "<option value='$kdstatus[$i]' selected='selected'>$kdstatus[$i]</option>";
                                            } else {
                                                echo "<option value='$kdstatus[$i]'>$kdstatus[$i]</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div> 
                    <div style="float:left;" class="form-group col-md-6">
                        <label class="control-label col-sm-12" for="nomor">Dokumen Yang sudah diupload :</label>
                        <div class="selectContainer">
                            <div class="col-sm-12">
                                <div class="form-group ">
                                    
                                    <table border="0">
    <tr>
        <td>Fle war</td>
        <td> <?php echo":".$row2['file_name'];?></td>
      
    </tr>
    <tr>
        <td>User Manual</td>
        <td><?php echo":".$row2['fileusman']; ?></td>
      
    </tr>
    <tr>
        <td>File UAT </td>
        <td><?php echo":".$row2['fileuat']; ?> <br></td>
       
    </tr>
    <tr>
        <td>Detail</td>
        <td><?php echo":".$row2['filedetail']; ?></td>
       
    </tr>
</table>

                                    <input type="hidden" name="kode" value="<?php echo $kd_permohonan; ?>" >	
                                </div>
                            </div>
                        </div>
                    </div> 
                    <div style="float:right;" class="form-group col-md-6">

                    </div>
                </div> 
                <div class="form-group">
                    <label class="control-label col-md-12" for="pwd">Catatan</label>
                    <div class="col-sm-12">          
                        <textarea class="form-control" name="catatan" id="catatan" style="width: 100%"><?php echo $cekstatus['catatan'] ?></textarea>
                    </div> 
                </div>


        </div>
        <!-- /.card-body -->
        <div class="card-footer">
            <input class="btn btn-success" type="SUBMIT" name="simpan" id="SUBMIT" value="Simpan" />
            </form>
            <form class="form-horizontal" action="<?php echo $c_url . "/" . $grub . "/deploy2"; ?>" method="POST" enctype="multipart/form-data">	
                <input type="hidden" name="kd_permohonan" value="<?php echo $kd_permohonan; ?>">
                <input class="btn btn-danger  float-right" type="SUBMIT" name="cari" id="CANCEL" value="Cancel" />	
            </form>						
        </div>
        <!-- /.card-footer -->
    </div>
    <!-- /.card -->
    <!-- general form elements disabled -->

    <!-- /.card -->
</div>
</div>