package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class ExperienciaMedicamentos5DAOBean implements ExperienciaMedicamentos5DAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addExperienciaMedicamentos5(ExperienciaMedicamentos5 exp) {
		entityManager.persist(exp);

	}
	
	public ArrayList<ExperienciaMedicamentos5> getAllByIdioma(String idioma) {
		Query abc = entityManager.createQuery("from ExperienciaMedicamentos5 e where idioma = ?1").setParameter(1, idioma);
		return (ArrayList<ExperienciaMedicamentos5>) abc.getResultList();
	}
}
