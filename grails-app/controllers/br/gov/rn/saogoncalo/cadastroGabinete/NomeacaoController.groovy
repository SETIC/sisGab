package br.gov.rn.saogoncalo.cadastroGabinete


class NomeacaoController {

    def index() { }
	
	
	def listar(){
		
	if(session["user"] != null){
		
		def nomeacao = Nomeacao.executeQuery("select n from Nomeacao n " +
											 " where n.ativo = true")
		
		render(view:"/nomeacao/listar.gsp", model:[nomeacao:nomeacao])
		}else{
		render(view:"/index.gsp")
		}
	}
	
	def cadastrarNomeacao(){
		
		if(true){
	
		
		render (view:"/nomeacao/cadastrar.gsp", model:[])
		flash.message = "cadastro efetuado com sucesso!!!!"
		}else{
		flash.erro = "pagina de erro"
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
					
			print("nomeacao com tipos de cargo" +nomeacao)
			
			break;
			
			
		  }
		
		
		 def secretaria = Secretaria.findAll()
		 def cargo  = Cargo.findAll()
		 def tipoCargo = TipoCargo.findAll()
		 
		 render (view:"/nomeacao/pesquisar.gsp", model:[nomeacao:nomeacao,secretaria:secretaria , cargo:cargo , tipoCargo:tipoCargo])
		}
		
		
	  }
		
		
	}
