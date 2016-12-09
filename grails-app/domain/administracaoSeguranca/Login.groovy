package administracaoSeguranca

class Login {

	String usuario
	String senha
	String nivel
		
	static constraints = {
		
		usuario blank:false, nullable:false
		senha blank:false, nullable:false
		nivel blank:false, nullable:false
	}
	
	static mapping ={
		table name: "login", schema:"administracao_seguranca"
		version false
		id generator: 'sequence', params:[sequence:'administracao_seguranca.login_id_seq']
		
		
	}
	

}
