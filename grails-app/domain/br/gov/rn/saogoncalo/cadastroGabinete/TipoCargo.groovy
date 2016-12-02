package br.gov.rn.saogoncalo.cadastroGabinete

class TipoCargo {
	
	String simbolo
	double vencimento
	double representacao
	double remuneracao
	boolean ativo

    static constraints = {
		simbolo nullable:false, blank:false
		vencimento nullable:false, blank:false
		representacao nullable:false, blank:false
		remuneracao nullable:false, blank:false
		ativo  nullable:false, blank:false
		
    }
	static mapping = {
		table name: "tipo_cargo", schema:"cadastro_gabinete"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_gabinete.tipo_cargo_id_seq']
		
	}
}
