package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class MedicamentoQueixaTerceiraDAOBean implements
		MedicamentoQueixaTerceiraDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;
	
	@Override
	public void addMedicamentoQueixaTerceira(MedicamentoQueixaTerceira medQ3) {
		// TODO Auto-generated method stub
		entityManager.persist(medQ3);
	}
	
	public ArrayList<MedicamentoQueixaTerceira> getMedicamentosByQueixa(QueixaRespostaTerceira qr3){
		return (ArrayList<MedicamentoQueixaTerceira>) entityManager.createQuery("from MedicamentoQueixaTerceira e where fkQueixaTerceira = ?1").setParameter(1, qr3.getId()).getResultList();
	}

}
