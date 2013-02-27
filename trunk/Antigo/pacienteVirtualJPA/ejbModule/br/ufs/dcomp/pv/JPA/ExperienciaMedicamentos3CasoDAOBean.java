package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class ExperienciaMedicamentos3CasoDAOBean implements ExperienciaMedicamentos3CasoDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addExperienciaMedicamentos3Caso(ExperienciaMedicamentos3Caso expCaso) {
		entityManager.persist(expCaso);

	}
	
	public ArrayList<ExperienciaMedicamentos3Caso> getAllByCasoClinico(int id) {
		Query abc = entityManager.createQuery("from ExperienciaMedicamentos3Caso e where fkCasoClinico = ?1").setParameter(1, id);
		return (ArrayList<ExperienciaMedicamentos3Caso>) abc.getResultList();
	}
}
