package br.ufs.dcomp.pv.JPA;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class MedicamentoNaoPrescritoDAOBean implements MedicamentoNaoPrescritoDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;
	
	public void addMedicamentoNaoPrescrito(MedicamentoNaoPrescrito medicamento) {
		entityManager.persist(medicamento);

	}
}
