package br.gov.rn.saogoncalo.cadastroGabinete


import grails.converters.JSON

class NomeacaoController {

	def index() { }


	def listar(){

		if(session["user"] != null){


			def nomeacao = Nomeacao.executeQuery("select n from Nomeacao n " +
					" where n.ativo = true")

			def secretaria = Secretaria.findAllByAtivo("true")


			def secretariaDisponivel = Secretaria.executeQuery(" select distinct ss from SecretariaCargo scc, Secretaria ss " +
					"  where ss.id = scc.secretaria.id " +
					"    and scc.id not in ( select sc.id " +
					"   						from Nomeacao n, Cargo c, " +
					" 						    SecretariaCargo sc, Secretaria s " +
					" 							where sc.cargo.id = c.id " +
					"    and n.secretariaCargo.id = sc.id " +
					"    and sc.secretaria.id = s.id " +
					" group by sc.id, s.id, c.id " +
					" having ( sc.quantidade - count(*))=0 ) ")

			def cargo = Cargo.findAllByAtivo("true")

			render(view:"/nomeacao/listar.gsp", model:[nomeacao:nomeacao, secretaria:secretaria, cargo:cargo, secretariaDisponivel:secretariaDisponivel])
		}else{
			render(view:"/index.gsp")
		}
	}

