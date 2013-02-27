package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class QueixaRespostaPrimeiraDAOBean implements QueixaRespostaPrimeiraDAO {
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;
	
	public void addQueixaRespostaPrimeira(QueixaRespostaPrimeira qrp) {
		entityManager.persist(qrp);
		
	}
	
	public ArrayList<QueixaRespostaPrimeira> getQueixasByResposta(RespostaPrimeira respostaP){
		return (ArrayList<QueixaRespostaPrimeira>) entityManager.createQuery("from QueixaRespostaPrimeira e where fkResposta = ?1").setParameter(1, respostaP.getId()).getResultList();
	}

}
