package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class AlternativasDAOBean implements AlternativasDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addAlternativa(Alternativas alternativa) {
		entityManager.persist(alternativa);

	}
	
	public ArrayList<Alternativas> getAllByIdioma(String idioma) {
		Query abc = entityManager.createQuery("from Alternativas e where idioma = ?1").setParameter(1, idioma);
		return (ArrayList<Alternativas>) abc.getResultList();
	}
}
