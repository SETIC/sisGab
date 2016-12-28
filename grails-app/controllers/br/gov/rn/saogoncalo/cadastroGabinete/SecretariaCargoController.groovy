package br.gov.rn.saogoncalo.cadastroGabinete

class SecretariaCargoController {

    def index() { }
	
	def listar(){
		
	def qtdcargosDisponivel = []	
	qtdcargosDisponivel = SecretariaCargo.executeQuery(" select ( select count(n.id) "+ 
  "               from Nomeacao n, SecretariaCargo scc "+ 
  "               where n.secretariaCargo.id = scc.id "+
  "                 and n.ativo = true "+
  "                 and scc.id = sc.id ) as qtd "+ 
  " from SecretariaCargo sc "+
  " order by sc.id ")
	
	def secretariaCargo = SecretariaCargo.executeQuery("select sc from SecretariaCargo sc order by sc.id") 
	
	render (view:"/secretariaCargo/listar.gsp", model:[qtdcargosDisponivel:qtdcargosDisponivel, secretariaCargo:secretariaCargo])
		
	}
	
	
	def info(long id){
		
				if(session["user"] != null){
		
		
					
					def qtdcargosDisponivel = []
					qtdcargosDisponivel = SecretariaCargo.executeQuery(" select ( select count(n.id) "+
				  "               from Nomeacao n, SecretariaCargo scc "+
				  "               where n.secretariaCargo.id = scc.id "+
				  "                 and n.ativo = true "+
				  "                 and scc.id = sc.id ) as qtd "+
				  " from SecretariaCargo sc "+
				  " where sc.id = ? " +
				  " order by sc.id ", [id])
					
					SecretariaCargo secretariaCargo = SecretariaCargo.get(id)
		
					render(view:"/secretariaCargo/info.gsp", model:[secretariaCargo:secretariaCargo, qtdcargosDisponivel:qtdcargosDisponivel])
				}else{
					render(view:"/index.gsp")
				}
			}
	
	
}
