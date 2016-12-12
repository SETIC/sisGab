
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta content="width=device-width, initial-scale=1" name="viewport">
<script src="/sisGab/js/jQuery/jQuery-2.1.3.min.js"
	type="text/javascript"></script>
<script src="/sisGab/js/data.js"></script>
<script type="text/javascript" src="/sisGab/js/jQuery/Chart.min.js"></script>
<title>Grafico</title>
<meta name="layout" content="public" />
</head>
<body class="hold-transition skin-blue sidebar-mini">
	


		<!-- Content Wrapper. Contains page content -->
	
			<!-- Content Header (Page header) -->
			<section class="content-header">
				
				<!-- Tabela  -->

				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
					
					<br>
				</ol>
				<br>
				
    <script>
  function printDiv(id)
   {
  var divToPrint = document.getElementById(id);
  var grafico = document.getElementById('GraficoPizza').toDataURL();
  newWin = window.open("");
  newWin.document.write("<style=''>");

  newWin.document.write("<td> <img src=''; style='width:100px; float:left; margin-top:-9px;'> </td>");
  newWin.document.write("<h4 style=' margin-left:220px; '>PREFEITURA MUNICIPAL DE SÃO GONÇALO DO AMARANTE - RN</h4>");
  newWin.document.write("<h4 style='margin-top:20px; margin-left:330px;'>TOTAL DE ORDENS DE SERVIÇOS</h4>");
  newWin.document.write("<style type='text/css' >");
  newWin.document.write("</style>");
  newWin.document.write("");
  newWin.document.write("<br>");
  newWin.document.write("<p style = 'margin-left:200px;'><img src='"  + grafico + "'></p>");
  newWin.document.write("<p style = 'margin-left:20px;'>Abertos: " +abertos+ " </p>");
  newWin.document.write("<p style = 'margin-left:20px;'>Pendentes: " +pendentes+ " </p>");
  newWin.document.write("<p style = 'margin-left:20px;'>Concluidos: " +concluidos+ " </p>");
  
  newWin.document.write(divToPrint.outerHTML);
  newWin.print();
  newWin.close();
}
</script>
	<!-- Content Header (Page header) -->
	<section class="content-header" style="margin-left: 5%; margin-bottom:2px;">
		<h1>
			SISGAB - Sistema de controle de Nomeações - Gabinete Civil.
		</h1>
	    <br>
				
				
	</section>
</body>
</html>