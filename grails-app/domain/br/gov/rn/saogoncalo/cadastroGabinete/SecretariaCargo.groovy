package br.gov.rn.saogoncalo.cadastroGabinete

class SecretariaCargo {
	
	int quantidade 
	
	static hasMany = [nomeacao:Nomeacao]
	static belongsTo = [secretaria:Secretaria, cargo:Cargo]

    static constraints = {
		quantidade nullable:false, blank:false
		
    }
	static mapping = {
		table name: "secretaria_cargo", schema:"cadastro_gabinete"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_gabinete.secretaria_cargo_id_seq']
		
	}
}
