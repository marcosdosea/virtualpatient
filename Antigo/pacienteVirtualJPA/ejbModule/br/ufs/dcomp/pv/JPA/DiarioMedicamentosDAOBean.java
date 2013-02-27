package br.ufs.dcomp.pv.JPA;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class DiarioMedicamentosDAOBean implements DiarioMedicamentosDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addDiarioMedicamentos(DiarioMedicamentos diario) {
		entityManager.persist(diario);

	}
}
