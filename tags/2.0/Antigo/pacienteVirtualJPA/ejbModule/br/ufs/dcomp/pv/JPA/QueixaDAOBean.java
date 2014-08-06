package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class QueixaDAOBean implements QueixaDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;
	
	public int addQueixas(Queixa queixa){
		entityManager.persist(queixa);
		return queixa.getId();
	}
	
	public ArrayList<Queixa> getAllOrder(CasoClinico caso, int i){
		return (ArrayList<Queixa>) entityManager.createQuery("from Queixa where fkCasoClinico = ?1 and numeroEtapa = ?2 order by prioridade").setParameter(1, caso.getId()).setParameter(2, i).getResultList();
	}
	
	public ArrayList<Queixa> getAll(CasoClinico caso, int i){
		return (ArrayList<Queixa>) entityManager.createQuery("from Queixa where fkCasoClinico = ?1 and numeroEtapa = ?2").setParameter(1, caso.getId()).setParameter(2, i).getResultList();
	}


}
