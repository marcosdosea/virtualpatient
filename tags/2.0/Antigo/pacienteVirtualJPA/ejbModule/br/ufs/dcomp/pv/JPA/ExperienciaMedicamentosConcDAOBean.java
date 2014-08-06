package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class ExperienciaMedicamentosConcDAOBean implements ExperienciaMedicamentosConcDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addExperienciaMedicamentosConc(ExperienciaMedicamentosConc exp) {
		entityManager.persist(exp);

	}
	
	public ArrayList<ExperienciaMedicamentosConc> getAllByIdioma(String idioma) {
		Query abc = entityManager.createQuery("from ExperienciaMedicamentosConc e where idioma = ?1").setParameter(1, idioma);
		return (ArrayList<ExperienciaMedicamentosConc>) abc.getResultList();
	}
}
