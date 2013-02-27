package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class ExperienciaMedicamentos2CasoDAOBean implements ExperienciaMedicamentos2CasoDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addExperienciaMedicamentos2Caso(ExperienciaMedicamentos2Caso expCaso) {
		entityManager.persist(expCaso);

	}
	
	public ArrayList<ExperienciaMedicamentos2Caso> getAllByCasoClinico(int id) {
		Query abc = entityManager.createQuery("from ExperienciaMedicamentos2Caso e where fkCasoClinico = ?1").setParameter(1, id);
		return (ArrayList<ExperienciaMedicamentos2Caso>) abc.getResultList();
	}
}
