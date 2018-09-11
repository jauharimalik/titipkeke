            <style type="text/css">
                .wrapperlogin{ width: 350px; padding: 20px; margin:auto;}

            </style>
			<div class="wrapperlogin"> 
			<div class="col-12">
				<!-- Horizontal Form -->
				<div class="card card-info">
				  <div class="card-header">
					<h3 class="card-title"><b>Login Aplikasi</b></h3>
				  </div>
				  <!-- /.card-header -->
				  <!-- form start -->			  
					<div class="card-body">
    <form action="<?php echo $c_url;?>/ceklogin" method="post">

        <div class="form-group">

            <label>Username</label>

            <input type="text" name="username"class="form-control">


        </div>    

        <div class="form-group">

            <label>Password</label>

            <input type="password" name="password" class="form-control">


        </div>

        <div class="form-group">

            <input type="submit" class="btn btn-primary" value="Login">

        </div>

        

    </form>

					</div>			
				</div>
				<!-- /.card -->
				<!-- general form elements disabled -->
				
				<!-- /.card -->
			</div>
            </div>