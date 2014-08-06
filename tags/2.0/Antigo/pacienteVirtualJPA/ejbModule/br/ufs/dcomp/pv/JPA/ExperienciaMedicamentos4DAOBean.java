package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class ExperienciaMedicamentos4DAOBean implements ExperienciaMedicamentos4DAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addExperienciaMedicamentos4(ExperienciaMedicamentos4 exp) {
		entityManager.persist(exp);

	}
	
	public ArrayList<ExperienciaMedicamentos4> getAllByIdioma(String idioma) {
		Query abc = entityManager.createQuery("from ExperienciaMedicamentos4 e where idioma = ?1").setParameter(1, idioma);
		return (ArrayList<ExperienciaMedicamentos4>) abc.getResultList();
	}
}
