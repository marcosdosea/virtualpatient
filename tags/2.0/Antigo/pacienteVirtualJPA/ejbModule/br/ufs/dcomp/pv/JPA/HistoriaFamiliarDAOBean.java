package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class HistoriaFamiliarDAOBean implements HistoriaFamiliarDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addHistoriaFamiliar(HistoriaFamiliar hist) {
		entityManager.persist(hist);

	}
	
	public ArrayList<HistoriaFamiliar> getAllByIdioma(String idioma) {
		Query abc = entityManager.createQuery("from HistoriaFamiliar e where idioma = ?1").setParameter(1, idioma);
		return (ArrayList<HistoriaFamiliar>) abc.getResultList();
	}
}
