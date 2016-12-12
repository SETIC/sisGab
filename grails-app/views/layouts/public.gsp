<!DOCTYPE html>
<%@page import="java.lang.System"%>
<html>
<head>
<meta charset="UTF-8">

<title>Sistema de solicitação de chamados . Painel"></title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

<!-- Bootstrap 3.3.2 -->
<link href="${resource(dir: 'css', file: 'bootstrap.css')}"
	rel="stylesheet">

<!-- Font Awesome Icons -->
<link
	href="${resource(dir: 'font-awesome-4.1.0/css', file: 'font-awesome.min.css')}"
	rel="stylesheet">

<!-- Ionicons -->
<link href="${resource(dir: 'css', file: 'ionicons.min.css')}"
	rel="stylesheet">

<!-- Morris chart -->
<link href="${resource(dir: 'css', file: 'morris/morris.css')}"
	rel="stylesheet">

<!-- jvectormap -->
<link
	href="${resource(dir: 'css', file: 'jvectormap/jquery-jvectormap-1.2.2.css')}"
	rel="stylesheet">

<!-- Daterange picker -->
<link
	href="${resource(dir: 'css', file: 'daterangepicker/daterangepicker-bs3.css')}"
	rel="stylesheet">

<!-- Bootstrap Select -->
<link href="${resource(dir: 'css', file: 'bootstrap-select.css')}"
	rel="stylesheet">

<!-- DataTable Bootstrap -->
<link href="${resource(dir: 'css', file: 'dataTables.bootstrap.css')}"
	rel="stylesheet">

<!-- Theme style -->
<link href="${resource(dir: 'css', file: 'AdminLTE.min.css')}"
	rel="stylesheet">

<!-- Form Wizard -->
<link href="${resource(dir: 'css', file: 'style-form-wizard.css')}"
	rel="stylesheet">

<!-- Jasny Mask Bootstrap -->
<link href="${resource(dir: 'css', file: 'jasny-bootstrap.min.css')}"
	rel="stylesheet">

<!-- Bootstrap Master -->
<link
	href="${resource(dir: 'css', file: 'bootstrap-modal-master/css/bootstrap-modal.css')}"
	rel="stylesheet">

<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="${resource(dir: 'css', file: 'skins/_all-skins.min.css')}"
	rel="stylesheet">

<!-- Bootstrap Models Manager -->
<link
	href="${resource(dir: 'css', file: 'bootstrap-modal-master/css/bootstrap-modal.css')}"
	rel="stylesheet">

<style type="text/css">
.box-white {
	border-radius: 0;
	border-top: 0;
	padding: 1%;
}

.link-black {
	color: #000 !important;
}

.link-black:hover {
	color: #000 !important;
	text-shadow: .5px .5px 1px #808080;
}

.no-active {
	pointer-events: none;
	cursor: default;
	color: #767676 !important;
	background-color: #E5E5E5;
}

.hidden {
	display: none;
}

.visible {
	display: block;
}
</style>
<!-- jQuery 2.1.3 -->
<g:javascript src="jQuery/jQuery-2.1.3.min.js" />
</head>

