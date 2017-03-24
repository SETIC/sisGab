<html>
<head>
<meta name="layout" content="public" />
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SISGAB</title>
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">

		<!-- Content Wrapper. Contains page content -->
			<!-- Content Header (Page header) -->


				<!-- CORPO DA PÁGINA -->
				<section class="content">
				
				
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

										
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">Edição de Nomeação</h4>
					</div>
					<div class="modal-body">
						<g:form controller="nomeacao" action="atualizar" class="form">
							<g:hiddenField type="number" name="id" value="${nomeacaoEdit?.id}" />
							<fieldset>
								<%--<script type="text/javascript" src="/sisGab/js/mudarSecretaria.js"></script>
									--%>
								<div class="form-heading">
									<label>Secretaria</label>
									<div class="controls ">
										<select class="form-control selectpicker"
											data-live-search="true" name="secretaria" 
											id="comboSecretaria" onchange="mudarSecretaria();">
											<g:each in="${secretariaDisponivel}">
												
												<option value="${it.id}" <g:if test="${nomeacaoEdit.secretariaCargo.secretaria.id == it.id}"> selected </g:if> >
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
									<g:set var="t" value="0" />
																			
									<select class="form-control" data-live-search="true"
											name="cargo" id="comboCargo">
							
										<g:each in="${cargosSecretaria}">
												
											<option value="${it.id}" <g:if test="${nomeacaoEdit.secretariaCargo.id == it.id}">${t='1'} selected </g:if> >
												${it.cargo.cargo}
											</option>
										</g:each>
										
										<g:if test="${t == '0'}">
											
											<option value="${nomeacaoEdit.secretariaCargo.cargo.id}" selected>${nomeacaoEdit.secretariaCargo.cargo.cargo}</option>	
										</g:if>	
										<g:else>
											${t = '0'}
										</g:else>
										
									</select>
									
										
									</div>
								</div>
								<br>
								<div class="form-heading">
									<label>Nome do Funcionario</label>
									<div class="controls">
										<g:textField class="form-control" name="nome" value="${nomeacaoEdit.funcionario.nome}"
											required="true" />
									</div>
								</div>
								<br>
								<div class="form-heading">
									<label>CPF</label>
									<div class="controls">
										<g:textField class="form-control" name="cpf" value="${nomeacaoEdit.funcionario.cpf}" />
									</div>
								</div>
								<br>
								<div class="form-heading">
									<label>Portaria</label>
									<div class="controls">
										<g:textField class="form-control" name="portaria" value="${nomeacaoEdit.portaria}"
											required="true" />
									</div>
								</div>
								<br>

								<div class="form-heading">
									<label>Lotação</label>
									<div class="controls ">
										<select class="form-control selectpicker"
											data-live-search="true" name="lotacao" id="comboLotacao">
											<g:each in="${secretaria}">
												<option value="${it.secretaria}" <g:if test="${nomeacaoEdit.secretariaCargo.secretaria.secretaria == it.secretaria}"> selected </g:if> >
													${it.secretaria}
												</option>
											</g:each>
											
										</select>
									</div>
								</div>
								<br>
								
								<div class="form-heading">
								<label> Data da Geração da Portaria</label>
								<div class="controls">
									<g:datePicker noSelection="['':'']" precision="day"
										class="form-control" required="true" name="dataGeracaoDePortaria" value="${nomeacaoEdit.dataGeracaoDePortaria}" />
									</div>
								</div>
								<br>
								
								<div class="form-heading">
								<label> Data de Nomeação</label>
								<div class="controls">
									<g:datePicker noSelection="['':'']" precision="day"
										class="form-control" required="true" name="dataNomeacao" value="${nomeacaoEdit.dataNomeacao}" />
									</div>
								</div>
								<br>

								<div class="form-heading">
									<label>Efetivo</label>
									<div class="controls">
										<%--<g:checkBox name="efetivo" value="false" />
										--%>
										<input type="radio" name="efetivo" value="true"> Sim<br>
  										<input type="radio" name="efetivo" value="false" checked> Não<br>
									</div>
								</div>
								<br>

								<div class="form-heading">
									<label>Ativo</label>
									<div class="controls">
										<%--<g:checkBox name="ativo" value="true" />
									--%>
									<input type="radio" name="ativo" value="true" checked> Sim<br>
  									<input type="radio" name="ativo" value="false"> Não<br>
									</div>
								</div>
								<br>


							</fieldset>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary btn-flat">
									<i class="fa fa-save"></i> Atualizar
								</button>
								<input type="reset" class="btn btn btn-flat" value="Limpar">
							</div>


							<script type="text/javascript">
		
	            				function mudarSecretaria(){
				
								var endereco = "${request.getRequestURL().substring(6, request.getRequestURL().indexOf(':8080/'))}";
									var comboCargo = document.getElementById("comboCargo");
									comboCargo.options[comboCargo.options.length] = new Option("Buscando Cargos", 0);

									var idSecretaria = document.getElementById("comboSecretaria").value;
									var idCargo = document.getElementById("comboCargo").value;

									$.ajax({	type : "GET",
												url : "http://"
														+ endereco
														+ ":8080/sisGab/nomeacao/getCargoDisponivelBySecretaria?secretaria="
														+ idSecretaria,
												dataType : "json",
												success : function(result) {
													comboCargo.options.length = 0;

													if (result.id.length == 0) {
														comboCargo.options[comboCargo.options.length] = new Option(
																"Não há cargos cadastrada",	0);
													} else {
														for (i = 0; i < result.id.length; i++) {
															comboCargo.options[comboCargo.options.length] = new Option( result.cargo[i], result.id[i]); }
													}
												}
											});
								}
							</script>

						</g:form>
					</div>

			</section>

				



</body>
</html>





























