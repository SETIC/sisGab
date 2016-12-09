<html>
<head>
<meta name="layout" content="public" />
<title>SISOS</title>
</head>
	<section class="content-header">
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
			
			<script>

			
			  
			  
			  
				function portaria()
				{

				
					//var endereco = "192.168.1.252";
					//var endereco = "${request.getRequestURL().substring(6, request.getRequestURL().indexOf(':8080/'))}";

					//var idMatricula = document.getElementById("idMatriculaParaRelatorio").value;


			        var divToPrint  = document.getElementById("reportPrint");
			        divToPrint.style.visibility = "visible";
			        divToPrint.innerHtml = "";
			        
			        $.ajax({
			            type: "GET",
			            url: "http://"+endereco+":8080/projetoMetafora/matricula/getMatriculaByIdParaRelatorio/"+idMatricula,
			            dataType: "json",
			            success: function(result){
			            	var dataFormatada = result.dataAluno.toString().substring(8,10) + " / " + result.dataAluno.toString().substring(5,7) + " / " + result.dataAluno.toString().substring(0,4);
			        	    
						    divToPrint.innerHTML  += "<style=''>";   
					       
						    divToPrint.innerHTML  += "<table border='0'>";
						    divToPrint.innerHTML  += "<tr>";
			        		divToPrint.innerHTML  += " <td> <img src='${ request.getRequestURL().substring(0, request.getRequestURL().indexOf('sisGab/'))}sisGab/static/images/brasao.jpg'; style='width:100px; float:left; margin-top:-9px;'> </td>";
			        		divToPrint.innerHTML  += "<td>";
			        		divToPrint.innerHTML  += "<p style='text-align:center;font-weight: bold; '>RIO GRANDE DO NORTE</p>";
			        		divToPrint.innerHTML  += "<p style='text-align:center;font-weight: bold; '>PREFEITURA MUNICIPAL DE SÃO GONÇALO DO AMARANTE - RN</p>";
			        		divToPrint.innerHTML  += "<p style='text-align:center;font-weight: bold; '>GABINETE DO PREFEITO</p>";
			        		divToPrint.innerHTML  += "<p style='text-align:center;font-weight: bold; '>Centro administrativo à Rua Alexandre Cavalcante, S/N CEP 59.290-000.</p>";
			        		divToPrint.innerHTML  += "<p style='text-align:center;font-weight: bold; '> CNPJ/MF 08.079.402/0001-35</p>";

			        		divToPrint.innerHTML  += "<p style='text-align:left; '>PORTARIA " +result.portaria +" , DE "+result.dataNomeacao+" .</p>";
			        		divToPrint.innerHTML  += "<p style='text-align:right; '>Nomeia " + result.cargo+ " .</p>";
			        		divToPrint.innerHTML  += "<p style='text-align:center; '>O PREFEITO MUNICIPAL DE SÃO GOMÇALO DO AMARANTE/RN,  no uso</p>";
			        		divToPrint.innerHTML  += " de suas atribuições legais,estabelecidas na Lei Orgânica do município, e em observância";
			        		divToPrint.innerHTML  += " da Lei Complementar nº 69/2015,que dispõe sobre a reestruturação organizacional do ";
			        		divToPrint.innerHTML  += "Poder Executivo do Município de São Gonçalo do Amarante , ";

			        		divToPrint.innerHTML  += " RESOLVE: ";
			        		divToPrint.innerHTML  += "Art. 1º - Nomear  " +result.nome+ ", para exercer o cargo de "+result.cargo+" ";
			        		divToPrint.innerHTML  += "<br>";
			        		
			        		divToPrint.innerHTML  += "art. 2º - Esta Portaria entra em vigor na data da sua publicação,retroagindo os ";
			        		divToPrint.innerHTML  += "os seus efeitos a "+result.data;
			        		divToPrint.innerHTML  += "<br>";
			        		divToPrint.innerHTML  += "Art. 3º - Revogam-se as disposições em contrário.";
			        		divToPrint.innerHTML  += "<br>";
			        		divToPrint.innerHTML  += "<br>";
			        		divToPrint.innerHTML  += "PREFEITURA MUNICIPAL DE SÃO GONÇALO DO AMARANTE/RN,";
			        		divToPrint.innerHTML  += "GABINETE DO PREFEITO,EM "+result.data;



			        		divToPrint.innerHTML  += "JAIME CALADO PEREIRA DOS SANTOS";
			        		divToPrint.innerHTML  += "PREFEITO MUNICIPAL";
			        		
			        		
			        		
			        		
			        		
			        		
			        		
			        		
			        		
			        		
			        		
			        		
			        		divToPrint.innerHTML  += "<p style='text-align:center; margin-top:-8px;'>SECRETARIA DE EDUCAÇÃO E CULTURA - SEMEC</p>";
			        		divToPrint.innerHTML  += "</td>";
			        		divToPrint.innerHTML  += "</tr>";
			        		divToPrint.innerHTML  += "</table>";
							divToPrint.innerHTML  += "<h4 style='text-align:center;margin-top:-8px;'>${session["escname"]}</h4>";
					        divToPrint.innerHTML  += "<hr>";
					        divToPrint.innerHTML  += "<h1 style='text-align:center;margin-top:5%;'>DECLARAÇÃO</h1>";
					        divToPrint.innerHTML  += "<p align='Justify' style='center;margin-top:30%;line-height:200%;'>";
					        divToPrint.innerHTML  += " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Declaramos para os fins que se fizerem necessários, e por nos haver sido solicitado, que ";
					        divToPrint.innerHTML  +=   result.nomeAluno+", nascido no dia "+dataFormatada+" , natural de __________" ;
					        divToPrint.innerHTML  +=" ___________________________ ";
					        divToPrint.innerHTML  +=" sendo filho de _________________________________________ e de _____________________________________ ";
					        divToPrint.innerHTML  +=" é aluno(a) regularmente matriculado no ";
					        divToPrint.innerHTML  += result.serie+" e na";
					        divToPrint.innerHTML  += " Turma " ;
					        divToPrint.innerHTML  += result.turma+", do ano letivo de "+result.anoLetivo+", desta escola.";     
					        divToPrint.innerHTML  += "</p>";
					        divToPrint.innerHTML  += "<p style='text-align:center;margin-top:15%;'>________________________________________";
					        divToPrint.innerHTML  += "<h4 style='text-align:center'>ASSINATURA DA COORDENAÇÃO</h4><br/><br/>";
					        divToPrint.innerHTML  += "</p>";
					        divToPrint.innerHTML  += "<style type='text/css' >";
					        //divToPrint.innerHTML  += "body{font-family:Arial;}";
					        //divToPrint.innerHTML  += "img{margin-lefth: 10px;}";
					       // divToPrint.innerHTML  += "label{text-transform: uppercase; font-weight:bold; }";
					        divToPrint.innerHTML  += "</style>";
					        divToPrint.innerHTML  += " ";

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

			          	  
			          	divToPrint.innerHTML  += "<p style='font-size:12px;margin-top:10%; margin-left:55%;'><br/>Gerado dia " + now.getDate() + " de " + meses[now.getMonth()] + " de " + now.getFullYear() + " às " + now.getHours()+":"+now.getMinutes()+" pelo SISEduc</p>";

			          	var newWin = window.open();
			          	newWin.document.write(divToPrint.outerHTML);
			          	divToPrint.innerHTML = "";
			          	divToPrint.style.visibility = "hidden";
			          	
			          	newWin.print();
			          	
			          	factory.printing.header = "";
			          	factory.printing.footer = "";
			          	
			          	newWin.close();
			            
			            }
			        });

				}
			









			
			 function deletar(id) {
			 var resposta = confirm("Deseja exluir esta nomeacao?");
			
			 if (resposta == true){
			 location.href="/sisGab/nomeacao/deletar/"+id }

             }
            </script>
				<h1>Listagem de Nomeações</h1>
				<!-- Tabela  -->
				<ol class="breadcrumb">
				</ol>
				<br>
				<div class="box box-white">
				 <table id="listarNomeacoes" class="table table-striped table-hover example">
					<thead>
						<tr>
							<th style="text-align: left; padding-left: 10px;">Nº</th>
							<th style="text-align: left; padding-left: 10px;">Funcionario</th>
							<th style="text-align: left; padding-left: 10px;">Secretaria</th>
							<th style="text-align: left; padding-left: 10px;">Cargo</th>
							<th style="text-align: left; padding-left: 10px;">Data de Nomeação</th>
							<th style="text-align: left; padding-left: 10px;">Portaria</th>
							<th style="text-align: left; padding-left: 10px;">Ativo</th>
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

								<td><g:formatDate format="dd/MM/yyyy" type="datetime"
										style="MEDIUM" date="${it.dataNomeacao}" />
								</td>
								<td>
									${it.portaria}
																 
								</td>
								
								<td>
									${it.ativo}
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
											<div title="Remover" onclick="deletar(${it.id})"
												class="btn btn-danger btn-xs btn-flat">
												<span class="fa fa-times"></span>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</g:each>
					</tbody>
			    </table>
			    
			    
			    <div style="margin: 0 1% auto;">
					<button class="btn btn-primary btn-flat"
						onclick="printDiv('portaria')">
						<i class="fa fa-print" aria-hidden="true"></i> Imprimir
					</button>
				</div>
			  </div>
		</section>
</html>





























