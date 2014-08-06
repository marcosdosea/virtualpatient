package br.ufs.dcomp.pv.JPA;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ParametroClinicoDAOBean implements ParametroClinicoDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;
	
	public void addParametroClinico(ParametroClinico parametro) {
		entityManager.persist(parametro);

	}
}
