package br.gov.rn.saogoncalo.cadastroGabinete

class Secretaria {
	
	String secretaria
	boolean ativo
	// SecretariaCargo tanto em hasmany como no belongTo? e a variável com o mesmo nome? (secretariaCargo). Ta certo isso?
	static hasmany =[secretariaCargo:SecretariaCargo]
    static belongTo = [secretariaCargo:SecretariaCargo]
    static constraints = {
	secretaria nullable:false, blank:false
	ativo  nullable:false, blank:false
	
    }
	static mapping = {
		table name: "secretaria", schema:"cadastro_gabinete"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_gabinete.secretaria_id_seq']
		
	}
}
