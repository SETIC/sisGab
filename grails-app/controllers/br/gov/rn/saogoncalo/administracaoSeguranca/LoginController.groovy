package br.gov.rn.saogoncalo.administracaoSeguranca

import administracaoSeguranca.Login;


class LoginController {

    def index() { }
	
	def getPrincipal(){
		
		render(view:"/principal.gsp")
		
	}
		
	def autenticar(){
		 
		def user = params.usuario
		def pass = params.senha
		
		println(params.usuario + " -- " + params.senha) 
	
		def userLogin =  Login.findByUsuarioAndSenha(user,pass)
		
		println(userLogin)
						
		  if(userLogin != null){
			 
			  session["user"] = user
			  session["pass"] = pass
		
			  render(view:"/nomeacao/listar.gsp")
			
		  }else{
		  
			  render(view:"/login/login.gsp", model:[erro:"O usuario ou a senha inseridos estao incorretos."])
		  }
		
	 }
	   def logout(){
		   
		session["user"] = null
		session["pass"] = null
		render(view:"/index.gsp")
	}
	
}
