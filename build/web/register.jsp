
<!-- Header End====================================================================== -->
<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
	<%@include file="sidebar.jsp" %>
<!-- Sidebar end=============================================== -->
	<div class="span9">
            <ul class="breadcrumb">
                        <li><a href="index.html">Home</a> <span class="divider">/</span></li>
                        <li class="active">Registration</li>
            </ul>
            <h3> Registrasi</h3>	
	<div>
            <form class="form-horizontal" method="post" action="PembeliController?data=pembeli&proses=input-pembeli" >
		<div class="control-group">
			<label class="control-label">Nama Lengkap <sup>*</sup></label>
			<div class="controls">
                            <input type="text"  name="nama" placeholder="First Name">
			</div>
		 </div>
		 <div class="control-group">
			<label class="control-label" >Username <sup>*</sup></label>
			<div class="controls">
                            <input type="text"  name="username" placeholder="Last Name">
			</div>
		</div>
                <div class="control-group">
                    <label class="control-label">Password <sup>*</sup></label>
                    <div class="controls">
                        <input type="password"  name="password" placeholder="Password">
                    </div>
                </div>	
		<div class="control-group">
                    <label class="control-label" >Email <sup>*</sup></label>
                    <div class="controls">
                        <input type="text" name="email" placeholder="Email">
                    </div>
                </div>	  
                <div class="control-group">
                    <label class="control-label" >Alamat <sup>*</sup></label>
                    <div class="controls">
                        <input type="text" name="alamat" placeholder="alamat">
                    </div>
                </div>	
                <p><sup>*</sup>Required field	</p>

                <div class="control-group">
                    <div class="controls">
                        <input class="btn btn-large btn-success" type="submit" value="Register" />
                    </div>
                </div>		
            </form>
        </div>

</div>
</div>
</div>
</div>
<!-- MainBody End ============================= -->
<!-- Footer ================================================================== -->
	