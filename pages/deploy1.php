<?php if (!isset($_SESSION['userlogin'])) { header("location:".$c_url."/keluar"); } ?>
<style>
.form-group{
    height: 50px;
    display: block;
    margin: 10px 0;
}

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
					<h3 class="card-title"><b>FORM PERMOHONAN DEPLOY APLIKASI</b></h3>
				  </div>
				  <!-- /.card-header -->
				  <!-- form start -->
					<div class="card-body">
                    <form action="<?php echo $c_url;?>/ajaxdeploy1" class="form-horizontal" method="POST" enctype="multipart/form-data">
							<div class="form-group">
								<label class="control-label col-md-4" style="float:left" for="nomor">Nomor ND</label>
								<input type="text" class="form-control col-md-8" id="nomor" placeholder="nomor" name="nomor">
							</div>
							<div class="form-group">
								<label class="control-label col-md-4"  style="float:left;" for="pwd">Tanggal Estimasi Release</label>
								<input type="date" class="form-control col-md-8"  style="float:left;"id="pwd" placeholder="tanggal" name="tanggal">
							</div>
							<div class="form-group">
								<label class="control-label col-md-4" style="float:left" >Aplikasi</label>
								<select name="aplikasi" id="kd_permohonan" class="e1 form-control  col-md-8" style="float:left" >
									<option value="">- Aplikasi-</option>
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
								<label class="control-label col-md-4" style="float:left" >Nama Pemohon</label>
								<select name="pemohon" id="pemohon" class="e1 form-controlcol-md-8" style="float:left"  >
									<option value="">-Nama Pemohon-</option>
									<?php
										$query = "select * from tr_pegawai";
										$que = mysql_query("$query");
										while ($row = mysql_fetch_array($que)) {
											echo "<option value='".$row['nip_pegawai']."'>".$row['nm_pegawai']."</option>";
										}
									?>
								</select>	
							</div>				
                        <div class="form-group">
                            <label class="control-label col-md-4"  style="float:left;">Nama Atasan Pemohon</label>
                                <select name="atasan" id="atasan" class="e1 form-control  col-md-8"  style="float:left;">
                                    <option value="">-Nama Atasan Pemohon-</option>
									<?php
									$query = "select * from tr_pegawai where jabatan like '%kepala seksi%' order by nm_pegawai asc";
									$que = mysql_query("$query");
									while ($row = mysql_fetch_array($que)) {
									 echo "<option value='".$row['nip_pegawai']."'>".$row['nm_pegawai']."</option>";
									}
									?>
                                </select> 
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-4"  style="float:left;">Jenis Deploy</label>
                            <select name="jenis" id="jenis" class="e1 form-control  col-md-8"  style="float:left;">
								<option value="">-Jenis Deploy-</option>
								<?php
									$query = "select * from tr_jns_deploy";
									$que = mysql_query("$query");
									while ($row = mysql_fetch_array($que)) {
										echo "<option value='".$row['kd_jns_deploy']."'>".$row['ur_deploy']."</option>";
									}
								?>
							</select> 
                        </div>

                        <div class="form-group"> 
                            <label class="control-label col-md-4" style="float:left;">Detail Deploy</label>       
                            <div class="col-md-8" style="float:left;">
                                <div class="checkbox">
                                    <label><input id="fitur2" type="checkbox" name="detail">Fitur</label>
                                    <div style="display: none" id="demo2">
                                        <h4>Keterangan Fitur </h4>
                                        <textarea name="fitur" class="editor1 form-control" rows="5" ></textarea>
                                    </div>
                                </div>
                                <div class="checkbox">
                                    <label><input id="fitur3" type="checkbox" name="detail">Service</label>
                                    <div id="demo3" style="display: none" >
                                        <h4>Keterangan Service </h4>
                                        <textarea name="service" class="editor1 form-control" rows="5" ></textarea>
                                    </div>
                                </div>
                                <div class="checkbox">
                                    <label><input id="fitur4" type="checkbox" name="detail">Table</label>
                                    <div id="demo4" style="display: none" >
                                        <h4>Keterangan Table </h4>
                                        <textarea name="tabel" class="editor1 form-control" rows="5" ></textarea>
                                    </div>
                                </div>
                            </div>
							
							<label class="control-label col-md-4" style="float:left;">Persyaratan Lain</label> 
							<div class="col-md-8" style="float:left;">
                                <div class="checkbox col-md-12" style="float:left;">
                                    <div class="col-md-6" style="float:left;"><label>User Manual</label></div>
									<div class="col-md-6" style="float:left;"><input id="input-b1" name="file1" type="file" class="file"></div>
                                </div>
                                <div class="checkbox col-md-12" style="float:left;">
                                    <div class="col-md-6" style="float:left;"><label>Dokumen Detail Teknis</label></div>
 									<div class="col-md-6" style="float:left;"><input id="input-b1" name="file2" type="file" class="file"></div>
                                </div>
                                <div class="checkbox col-md-12" style="float:left;">
                                    <div class="col-md-6" style="float:left;"><label>Dokumen UAT</label></div>
									<div class="col-md-6" style="float:left;"><input id="input-b1" name="file3" type="file" class="file"></div>
                                </div>		
                            </div>
                        </div>
                        <div class="col-md-12"> 
                            <script>

                                $(function() {
                                    $("#fitur2").click(function() {
                                        if ($(this).is(":checked")) {
                                            $("#demo2").show();
                                        }
                                        else {
                                            $("#demo2").hide();
                                        }
                                    });
                                    $("#fitur3").click(function() {
                                        if ($(this).is(":checked")) {
                                            $("#demo3").show();
                                        }
                                        else {
                                            $("#demo3").hide();
                                        }
                                    });
                                    $("#fitur4").click(function() {
                                        if ($(this).is(":checked")) {
                                            $("#demo4").show();
                                        }
                                        else {
                                            $("#demo4").hide();
                                        }
                                    });
                                });
                            </script>					
                        </div>

                        <div class="form-group"> 
                            <label class="control-label col-sm-6" style="float:left;"for="pwd">Upload File War </label>
                            <div class="col-sm-10" style="float:left;">          
                                <input id="input-b1" name="file" type="file" class="file">
							 
                            </div>
                        </div>
<div class="form-group">
								<label class="control-label col-sm-6" style="float:left;"for="pwd">*Jika file lebih dari satu upload file dalam bentuk.zip </label>
							</div>
						<div class="form-group col-md-12" style="float:left;"> 
							<div class="container" align="center">
								<button type="SUBMIT" name="simpan" id="SUBMIT" >simpan</button>
								<input type="reset" value="cancel" >
							</div>
						</div>

                    </form>
                </div>

            </div>
<!-- page script -->
<script src="<?php echo $c_url;?>/assets/plugins/ckeditor/ckeditor.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="<?php echo $c_url;?>/assets/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
            <script>
                var txt = document.getElementById("demo");
                var ckbox = document.querySelectorAll(".ckbox");
                var vallist = [];
                ckbox.forEach(function(lmn, idx) {
                    vallist.push(""); //untuk menjaga posisi item array
                    lmn.addEventListener("click", function() {
                        vallist[idx] = (lmn.checked) ? lmn.value : "";
                        txt.innerHTML = vallist.toString().replace(/,/g, " ");
                    })

                });
            </script>  
					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
				<!-- general form elements disabled -->
				
				<!-- /.card -->
			</div>
            </div>
			