package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class MedicamentosDAOBean implements MedicamentosDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addMedicamento(Medicamentos medicamento) {
		entityManager.persist(medicamento);

	}
	
	public ArrayList<Medicamentos> getAllByIdioma(String idioma) {
		Query abc = entityManager.createQuery("from Medicamentos e where idioma = ?1").setParameter(1, idioma);
		return (ArrayList<Medicamentos>) abc.getResultList();
	}
}
