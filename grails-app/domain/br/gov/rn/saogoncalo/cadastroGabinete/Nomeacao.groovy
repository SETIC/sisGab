package br.gov.rn.saogoncalo.cadastroGabinete

class Nomeacao {
	 
	 Date dataNomeacao
	 Date dataGeracaoDePortaria
	 boolean ativo
	 String portaria
	 
	static belongsTo = [funcionario:Funcionario , secretariaCargo:SecretariaCargo]
	 

    static constraints = {
		dataNomeacao nullable:false, blank:false
		ativo  nullable:false, blank:false
		portaria nullable:false, blank:false
		dataGeracaoDePortaria nullable:true
	
    }
	static mapping = {
		table name: "nomeacao", schema:"cadastro_gabinete"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_gabinete.nomeacao_id_seq']
		
	}
}
