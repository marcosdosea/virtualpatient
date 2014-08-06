package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class MedicamentoQueixaSegundaDAOBean implements
		MedicamentoQueixaSegundaDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;
	
	@Override
	public void addMedicamentoQueixaSegunda(MedicamentoQueixaSegunda medQ2) {
		// TODO Auto-generated method stub
		entityManager.persist(medQ2);
	}
	
	public ArrayList<MedicamentoQueixaSegunda> getMedicamentosByQueixa(QueixaRespostaSegunda qr2){
		return (ArrayList<MedicamentoQueixaSegunda>) entityManager.createQuery("from MedicamentoQueixaSegunda e where fkQueixaSegunda = ?1").setParameter(1, qr2.getId()).getResultList();
	}

}
