package br.gov.rn.saogoncalo.administracaoSeguranca

import administracaoSeguranca.Login;


class LoginController {

    def login() { }
	
	
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
		
			  render(view:"/principal.gsp")
			
			  
		  }else{
		  
		  
			  render(view:"/login/login.gsp", model:[erro:"O usuario ou a senha inseridos estao incorretos."])
		  }
		
	 }
	   def logout(){
		   
		session["user"] = null
		session["pass"] = null
		render(view:"/login/login.gsp")
	}
	   
	   
	   def redefinirSenha(){
		   
			   
			   if((session["user"] == null) || (session["pass"] == null) ){
				   render (view:"/login/login.gsp")
			   }else{
				   def user = session["user"]
				   def pass = session["pass"]


					   def login = Login.findByUsuarioAndSenha(user,pass)
	   
					   if ((params.senhaNova1) == params.senhaNova2) {
						   if ((params.senhaNova1 != "") && (params.senhaAntiga != "")){
							   login.senha = params.senhaNova1
						   }
					   }
	   
	   
					   if(login.save(flush:true)){
						   render(view:"/login/login.gsp")
					   }
			   
				   }

		   
		   }
	   
	
}
