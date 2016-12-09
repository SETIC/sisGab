<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Protocolo . Módulo Protocolo</title>
<meta name="layout" content="public" />
</head>
<body>
	<script>
		//function printDiv(id) {
			//var divToPrint = document.getElementById(id);
			//newWin = window.open("");
			
			//newWin.document.write("<table border='0'>");
			//newWin.document.write("<tr>");
			//newWin.document.write("<td> <img src='${ request.getRequestURL().substring(0, request.getRequestURL().indexOf('sisGab/'))}sisGab/static/images/brasao.jpg'; style='width:100px; float:left; margin-top:-9px;'> </td>");
			//newWin.document.write("<td>");
			//newWin.document.write("<p style='text-align:center; '>PREFEITURA MUNICIPAL DE SÃO GONÇALO DO AMARANTE - RN</p>");
			//newWin.document.write("<p style='text-align:center; margin-top:-8px;'>SECRETARIA DE EDUCAÇÃO E CULTURA - SEMEC</p>");
			//newWin.document.write("</td>");
			//newWin.document.write("</tr>");
			//newWin.document.write("</table><br>");
			  
			//newWin.document.write("RELATÓRIO GERENCIAL <br><br>");
			//newWin.document.write(" ");
			//newWin.document.write(divToPrint.outerHTML);
			//newWin.print();
			//newWin.close();
		//}
		
		function mudarSelecao(){
			
			var x = document.getElementById('tipoBusca');
			value = x.options[x.selectedIndex].value;

           switch(value){
           case 'nome':

			  newInput.innerHTML = "<label>Nome Do Funcionário: </label/></br>"+
			  "<input type='text' required = 'true' name ='nome' id ='nomeId'/>" +
			  "<button style='margin-left: 10px;' type='submit' class='btn btn-primary btn-flat'>" +
			  "<i class='fa-fa-search'></i>Buscar</button>"
              break;

           case 'cpf':
 			  newInput.innerHTML = "<label>Cpf: </label/><input type='text' name ='cpf' id='cpfId'/> " +
 	 		  "<button style='margin-left: 10px;' type='submit' class='btn btn-primary btn-flat'>" +
			  "<i class='fa-fa-search'></i>Buscar</button>"
              break;
           
           case 'secretaria':
        	   newInput.innerHTML = "<label>Secretaria:</label/>" +
        	   "<div id='iDivSelectPicker' class='row'>"+
			   "<div class='col-sm-4'>"+
        	   "<select class='form-control selectpicker' " +
   			   "data-live-search='true' name='secretaria' id='secretariaId'"+
   			   "<option value='0'>Secretaria</option>" +
   			   "<g:each in="${secretaria}">"+
   			   "<option value='${it.id}'>" +
   			   "${it.secretaria}</option></g:each></select></div>" +
   			   "<button type='submit' class='btn btn-primary btn-flat'>" +
			   "<i class='fa-fa-search'></i>Buscar</button>" 
              break;

           case 'tipocargo':
        	   newInput.innerHTML = "<label>Tipo de cargo:</label/>" +
        	   "<div id='iDivSelectPicker' class='row'>"+
			   "<div class='col-sm-4'>"+
        	   "<select class='form-control selectpicker' " +
   			   "data-live-search='true' name='tipocargo' id='tipocargoId'"+
   			   "<option value='0'>Tipo de cargo</option>" +
   			   "<g:each in="${tipoCargo}">"+
   			   "<option value='${it.id}'>" +
   			   "${it.simbolo}</option></g:each></select></div>" +
   			   "<button type='submit' class='btn btn-primary btn-flat'>" +
			   "<i class='fa-fa-search'></i>Buscar</button>" 
               break;   
           }
			
		}
        
		</script>
	    <section class="content-header">
		<h1>
			Nomeações <small>Consulta de Funcionários</small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><g:link controller="Layout" action="index">
					<i class="fa fa-dashboard"></i> Inicio</g:link></li>
		</ol>
		<br>
			<g:form controller="nomeacao" action="pesquisar" class="form">
			<div class="form-heading" style="width:150px;">
				<label>Tipo de Busca</label>
				<div class="controls">
					<select class="form-control selectpicker" id ="tipoBusca" name="tipoBusca" onchange = "mudarSelecao();">
						<option value="null">SELECIONE...</option>
						<option value="nome">NOME</option>
						<option value="cpf">CPF</option>
						<option value="secretaria">SECRETÁRIA</option>
						<option value="tipocargo">TIPO DE CARGO</option>
						
					</select>
				</div>
			</div>
			<br>
			<div id='newInput'>
			<!-- lugar onde aparecerao os campos -->
		   	</div>
			</g:form>
		</section>
	<!-- CORPO DA PÁGINA -->
	<section class="content">
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
                       
			<div class="box box-white">
				<table id="pequisarprotocolo"
					class="table table-striped table-hover example">
					<thead>
						<tr>
							<th style="width:60px;padding-left:60px">Funções</th>
							<th>Nome</th>
							<th>Secretaria</th>
							<th>Cargo</th>
							<th>Data de Nomeacao</th>
							<th>Portaria</th>
							<th>Ativo</th>
						</tr>
					</thead>
					<tbody>
						<g:each in='${nomeacao?}'>
							<tr class='linha_registro'>
								<td>
									<div style="margin-left: 10px" class="opcoes">
										<ul style="display: inline">
											<li title="Ver detalhes do protocolo"
												class="btn btn-success btn-xs btn-flat"><a
												style="color: #fff"
												href="/sisGab/Nomeacao/verInfo/${}"><span
													class="fa fa-times"></span></a></li> 
																					
												<li title="Editar Nomeacao" class="btn btn-primary btn-xs btn-flat"><a
													style="color: #fff"
													href="/sisGab/Nomeacao/editar/${}"><span
														class="fa fa-pencil"></span></a></li>
										
										</ul>
									</div>
								</td>
								<td>
									${it.funcionario?.nome}
								</td>
								<td>
									${it.secretariaCargo?.secretaria?.secretaria}
								</td>
								<td>
									${it.secretariaCargo?.cargo?.cargo}
								</td>
								<td> 
									<g:formatDate type="datatime"  date="${it.dataNomeacao}" />
								</td>

								<td>
									${it.portaria}
								</td>
								
								<td>
									${it.ativo}
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
</html>