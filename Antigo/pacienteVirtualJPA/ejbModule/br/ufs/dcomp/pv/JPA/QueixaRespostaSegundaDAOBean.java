package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class QueixaRespostaSegundaDAOBean implements QueixaRespostaSegundaDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public int addQueixaRespostaSegunda(QueixaRespostaSegunda qrs) {
		entityManager.persist(qrs);
		return qrs.getId();
	}
	
	public ArrayList<QueixaRespostaSegunda> getQueixasByResposta(RespostaSegunda resp2){
		return (ArrayList<QueixaRespostaSegunda>) entityManager.createQuery("from QueixaRespostaSegunda e where fkResposta2 = ?1 order by prioridade").setParameter(1, resp2.getId()).getResultList();
	}
	
	public ArrayList<QueixaRespostaSegunda> getAllQueixasByResposta(RespostaSegunda resp2){
		return (ArrayList<QueixaRespostaSegunda>) entityManager.createQuery("from QueixaRespostaSegunda e where fkResposta2 = ?1").setParameter(1, resp2.getId()).getResultList();
	}

}
