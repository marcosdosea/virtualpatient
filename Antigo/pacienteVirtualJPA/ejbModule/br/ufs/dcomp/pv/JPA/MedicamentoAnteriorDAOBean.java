package br.ufs.dcomp.pv.JPA;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class MedicamentoAnteriorDAOBean implements MedicamentoAnteriorDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addMedicamentoAnterior(MedicamentoAnterior medicamento) {
		entityManager.persist(medicamento);

	}
}
