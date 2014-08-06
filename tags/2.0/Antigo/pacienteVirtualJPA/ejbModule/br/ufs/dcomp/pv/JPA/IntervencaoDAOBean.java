package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class IntervencaoDAOBean implements
		IntervencaoDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;
	
	
	
	public void addIntervencoes(Intervencao intervencao) {
		entityManager.persist(intervencao);

	}
	
	public ArrayList<Intervencao> getIntervencesByCasoClinico(CasoClinico caso, int etapa){
		return (ArrayList<Intervencao>) entityManager.createQuery("from Intervencao e where fkCasoClinico = ?1 and numeroEtapa = ?2").setParameter(1, caso.getId()).setParameter(2, etapa).getResultList();
	}

}
