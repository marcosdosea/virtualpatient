package br.ufs.dcomp.pv.JPA;


import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class MedicamentoQueixaDAOBean implements MedicamentoQueixaDAO{

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;
	
	public void addMedicamentoQueixa(MedicamentoQueixa medq){
		entityManager.persist(medq);
	}
	
	public ArrayList<MedicamentoQueixa> getMedicamentosByQueixa(Queixa q){
		return (ArrayList<MedicamentoQueixa>) entityManager.createQuery("from MedicamentoQueixa e where fkQueixa = ?1").setParameter(1, q.getId()).getResultList();
	}
	
}
