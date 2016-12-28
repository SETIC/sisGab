<!DOCTYPE html>

<html lang="pt-br">
<head>
<title>Iformações de Cargo</title>
<meta name="layout" content="public" />
<g:javascript src="jquery.js" />
<g:javascript src="jquery.maskedinput.js" />
</head>
<body>
	<script>
function printDiv(id)
{
  var divToPrint=document.getElementById(id);
  newWin= window.open("");

  newWin.document.write("<table border='0'>");
  newWin.document.write("<tr>");
  newWin.document.write("<td><img src='${request.getRequestURL().substring(0, request.getRequestURL().indexOf('sisGab/'))}sisGab/static/images/sga.png'; style='width:100px; float:left; margin-top:5px;'> </td>");
  newWin.document.write("<td>");
  newWin.document.write("<p style='text-align:center; '>PREFEITURA MUNICIPAL DE SÃO GONÇALO DO AMARANTE - RN</p>");
  newWin.document.write("<p style='text-align:center; margin-top:-8px;'>GABINETE CIVIL</p>");
  newWin.document.write("</td>");
  newWin.document.write("</tr>");
  newWin.document.write("</table><br>");
  
  newWin.document.write("RELATÓRIO GERENCIAL <br><br>");
  newWin.document.write(" ");
  newWin.document.write(divToPrint.outerHTML);
  newWin.print();
  newWin.close();
}
</script>
	<section class="content-header">
		<h1>
			Cargos <small>Visualizar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Turma" action="listar">Cargo</g:link></li>
		</ol>
	</section>
	<!-- CORPO DA PÁGINA -->
	<section class="content" style="min-height: 875px;">
		<div>
			<g:if test="${ok}">
				<div class="alert alert-success">
					${ok}
				</div>
			</g:if>
			<g:if test="${erro}">
				<div class="alert alert-danger">
					${erro}
				</div>
			</g:if>
			<g:each in='${secretariaCargo?}'></g:each>
			<div style="margin-left: 120px;">
				<g:form controller="nomeacao" action="info" class="form-horizontal">
					<g:hiddenField name="id" value="${it.id}" />
					<div id="print">
						<div class="form-group">
							<label for="escola" class="col-sm-2 control-label">Secretaria</label>
							<div class="col-sm-8">
								${it.secretaria.secretaria}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="turma" class="col-sm-2 control-label">Cargo</label>
							<div class="col-sm-3">
								${it.cargo.cargo}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="turma" class="col-sm-2 control-label">Tipo de Cargo</label>
							<div class="col-sm-3">
								${it.cargo.tipoCargo.simbolo}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="turma" class="col-sm-2 control-label">Remuneração</label>
							<div class="col-sm-3">
								${it.cargo.tipoCargo.remuneracao}
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="turma" class="col-sm-2 control-label">Quantidade</label>
							<div class="col-sm-3">
								${it.quantidade}
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="turma" class="col-sm-2 control-label">Quantidade Disponível</label>
							<div class="col-sm-3">
								${it.quantidade - qtdcargosDisponivel[0]}
							</div>
						</div>
						<br>
						


					</div>
					<div style="margin: 0 15% auto">
						<button class="btn btn-danger btn-flat"
							onClick="printDiv('print')">
							<i class="fa fa-print"></i> Imprimir
						</button>
						<ul style="display: inline-block; margin-left: -30px">
							<li class="btn btn-info fa fa-sign-out"><a
								href="/sisGab/secretariaCargo/listar/">Voltar</a></li>
						</ul>
					</div>
				</g:form>
			</div>
			<script type="text/javascript">
				$(document).ready(function() {
					$('#example').DataTable();
					var tabela = $('#example').dataTable();
					// Ordena por nome e "desempata" com o id
					tabela.fnSort([ [ 1, 'asc' ] ]);
				});
			</script>
			
			

			
			
		</div>
	</section>
</body>
</html>
