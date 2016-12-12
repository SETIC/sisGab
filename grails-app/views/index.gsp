<!DOCTYPE html>
<%@page import="java.lang.System"%>
<html>
	<head>
		<meta name="layout" content="public"/>
		<title>Welcome to Grails</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
			 	width: 21em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>Application Status</h1>
			<ul>
				<li>App version: <g:meta name="app.version"/></li>
				<li>Grails version: <g:meta name="app.grails.version"/></li>
				<li>Groovy version: ${GroovySystem.getVersion()}</li>
				<li>JVM version: ${System.getProperty('java.version')}</li>
				<li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
				<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
				<li>Domains: ${grailsApplication.domainClasses.size()}</li>
				<li>Services: ${grailsApplication.serviceClasses.size()}</li>
				<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
			</ul>
			<h1>Installed Plugins</h1>
			<ul>
				<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
					<li>${plugin.name} - ${plugin.version}</li>
				</g:each>
			</ul>
		</div>
		<footer class="main-footer">
			<g:img dir="img" file="envato.png" style="height:30px;" />
			<%--<img alt="" src="img\envato.jpg" height="40x"> &nbsp;&nbsp;&nbsp;&nbsp;--%>
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.0
			</div>
			<strong>Copyright &copy; 2016 <a
				href="http://www.saogoncalo.rn.gov.br/portal-setic/">SETIC -
					Subsecretaria de Tecnologia da Informação e Ciência</a>.
			</strong>&nbsp;&nbsp; <b>Contato:</b> 98152-9740
		</footer>
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
