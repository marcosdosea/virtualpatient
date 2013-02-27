package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class AlergiasDAOBean implements AlergiasDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addAlergia(Alergias alergia) {
		entityManager.persist(alergia);

	}
	
	public ArrayList<Alergias> getAllByIdioma(String idioma) {
		Query abc = entityManager.createQuery("from Alergias e where idioma = ?1").setParameter(1, idioma);
		return (ArrayList<Alergias>) abc.getResultList();
	}
}
