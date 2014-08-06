package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class RazaoEncontroDAOBean implements RazaoEncontroDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addRazaoEncontro(RazaoEncontro razaoEncontro) {
		entityManager.persist(razaoEncontro);

	}
	
	public ArrayList<RazaoEncontro> getAllByIdioma(String idioma) {
		Query abc = entityManager.createQuery("from RazaoEncontro e where idioma = ?1").setParameter(1, idioma);
		return (ArrayList<RazaoEncontro>) abc.getResultList();
	}
}
