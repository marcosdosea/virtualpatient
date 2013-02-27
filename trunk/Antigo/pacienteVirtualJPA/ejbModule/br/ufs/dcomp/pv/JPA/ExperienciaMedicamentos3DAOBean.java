package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class ExperienciaMedicamentos3DAOBean implements ExperienciaMedicamentos3DAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addExperienciaMedicamentos3(ExperienciaMedicamentos3 exp) {
		entityManager.persist(exp);

	}
	
	public ArrayList<ExperienciaMedicamentos3> getAllByIdioma(String idioma) {
		Query abc = entityManager.createQuery("from ExperienciaMedicamentos3 e where idioma = ?1").setParameter(1, idioma);
		return (ArrayList<ExperienciaMedicamentos3>) abc.getResultList();
	}
}
