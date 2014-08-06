package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class HistoriaMedicaPregressaDAOBean implements HistoriaMedicaPregressaDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addHistoriaMedicaPregressa(HistoriaMedicaPregressa hist) {
		entityManager.persist(hist);

	}
	
	public ArrayList<HistoriaMedicaPregressa> getAllByIdioma(String idioma) {
		Query abc = entityManager.createQuery("from HistoriaMedicaPregressa e where idioma = ?1").setParameter(1, idioma);
		return (ArrayList<HistoriaMedicaPregressa>) abc.getResultList();
	}
}
