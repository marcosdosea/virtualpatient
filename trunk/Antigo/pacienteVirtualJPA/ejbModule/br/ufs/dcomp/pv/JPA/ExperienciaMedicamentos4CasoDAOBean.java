package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class ExperienciaMedicamentos4CasoDAOBean implements ExperienciaMedicamentos4CasoDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addExperienciaMedicamentos4Caso(ExperienciaMedicamentos4Caso expCaso) {
		entityManager.persist(expCaso);

	}
	
	public ArrayList<ExperienciaMedicamentos4Caso> getAllByCasoClinico(int id) {
		Query abc = entityManager.createQuery("from ExperienciaMedicamentos4Caso e where fkCasoClinico = ?1").setParameter(1, id);
		return (ArrayList<ExperienciaMedicamentos4Caso>) abc.getResultList();
	}
}