<body class="skin-blue row">
	<div class="wrapper">
      <header class="main-header">
        <!-- Logo -->
        <g:link controller="Layout" action="index" class="logo"><g:img dir="images" file="setic.png" style="width: 30%; margin-top: -6%;" class="img-circle" alt="Logo do Sistema"/></g:link>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <g:img dir="images" file="setic.png" class="user-image" alt="User Image"/>
                  <span class="hidden-xs"></span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                  	<g:img dir="images" file="setic.png" class="img-circle" alt="User Image"/>
                    <p>
                      <br>
                      <p style="font-size:12px;">
                       
                       </p>

                    <p style="font-size: 12px;">
                    	
                    </p>
                  </li>
                  
                  
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <!--  <a href="#" class="btn btn-default btn-flat no-active">Meus Dados</a>  -->
                      <button class="btn btn-primary btn-flat" data-toggle="modal"
						data-target="#modalSenha">
						<i class="fa"></i> Alterar senha
					  </button>
                    </div>
                    <div class="pull-right">
                      <g:link controller="Login" action="logout" class="btn btn-default btn-flat">Sair</g:link>
                    </div>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <g:img dir="images" file="sga.png" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
              <p style="margin-top: 10.5px;"></p>

                      <p style="font-size:12px;">
                      
                       
                      
                      </p>
              
              <!-- <a href="#"><i class="fa fa-circle text-success"></i> Online</a> -->
            </div>
          </div>
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">MENU PRINCIPAL</li>
            <li class="active treeview">
              <li class="active treeview"><a href="/sisGab/login/getPrincipal"> 
							    <i class="fa fa-dashboard"></i> <span>Painel</span>
							</a></li>
              <li><a href="/sisGab/nomeacao/listar">
              <i class="fa fa-th"></i> <span> Nomeações</span></a></li>
			  <li class="active treeview">
			    <li><a href="/sisGab/nomeacao/pesquisar">
			  <i class="fa fa-search"></i> <span>Pesquisar</span></a></li>
			  <li><g:link controller="Login" action="logout"><i class="fa fa-circle-o text-red"></i>
				<span>Sair</span></g:link></li>
             </ul>
        </section>
        <!-- /.sidebar -->
      </aside>
	  <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
      	<g:layoutBody />
	  </div>	
      <footer class="main-footer">
          <div class="pull-right hidden-xs">
            <b>Version</b> 1.0
          </div>
          <strong> Copyright © 2016 <a style="font-weight: 400;" href="#"><b>SIS</b>GAB</a>.</strong> Todos os direitos reservados.
      </footer>

			<!-- Modal Senha -->
			<div class="modal fade" id="modalSenha" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Redefinição de senha</h4>
						</div>
						<div class="modal-body">
							<g:form controller="login" action="redefinirSenha" class="form">
								<fieldset>
									
									<div class="form-heading">
										<label>Senha antiga</label>
										<div class="controls">
											<g:textField class="form-control" name="senhaAntiga" value=""
												required="true" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Senha nova</label>
										<div class="controls">
											<g:textField class="form-control" name="senhaNova1" value=""
												required="true" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Confirmar senha nova</label>
										<div class="controls">
											<g:textField class="form-control" name="senhaNova2" value=""
												required="true" />
										</div>
									</div>
									
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary btn-flat">
										<i class="fa fa-save"></i> Cadastrar
									</button>
									<input type="reset" class="btn btn btn-flat" value="Limpar">
								</div>
							</g:form>
						</div>
					</div>
				</div>
			</div>



	<!-- ./wrapper -->
	<!-- Bootstrap 3.3.2 JS -->
	<g:javascript src="bootstrap.js" />
	<!-- Jasny Mask Bootstrap -->
	<g:javascript src="jasny-bootstrap.min.js" />
	<!-- FastClick -->
	<g:javascript src="plugins/fastclick/fastclick.min.js" />
	<!-- AdminLTE App -->
	<g:javascript src="app.min.js" />
	<!-- Script Form Wizard -->
	<g:javascript src="script-form-wizard.js" />
	<!-- jQuery Data Tables -->
	<g:javascript src="jquery.dataTables.min.js" />
	<!-- Data Tables Bootstrap -->
	<g:javascript src="dataTables.bootstrap.js" />
	<!-- Data Table Script -->
	<g:javascript src="dataScript.js" />
	<!-- Bootstrap Select Search -->
	<g:javascript src="dist/js/bootstrap-select.js" />
	<!-- Sparkline -->
	<g:javascript src="plugins/sparkline/jquery.sparkline.min.js" />
	<!-- jvectormap -->
	<g:javascript src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" />
	<g:javascript
		src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js" />
	<!-- daterangepicker -->
	<g:javascript src="plugins/daterangepicker/daterangepicker.js" />
	 <!-- datepicker -->
	<g:javascript src="plugins/datepicker/bootstrap-datepicker.js" />
	<!-- iCheck -->
	<g:javascript src="plugins/iCheck/icheck.min.js" />
	<!-- SlimScroll 1.3.0 -->
	<g:javascript src="plugins/slimScroll/jquery.slimscroll.min.js" />
	<!-- ChartJS 1.0.1 -->
	
	<!-- Bootstrap Master -->
	<g:javascript src="bootstrap-modal-master/js/bootstrap-modal.js" />
	<!-- Bootstrap Master -->
	<g:javascript src="bootstrap-modal-master/js/bootstrap-modalmanager.js" />
	

	<!-- AdminLTE dashboard demo (This is only for demo purposes) 
	<g:javascript src="dashboard2.js" /> -->

	<!-- AdminLTE for demo purposes 
    <g:javascript src="demo.js" /> -->
</body>
</html>
