package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class ExperienciaMedicamentos5CasoDAOBean implements ExperienciaMedicamentos5CasoDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addExperienciaMedicamentos5Caso(ExperienciaMedicamentos5Caso expCaso) {
		entityManager.persist(expCaso);

	}
	
	public ArrayList<ExperienciaMedicamentos5Caso> getAllByCasoClinico(int id) {
		Query abc = entityManager.createQuery("from ExperienciaMedicamentos5Caso e where fkCasoClinico = ?1").setParameter(1, id);
		return (ArrayList<ExperienciaMedicamentos5Caso>) abc.getResultList();
	}
}
