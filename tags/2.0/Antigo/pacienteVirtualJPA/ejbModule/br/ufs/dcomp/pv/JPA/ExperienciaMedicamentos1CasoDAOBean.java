package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class ExperienciaMedicamentos1CasoDAOBean implements ExperienciaMedicamentos1CasoDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addExperienciaMedicamentos1Caso(ExperienciaMedicamentos1Caso expCaso) {
		entityManager.persist(expCaso);

	}
	
	public ArrayList<ExperienciaMedicamentos1Caso> getAllByCasoClinico(int id) {
		Query abc = entityManager.createQuery("from ExperienciaMedicamentos1Caso e where fkCasoClinico = ?1").setParameter(1, id);
		return (ArrayList<ExperienciaMedicamentos1Caso>) abc.getResultList();
	}
}
