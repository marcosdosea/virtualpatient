package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class ExperienciaMedicamentos2DAOBean implements ExperienciaMedicamentos2DAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addExperienciaMedicamentos2(ExperienciaMedicamentos2 exp) {
		entityManager.persist(exp);

	}
	
	public ArrayList<ExperienciaMedicamentos2> getAllByIdioma(String idioma) {
		Query abc = entityManager.createQuery("from ExperienciaMedicamentos2 e where idioma = ?1").setParameter(1, idioma);
		return (ArrayList<ExperienciaMedicamentos2>) abc.getResultList();
	}
}
