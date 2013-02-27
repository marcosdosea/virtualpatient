package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class QueixaRespostaTerceiraDAOBean implements QueixaRespostaTerceiraDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public int addQueixaRespostaTerceira(QueixaRespostaTerceira qrt) {
		entityManager.persist(qrt);
		return qrt.getId();
		
	}
	

	public ArrayList<QueixaRespostaTerceira> getAll(RespostaTerceira resp){
		return (ArrayList<QueixaRespostaTerceira>) entityManager.createQuery("from QueixaRespostaTerceira e where fkResposta = ?1").setParameter(1, resp.getId()).getResultList();
	}
	
}
