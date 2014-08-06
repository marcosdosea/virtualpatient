package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class IntervencaoRespostaSegundaDAOBean implements
		IntervencaoRespostaSegundaDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addIntervencaoRespostaSegunda(IntervencaoRespostaSegunda inter) {
		entityManager.persist(inter);
		
	}
	
	public ArrayList<IntervencaoRespostaSegunda> getIntervencoesRSByRespostaSegunda(RespostaSegunda resp2){
		return (ArrayList<IntervencaoRespostaSegunda>) entityManager.createQuery("from IntervencaoRespostaSegunda e where fkResposta2 = ?1").setParameter(1, resp2.getId()).getResultList();
	}

}
