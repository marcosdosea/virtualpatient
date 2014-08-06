package br.ufs.dcomp.pv.JPA;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class MedicamentoPrescritoDAOBean implements MedicamentoPrescritoDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;
	
	public void addMedicamentoPrescrito(MedicamentoPrescrito medicamento) {
		entityManager.persist(medicamento);

	}
}
