package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class ExperienciaMedicamentos1DAOBean implements ExperienciaMedicamentos1DAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addExperienciaMedicamentos1(ExperienciaMedicamentos1 exp) {
		entityManager.persist(exp);

	}
	
	public ArrayList<ExperienciaMedicamentos1> getAllByIdioma(String idioma) {
		Query abc = entityManager.createQuery("from ExperienciaMedicamentos1 e where idioma = ?1").setParameter(1, idioma);
		return (ArrayList<ExperienciaMedicamentos1>) abc.getResultList();
	}
}
