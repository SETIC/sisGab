package br.gov.rn.saogoncalo.cadastroGabinete

class Funcionario {
	
	String nome
	String cpf
	boolean efetivo
	String portaria
	String lotacao
	

    static constraints = {
		
	nome nullable:false, blank:false
	cpf unique:true, nullable:false, blank:false
	efetivo  nullable:false, blank:false
	portaria unique:false, nullable:false, blank:false
	lotacao nullable:false, blank:false
  }
	static mapping = {
		table name: "funcionario", schema:"cadastro_gabinete"
		version false
		id generator: 'sequence', params:[sequence:'cadastro_gabinete.funcionario_id_seq']
	}
}
