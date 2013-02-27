package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class DiarioMedicamentosCasoDAOBean implements DiarioMedicamentosCasoDAO{
	
	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addDiarioMedicamentosCaso(DiarioMedicamentosCaso diarioCaso) {
		entityManager.persist(diarioCaso);
	}
	
	public ArrayList<DiarioMedicamentosCaso> getDiarioMedicamentos(CasoClinico fkCasoClinico) {		
		Query abc = entityManager.createQuery("from DiarioMedicamentosCaso d where fkCasoClinico = ?1").setParameter(1, fkCasoClinico.getId());
		return (ArrayList<DiarioMedicamentosCaso>) abc.getResultList();
	}	
}
