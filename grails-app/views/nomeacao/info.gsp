<!DOCTYPE html>

<html lang="pt-br">
<head>
<title>Iformações de Nomeação</title>
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
  newWin.document.write("<td> <img src=''; style='width:100px; float:left; margin-top:-9px;'> </td>");
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
			Nomeações <small>Visualizar dados</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
			<li><g:link controller="Turma" action="listar">Nomeações</g:link></li>
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
			<g:each in='${nomeacao?}'></g:each>
			<div style="margin-left: 120px;">
				<g:form controller="nomeacao" action="info" class="form-horizontal">
					<g:hiddenField name="id" value="${it.id}" />
					<div id="print">
						<div class="form-group">
							<label for="escola" class="col-sm-2 control-label">Secretaria</label>
							<div class="col-sm-8">
								${it.secretariaCargo.secretaria.secretaria}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="turma" class="col-sm-2 control-label">Cargo</label>
							<div class="col-sm-3">
								${it.secretariaCargo.cargo.cargo}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="turma" class="col-sm-2 control-label">Tipo de Cargo</label>
							<div class="col-sm-3">
								${it.secretariaCargo.cargo.tipoCargo.simbolo}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="turma" class="col-sm-2 control-label">Remuneração</label>
							<div class="col-sm-3">
								${it.secretariaCargo.cargo.tipoCargo.remuneracao}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="vagas" class="col-sm-2 control-label">Funcionário</label>
							<div class="col-sm-3">
								${it.funcionario.nome}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="serie" class="col-sm-2 control-label">CPF</label>
							<div class="col-sm-4">
								${it.funcionario.cpf}
							</div>
						</div>
						<br>
						<div class="form-group">
							<label for="serie" class="col-sm-2 control-label">Portaria</label>
							<div class="col-sm-4">
								${it.portaria}
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="serie" class="col-sm-2 control-label">Data de Nomeação</label>
							<div class="col-sm-4">
								${it.dataNomeacao}
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="serie" class="col-sm-2 control-label">Efetivo</label>
							<div class="col-sm-4">
							 	<g:if test="${it.funcionario.efetivo == true}">
							 		Sim
							 	</g:if>
							 	<g:else>
							 		Não
							 	</g:else>
							</div>
						</div>
						<br>
						
						<div class="form-group">
							<label for="serie" class="col-sm-2 control-label">Lotação</label>
							<div class="col-sm-4">
								${it.funcionario.lotacao}
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
								href="/sisGab/nomeacao/listar/">Voltar</a></li>
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
