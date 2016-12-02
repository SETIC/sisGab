package br.gov.rn.saogoncalo.cadastroGabinete

class Cargo {
	
	String cargo
	String tipoCargo
	boolean ativo
	
	static hasmany = [secretariaCargo:SecretariaCargo]
	static belongsTo = [tipoCargo:TipoCargo]
	

    static constraints = {
	cargo nullable:false, blank:false
	tipoCargo nullable:false, blank:false
	ativo  nullable:false, blank:false
	
    }
	
	static mapping = {
		table name: "cargo", schema:"cadastro_gabinete"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_gabinete.cargo_id_seq']
		
	}
}
