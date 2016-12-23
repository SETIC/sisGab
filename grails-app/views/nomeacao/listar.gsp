<html>
<head>
<meta name="layout" content="public" />
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SISGAB</title>
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
</head>
<body>


			<g:if test="${params.tipo == 'ok'}">
				<div class="alert alert-success">
					${params.msg}
				</div>
			</g:if>
			<g:if test="${params.tipo == 'erro'}">
				<div class="alert alert-danger">
					${params.msg} 
				</div>
			</g:if>
	
		<!-- Content Wrapper. Contains page content -->
		
			<!-- Content Header (Page header) -->
			<section class="content-header">
			
			<!-- CORPO DA PÁGINA -->
		<section class="content">
			

			
			
			<script>

			function changeIdNomeacaoParaPortaria(idNomeacao){
				document.getElementById("idNomeacaoParaPortaria").value = idNomeacao;
			} 

			function geraRelatorio(){
				
				var idNomeacao = document.getElementById("idNomeacaoParaPortaria").value;
			    var cod = document.getElementById("tipoRelatorio").value;
			
			switch (cod){
			case '1':
				printDivPortaria()
				break;
				
			case '2':
				printDivExoneracao()
				break;
						
			default:
				break;
				
			}
		
				}
			


			function printDiv()
			{
			  var divToPrint=document.getElementById(id);
			  newWin= window.open("");
			  newWin.document.write("<style=''>");

			  newWin.document.write("<table border='0'>");
			  newWin.document.write("<tr>");
			  newWin.document.write("<td> <img src=''> </td>");
			  newWin.document.write("<td>");
			  newWin.document.write("<p style='text-align:center; '>PREFEITURA MUNICIPAL DE SÃO GONÇALO DO AMARANTE - RN</p>");
			  newWin.document.write("<p style='text-align:center; margin-top:-8px;'>GABINETE CIVIL</p>");
			  newWin.document.write("</td>");
			  newWin.document.write("</tr>");
			  newWin.document.write("</table>");	
			  
			  newWin.document.write("<h4 style='text-align:center'>${session["escname"]}</h4><br/><br/>");
			  newWin.document.write("<h4 style='margin-top:-38px; text-align:center'>LISTA DE NOMEAÇÕES</h4>");
			  newWin.document.write("<hr>");
			  newWin.document.write("<style type='text/css' >");
			  newWin.document.write("#"+id+'{border:none; font-size: 12pt; }');
			  newWin.document.write("body{font-family:Arial;}");
			  newWin.document.write("img{margin-lefth: 10px;}");
			  newWin.document.write("label{text-transform: uppercase; font-weight:bold; }");
			  newWin.document.write("</style>");
			  newWin.document.write(" ");
			  newWin.document.write(divToPrint.outerHTML);
			  var now = new Date();

			  meses = new Array(12);

			  meses[0] = "Janeiro";
			  meses[1] = "Fevereiro";
			  meses[2] = "Março";
			  meses[3] = "Abril";
			  meses[4] = "Maio";
			  meses[5] = "Junho";
			  meses[6] = "Julho";
			  meses[7] = "Agosto";
			  meses[8] = "Setembro";
			  meses[9] = "Outubro";
			  meses[10] = "Novembro";
			  meses[11] = "Dezembro";
			  
			  newWin.document.write ("<center style='font-size:11px;'><br/>Gerado dia " + now.getDate() + " de " + meses[now.getMonth()] + " de " + now.getFullYear() + " às " + now.getHours()+":"+now.getMinutes()+"</center>");

			  newWin.print();
			  newWin.close();
			}

			function printDivPortaria() {
				
				var endereco = "${request.getRequestURL().substring(6, request.getRequestURL().indexOf(':8080/'))}";
				var idNomeacao = document.getElementById("idNomeacaoParaPortaria").value;
				 
			
				  $.ajax({
			            type: "GET",
			            url: "http://"+endereco+":8080/sisGab/nomeacao/getDadosPortaria/"+idNomeacao,
			            dataType: "json",
			            success: function(result){
                            
			            	var nome = result.nome.toString().toUpperCase();
			                var secretaria = result.secretaria.toString().toLowerCase();
			                var cargo = result.cargo.toString().toLowerCase();
			                var lotacao = result.lotacao.toString().toLowerCase();
			                var dataGeracaoDePortaria = result.dataGeracaoDePortaria.toString().substring(8,10) + "/" + result.dataGeracaoDePortaria.toString().substring(5,7) + "/" + result.dataGeracaoDePortaria.toString().substring(0,4);
			            	var dataFormatada = result.dataNomeacao.toString().substring(8,10) + "/" + result.dataNomeacao.toString().substring(5,7) + "/" + result.dataNomeacao.toString().substring(0,4);
			            	
                            newWin= window.open("");
			            	newWin.document.write("<table style='font-size:17px;'>");
			            	newWin.document.write("<tbody>");
			            	newWin.document.write("<tr>");
						    newWin.document.write("<td><img src='${request.getRequestURL().substring(0, request.getRequestURL().indexOf('sisGab/'))}sisGab/static/images/sga.png'; style='width:100px; float:left; margin-top:5px;'> </td>");
			            	newWin.document.write("<td colspan='2'>RIO GRANDE DO NORTE <br />PREFEITURA MUNICIPAL DE S&Atilde;O GON&Ccedil;ALO DO AMARANTE/RN<br />"); 
			            	newWin.document.write("GABINETE DO PREFEITO <br/> Centro administrativo &agrave; Rua Alexandre Cavalcante, S/N CEP 59.290-000.<br /> CNPJ/MF 08.079.402/0001-35</td>");
			            	newWin.document.write("</tr>");
			            	newWin.document.write("<tr>");
			            	newWin.document.write("<td colspan='2'>");
			            	newWin.document.write("<p>&nbsp;PORTARIA "+result.portaria+"  , DE " +dataFormatada+ "</p>");
			            	newWin.document.write("</br>");
			            	newWin.document.write("</td>");
			            	newWin.document.write("</tr>");
			            	newWin.document.write("<tr>");
			            	newWin.document.write("<td style='padding-left: 500px;' colspan='3'>&nbsp; Nomeia " +cargo);
			            	newWin.document.write("</br>");
			            	newWin.document.write("</br>");
			            	newWin.document.write("</td>");
			            	newWin.document.write("</tr>");
			            	newWin.document.write("<tr>");
			            	newWin.document.write("<td colspan='3'>");
			            	newWin.document.write("<p style='text-align: justify;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;O PREFEITO MUNICIPAL DE "); 
			            	newWin.document.write("S&Atilde;O GON&Ccedil;ALO DO AMARANTE/RN, &nbsp;no uso&nbsp;de suas atribui&ccedil;&otilde;es legais, estabelecidas na Lei "); 
			            	newWin.document.write("Org&acirc;nica do munic&iacute;pio, e em observ&acirc;ncia&nbsp;da Lei Complementar n&ordm; 69/2015, que disp&otilde;e sobre");
			            	newWin.document.write(" a reestrutura&ccedil;&atilde;o organizacional do&nbsp;Poder Executivo do Munic&iacute;pio de S&atilde;o Gon&ccedil;alo do Amarante,</p>"); 
			            	newWin.document.write("</br>");
			      			newWin.document.write("<p style='text-align: justify;'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RESOLVE:</p>");
			      			newWin.document.write("</br>");
			            	newWin.document.write("</br>");
			            	newWin.document.write("<p style='text-align: justify;'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Art. 1&ordm; - Nomear &nbsp;"+nome+", para "); 
			            	newWin.document.write(" exercer o cargo de "+cargo+" do(a) &nbsp;"+secretaria+".</p>");
			            	newWin.document.write("</br>");
			            	newWin.document.write("</br>");
			            	  if(dataGeracaoDePortaria != dataFormatada){
				            	
			            	newWin.document.write("<p style='text-align: justify;'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;Art. 2&ordm; - Esta Portaria entra em vigor na data "); 
			            	newWin.document.write("da sua publicacão ,retroagindo os&nbsp; seus efeitos a " + dataFormatada+ " .</p>");
			            	newWin.document.write("</br>");
			            	newWin.document.write("</br>");
			            	}else{
				            	
			            		newWin.document.write("<p style='text-align: justify;'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;Art. 2&ordm; - Esta Portaria entra em vigor na data "); 
				            	newWin.document.write("da sua publicacão</p>");
				            	newWin.document.write("</br>");
				            	newWin.document.write("</br>");

				            	}
			            	newWin.document.write("<p style='text-align: justify;'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;Art. 3&ordm; - Revogam-se as ");
			            	newWin.document.write("disposi&ccedil;&otilde;es em contr&aacute;rio.</p>");
			            	newWin.document.write("<p style='text-align: justify;'>PREFEITURA MUNICIPAL DE S&Atilde;O GON&Ccedil;ALO DO AMARANTE/RN ,"); 
			            	newWin.document.write("<style='text-align: justify;'> GABINETE DO PREFEITO , EM  " + dataFormatada + "</p>");
			            	newWin.document.write("<p>&nbsp;</p>");
			            	newWin.document.write("<p style='text-align: center;'>_______________________________</p>");
			            	newWin.document.write("<p style='text-align: center;'>JAIME CALADO PEREIRA DOS SANTOS</p> ");
			            	newWin.document.write("<p style='text-align: center;'>PREFEITO MUNICIPAL</p>");
			            	newWin.document.write("</td></tr><tr>");
			            	newWin.document.write("<td colspan='3'>&nbsp;</td>");
			            	newWin.document.write("</tr>");
			            	var now = new Date();

			            	  meses = new Array(12);

			            	  meses[0] = "Janeiro";
			            	  meses[1] = "Fevereiro";
			            	  meses[2] = "Março";
			            	  meses[3] = "Abril";
			            	  meses[4] = "Maio";
			            	  meses[5] = "Junho";
			            	  meses[6] = "Julho";
			            	  meses[7] = "Agosto";
			            	  meses[8] = "Setembro";
			            	  meses[9] = "Outubro";
			            	  meses[10] = "Novembro";
			            	  meses[11] = "Dezembro";
			            	  
			            	 newWin.document.write ("<center style='font-size:12px;'><br/>Gerado dia " + now.getDate() + " de " + meses[now.getMonth()] + " de " + now.getFullYear() + " às " + now.getHours()+":"+now.getMinutes()+"</center>");
			            				            	
			            	newWin.document.write("</tbody>");
			            	newWin.document.write("</table>");


			            	
						    newWin.print();
						    newWin.close();
						    
						    
						            }
			              });
		            
				  
			}


			function printDivExoneracao() {
				

		var endereco = "${request.getRequestURL().substring(6, request.getRequestURL().indexOf(':8080/'))}";
		var idNomeacao = document.getElementById("idNomeacaoParaPortaria").value;
		
		  $.ajax({
	            type: "GET",
	            url: "http://"+endereco+":8080/sisGab/nomeacao/getDadosPortaria/"+idNomeacao,
	            dataType: "json",
	            success: function(result){

	            var nome = result.nome.toString().toUpperCase();
                var secretaria = result.secretaria.toString().toLowerCase();
                var cargo = result.cargo.toString().toLowerCase();
                var lotacao = result.lotacao.toString().toLowerCase();	         
	            var dataFormatada = result.dataNomeacao.toString().substring(8,10) + " / " + result.dataNomeacao.toString().substring(5,7) + " / " + result.dataNomeacao.toString().substring(0,4);
					
			    newWin= window.open("");
			    newWin.document.write("<table style='font-size:17px;'>");
            	newWin.document.write("<tbody>");
            	newWin.document.write("<tr>");
			    newWin.document.write("<td><img src='${request.getRequestURL().substring(0, request.getRequestURL().indexOf('sisGab/'))}sisGab/static/images/sga.png'; style='width:100px; float:left; margin-top:5px;'> </td>");
            	newWin.document.write("<td colspan='2'>RIO GRANDE DO NORTE <br /> PREFEITURA MUNICIPAL DE S&Atilde;O GON&Ccedil;ALO DO AMARANTE/RN<br />"); 
            	newWin.document.write("GABINETE DO PREFEITO <br/> Centro administrativo &agrave; Rua Alexandre Cavalcante, S/N CEP 59.290-000.<br /> CNPJ/MF 08.079.402/0001-35</td>");
            	newWin.document.write("</tr>");
				newWin.document.write("</table>");
				newWin.document.write("<p style='text-align:left; '>PORTARIA "+ result.portaria + " , DE "+dataFormatada+ " .</p>");
				newWin.document.write("<p style='text-align:right; '>Exonera "+cargo +" .</p>");
				newWin.document.write("<p style='text-align:justify; '> O PREFEITO MUNICIPAL DE SÃO GONÇALO DO AMARANTE/RN,  no uso");
				newWin.document.write(" de suas atribuições legais,estabelecidas na Lei Orgânica do município, e em observância");
				newWin.document.write(" da Lei Complementar nº 69/2015, que dispõe sobre a reestruturação organizacional do ");
				newWin.document.write(" Poder Executivo do Município de São Gonçalo do Amarante,</p> ");
				newWin.document.write("</br>");
				newWin.document.write(" RESOLVE: ");
				newWin.document.write("</br>");
				newWin.document.write("<br>");
				newWin.document.write("Art. 1º - Exonerar  "+nome+" do cargo de "+cargo+ " ");
				newWin.document.write("da " +secretaria + "," + " em exercicio na(o) "  +lotacao+".");
				newWin.document.write("</br>");
				newWin.document.write("</br>");
				newWin.document.write("</br>");
				newWin.document.write("</br>");
			
				newWin.document.write("Art. 2º - Esta Portaria entra em vigor na data da sua publicação, retroagindo os ");
				newWin.document.write("os seus efeitos a "+ dataFormatada + ".");
				newWin.document.write("</br>");
				newWin.document.write("</br>");
				newWin.document.write("</br>");
				newWin.document.write("</br>");
			
				newWin.document.write("Art. 3º - Revogam-se as disposições em contrário.");
				newWin.document.write("</br>");
				newWin.document.write("</br>");
				newWin.document.write("</br>");
				newWin.document.write("</br>");
				
				newWin.document.write("<p style=text-align:left;>PREFEITURA MUNICIPAL DE SÃO GONÇALO DO AMARANTE/RN , GABINETE DO PREFEITO , EM "+ dataFormatada + "</p>");
				newWin.document.write("</br>");
				newWin.document.write("</br>");
			   	newWin.document.write(" <p style=text-align:center;> _______________________________ </p>");
				newWin.document.write("<p style=text-align:center;>JAIME CALADO PEREIRA DOS SANTOS</p>");
				newWin.document.write("<p style=text-align:center;>PREFEITO MUNICIPAL</p>");
        	    newWin.document.write(" ");
				newWin.print();
				newWin.close();

			               }
			            });
			       }


			


			
	            function mudarSecretaria(){
				
				var endereco = "${request.getRequestURL().substring(6, request.getRequestURL().indexOf(':8080/'))}";
				var comboCargo = document.getElementById("comboCargo");
		        comboCargo.options[comboCargo.options.length] = new Option("Buscando Cargos", 0);

		        var idSecretaria = document.getElementById("comboSecretaria").value;
		        var idCargo = document.getElementById("comboCargo").value;
		       
		        $.ajax({
		            type: "GET",
		            url: "http://"+endereco+":8080/sisGab/nomeacao/getCargoDisponivelBySecretaria?secretaria="+idSecretaria,
		            dataType: "json",
		            success: function(result){
		            	comboCargo.options.length = 0;
	                    				
		            	
			        if (result.id.length == 0){
			        	comboCargo.options[comboCargo.options.length] = new Option("Não há cargos cadastrada", 0);
			        }else{
						for (i=0;i<result.id.length;i++){
							comboCargo.options[comboCargo.options.length] = new Option(result.cargo[i], result.id[i]);
		           		}
			          }
		            }
		        });
			}
         
         </script>
			
			
			<script>
			
			 function deletar(id) {
			 var resposta = confirm("Deseja exluir esta OS?");
			
			 if (resposta == true){
			 location.href="/sisOs/OrdemDeServico/deletar/"+id }

             }
            </script>
           		 <div id="reportPrint" style="visibility: hidden;"></div>
            	<h3>Listagem de Nomeações</h3>
				<!-- Tabela  -->
				<ol class="breadcrumb">
				</ol>
				<br>

				<table id="listarNomeacao" class="table table-striped table-hover example">
					<thead>
						<tr>
							<th style="text-align: left; padding-left: 10px;">Nº</th>
							<th style="text-align: left; padding-left: 10px;">Funcionario</th>
							<th style="text-align: left; padding-left: 10px;">Secretaria</th>
							<th style="text-align: left; padding-left: 10px;">Cargo</th>
							<th style="text-align: left; padding-left: 10px;">Tipo</th>
							<th style="text-align: left; padding-left: 10px;">Data de Nomeação</th>
							<th style="text-align: left; padding-left: 10px;">Portaria</th>
							<th style="text-align: left; padding-left: 10px;">Funções</th>
						</tr>
					</thead>
					<tbody>
						<g:set var="i" value="${1}" />
						<g:each in='${nomeacao?}'>
							<tr class='linha_registro'>
								<td>
									${i++}
								</td>
								<td>
									${it.funcionario.nome}
								</td>
								<td>
									${it.secretariaCargo.secretaria.secretaria}
								</td>
								<td>
									${it.secretariaCargo.cargo.cargo}
								</td>
								
								<td>
									${it.secretariaCargo.cargo.tipoCargo.simbolo}
								</td>

								<td><g:formatDate format="dd/MM/yyyy" type="datetime"
										style="MEDIUM" date="${it.dataNomeacao}" />
								</td>
								<td>
									${it.portaria}
																 
								</td>
								<td>
									<div class="opcoes">
										<div style="display: inline">
											<div title="Editar" class="btn btn-primary btn-xs btn-flat">
												<a style="color: #fff"
													href="/sisGab/nomeacao/editar/${it.id}"><span>
														<i class="fa fa-pencil"></i>
												</span></a>
											</div>
											<div data-toggle="modal" data-target="#relatorioModal"
												onclick="changeIdNomeacaoParaPortaria(${it.id});"
												title="Documentos"
												class="btn btn-warning btn-xs btn-flat"><span
												class="fa fa-file"></span></div>
										  </div>
                                      </div>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="modal fade" id="relatorioModal" tabindex="-1"
				role="dialog" aria-labelledby="relatorioModalLabel"
				aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="relatorioModalLabel">Documentos</h4>
						</div>
						<div class="modal-body">
							<form action="" method="POST">
								<div class="form-heading">
									<input type="hidden" id="idNomeacaoParaPortaria" /> <label>Tipos
										de Documentos</label>
									<div class="controls">
										<select class="form-control selectpicker" name="tipoRelatorio"
											id="tipoRelatorio">
											<option value="1">Portaria</option>
											<option value="2">Exoneração</option>
										</select> <br /> <br /> <br />
										<button class="btn btn-danger btn-flat"
											onclick="geraRelatorio(); return false;">
											<i class="fa fa-print"></i> Gerar Documento
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			</section>


	<!-- Button trigger modal -->
			
			<button class="btn btn-primary btn-flat" data-toggle="modal"
				data-target="#myModal">
				<i class="fa fa-plus"></i> Nova Nomeação
			</button>

			
			<button class="btn btn-danger btn-flat" onClick="printDiv('listarNomeacao')">
				<i class="fa fa-print"></i> Imprimir
			</button>

		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Cadastro de Nomeação</h4>
						</div>
						<div class="modal-body">
							<g:form controller="nomeacao" action="salvar" class="form">
								<fieldset>
								<div class="form-heading">
										<label>Secretaria</label>
										<div class="controls ">

											<select class="form-control selectpicker" data-live-search="true" name="secretaria" id="comboSecretaria" onchange="mudarSecretaria();">
												<g:each in="${secretariaDisponivel}">

													<option value="${it.id}">
														${it.secretaria}
													</option>
												</g:each>
											</select>

										</div>
									</div>
									
									<br>
									<div class="form-heading">
										<label>Cargo</label>
										<div class="controls ">

											<select class="form-control" data-live-search="true" name="cargo" id="comboCargo" required="true">
												</select>
												
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Nome do Funcionario</label>
										<div class="controls">
											<g:textField class="form-control" name="nome" value=""
												required="true" required="true" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>CPF</label>
										<div class="controls">
											<g:textField class="form-control" name="cpf" value=""
												required="true" required="true" />
										</div>
									</div>
									<br>
									<div class="form-heading">
										<label>Portaria</label>
										<div class="controls">
											<g:textField class="form-control" name="portaria" value=""
												required="true" required="true" />
										</div>
									</div>
									
									<br>
									
									<div class="form-heading">
										<label> Data da Geração da Portaria</label>
										<div class="controls">
											<g:formatDate format="yyyy-MM-dd" date="${date}" />
											<g:datePicker noSelection="['':'']" precision="day"
												class="form-control" required="true" name="dataGeracaoDePortaria"
												value="" />
										</div>
									</div>
									<br>
									
									<div class="form-heading">
										<label>Lotação</label>
										<div class="controls ">
											<select class="form-control selectpicker"
												data-live-search="true" name="lotacao" id="comboLotacao">
												<g:each in="${secretaria}" required="true">
													<option value="${it.secretaria}">
														${it.secretaria}
													</option>
												</g:each>
											</select>
                                           </div>
										</div>
									<br>
									
									<div class="form-heading">
										<label>Efetivo</label>
										<div class="controls">
											<input type="radio" name="efetivo" value="true" > Sim<br>
  											<input type="radio" name="efetivo" value="false" checked> Não<br>
										</div>
									</div>
									<br>
									
								</fieldset>
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
	 </section>
  </body>
</html>

