	def salvar(){

		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/login/login.gsp", model:[ctl:"nomeacao", act:"salvar"])
		}else{
			def user = session["user"]
			def pass = session["pass"]

			SecretariaCargo secretariaCargo = SecretariaCargo.get(params.cargo)

			Funcionario funcionario = new Funcionario()
			funcionario.cpf = params.cpf
			funcionario.efetivo = params.efetivo
			funcionario.lotacao = params.lotacao
			funcionario.nome = params.nome

			if (funcionario.save(flush:true)){

				Nomeacao nomeacao = new Nomeacao(params)
				nomeacao.ativo = true
				nomeacao.dataNomeacao = new Date()
				nomeacao.funcionario = funcionario
				nomeacao.secretariaCargo = secretariaCargo
				nomeacao.portaria = params.portaria

				if (nomeacao.save(flush:true)){
					redirect(action:"listar", params:[msg:"Cadastrado com sucesso", tipo:"ok"])
				}else{
					redirect(action:"listar", params:[msg:"Erro ao cadastrar", tipo:"erro"])
				}
			}else{
				redirect(action:"listar", params:[msg:"Erro ao cadastrar", tipo:"erro"])
			}
		}
	}

	def editar(long id){
		if((session["user"] == null) || (session["pass"] == null) ){
			render (view:"/login/login.gsp", model:[ctl:"nomeacao", act:"listar"])
		}else{


			def nomeacao = Nomeacao.executeQuery("select n from Nomeacao n " +
					" where n.ativo = true")

			def secretaria = Secretaria.findAllByAtivo("true")


			def secretariaDisponivel = Secretaria.executeQuery(" select distinct ss from SecretariaCargo scc, Secretaria ss " +
					"  where ss.id = scc.secretaria.id " +
					"    and scc.id not in ( select sc.id " +
					"   						from Nomeacao n, Cargo c, " +
					" 						    SecretariaCargo sc, Secretaria s " +
					" 							where sc.cargo.id = c.id " +
					"    and n.secretariaCargo.id = sc.id " +
					"    and sc.secretaria.id = s.id " +
					" group by sc.id, s.id, c.id " +
					" having ( sc.quantidade - count(*))=0 ) ")

			def cargo = Cargo.findAllByAtivo("true")

			Nomeacao nomeacaoEdit = Nomeacao.get(id)


			render (view:"/nomeacao/editar.gsp", model:[nomeacao:nomeacao, secretaria:secretaria, cargo:cargo, secretariaDisponivel:secretariaDisponivel, nomeacaoEdit:nomeacaoEdit])
		}
	}
	
	def atualizar(){
		
				if((session["user"] == null) || (session["pass"] == null) ){
					render (view:"/login/login.gsp", model:[ctl:"nomeacao", act:"listar"])
				}else{
					
		
					Nomeacao nomeacao = Nomeacao.get(params.id)
					SecretariaCargo secretariaCargo = SecretariaCargo.get(params.cargo)
					Funcionario funcionario = Funcionario.get(nomeacao.funcionario.id)
					
					funcionario.cpf = params.cpf
					funcionario.efetivo = params.efetivo.toBoolean()
					funcionario.lotacao = params.lotacao
					funcionario.nome = params.nome
		
					if (funcionario.save(flush:true)){
		
						println("Ativo --- " + params.ativo)
						
						nomeacao.ativo = params.ativo.toBoolean()
						//nomeacao.dataNomeacao = new Date()
						nomeacao.funcionario = funcionario
						nomeacao.secretariaCargo = secretariaCargo
						nomeacao.portaria = params.portaria
		
						if (nomeacao.save(flush:true)){
							redirect(action:"listar", params:[msg:"Cadastrado com sucesso", tipo:"ok"])
						}else{
							redirect(action:"listar", params:[msg:"Erro ao cadastrar 1", tipo:"erro"])
						}
					}else{
						redirect(action:"listar", params:[msg:"Erro ao cadastrar 2", tipo:"erro"])
					}
							
						}
			}


	
	def info(long id){
		
				if(session["user"] != null){
		
		
					Nomeacao nomeacao = Nomeacao.get(id)
		
					render(view:"/nomeacao/info.gsp", model:[nomeacao:nomeacao])
				}else{
					render(view:"/index.gsp")
				}
			}


	def pesquisar(){
		
		if(session["user"] != null){


		def nomeacao
		def funcionario
		def pesquisa = "%"+params.nome+"%"
		
		switch(params.tipoBusca){
			
			case 'nome':
				
				nomeacao = Nomeacao.executeQuery(" select n from Nomeacao n, Funcionario f where f.id = n.funcionario.id " +
					" and UPPER (f.nome) LIKE ? ",[pesquisa.toUpperCase()])
				break;
				
	
			case 'cpf':
						
			def funcionario2 = Funcionario.findByCpf(params.cpf)
			nomeacao = Nomeacao.findAllByFuncionario(funcionario2)
			 

			break;
			
			case 'secretaria':
			
						
			nomeacao = Nomeacao.executeQuery(" select n " +

				" from Funcionario as f, " +
				" Nomeacao as n, " +
				" SecretariaCargo as sc, " +
				" Secretaria as s, " +
				" Cargo as c " +
				" where f.id =  n.funcionario.id " +
				" and   sc.id = n.secretariaCargo.id " +
				" and   s.id = sc.secretaria.id " +
				" and   c.id = sc.cargo.id "
			  + " and   s.id = ? " , [Long.parseLong(params.secretaria)]
				)
			
			break;
			
			case 'tipocargo':
			
			nomeacao = Nomeacao.executeQuery( "select n " +

				 " from Funcionario as f, " +
				 " Nomeacao as n, " +
				 " SecretariaCargo as sc, " +
				 " Secretaria as s, " +
				 " Cargo as c, " +
				 " TipoCargo as tp "+
			 
				 " where f.id = n.funcionario.id " +
				 " and   sc.id = n.secretariaCargo.id " +
				 " and   s.id = sc.secretaria.id " +
				 " and   c.id = sc.cargo.id " +
				 " and   tp.id = c.tipoCargo.id "
			  +  " and   tp.id = ? " , [Long.parseLong(params.tipocargo)])
					
			break;
			
			
		  }
		
		
		 def secretaria = Secretaria.findAll()
		 def cargo  = Cargo.findAll()
		 def tipoCargo = TipoCargo.findAll()
		 
		 render (view:"/nomeacao/pesquisar.gsp", model:[nomeacao:nomeacao,secretaria:secretaria , cargo:cargo , tipoCargo:tipoCargo])
		}
		
		
	  }

	
	
	def getCargoDisponivelBySecretaria(long secretaria){

		def cargos = SecretariaCargo.executeQuery(" select scc from SecretariaCargo scc, Secretaria ss, Cargo cc " +
				" where ss.id = scc.secretaria.id " +
				"  and cc.id = scc.cargo.id " +
				"   and scc.id not in ( select sc.id " +
				"			 from Nomeacao n, Cargo c, " +
				"			      SecretariaCargo sc, Secretaria s " +
				"			where sc.cargo.id = c.id " +
				"		          and n.secretariaCargo.id = sc.id " +
				"			  and sc.secretaria.id = s.id " +
				"             and s.id = ? " +
				"			group by sc.id, s.id, c.id " +
				" 	       having ( sc.quantidade - count(*))=0 ) " +
				" and ss.id = ?",[secretaria, secretaria])

		def result = ["id":cargos?.id, "cargo":cargos?.cargo.cargo]

		render( result as JSON)
	}
	
	
	def getDadosPortaria(long id){
		
		def nomeacao = Nomeacao.executeQuery( "select n " +
			" from Funcionario as f, " +
			" Nomeacao as n, " +
			" SecretariaCargo as sc, " +
			" Secretaria as s, " +
			" Cargo as c, " +
			" TipoCargo as tp "+
		
			" where f.id = n.funcionario.id " +
			" and   sc.id = n.secretariaCargo.id " +
			" and   s.id = sc.secretaria.id " +
			" and   c.id = sc.cargo.id " +
			" and   tp.id = c.tipoCargo.id "
		 +  " and   n.id = ? " , [id])
		
		def result = ["portaria":nomeacao.portaria, "cargo":nomeacao?.secretariaCargo.cargo.cargo, "nome":nomeacao.funcionario.nome, "dataNomeacao":nomeacao.dataNomeacao , "secretaria":nomeacao.secretariaCargo.secretaria.secretaria, "lotacao":nomeacao.funcionario.lotacao]
	
		render(result as JSON)
		
	}
	
}
