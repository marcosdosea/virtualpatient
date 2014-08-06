package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class RazaoEncontroCasoDAOBean implements RazaoEncontroCasoDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addRazaoEncontroCaso(RazaoEncontroCaso razaoEncontroCaso) {
		entityManager.persist(razaoEncontroCaso);

	}
	
	public ArrayList<RazaoEncontroCaso> getAllByCasoClinico(int id) {
		Query abc = entityManager.createQuery("from RazaoEncontroCaso e where fkCasoClinico = ?1").setParameter(1, id);
		return (ArrayList<RazaoEncontroCaso>) abc.getResultList();
	}
}
