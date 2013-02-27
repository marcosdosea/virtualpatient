package br.ufs.dcomp.pv.JPA;

import java.util.Collection;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
//import javax.persistence.Query;

@Stateless
public class TutorDAOBean implements TutorDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;
		
	public void addTutor(Tutor tutor) {
		entityManager.persist(tutor);

	}

	@SuppressWarnings("unchecked")
	public Collection<Tutor> getAllTutors() {
		return (Collection<Tutor>) entityManager.createQuery(
			"SELECT e FROM Tutor e JOIN FETCH e.tbusuario").getResultList();
	}
	/*
	// Ex.: se tutor = entityManager.find(Tbtutor.class, "login")
	public void removeTutor(Tb_tutor tutor) {
		entityManager.remove(tutor);
		
	}
	
	// Ex.: se tutor = entityManager.find(Tbtutor.class, "login")
	public void updateNameTutor(Tb_usuario tutor, String newName){
		tutor.setNome(newName);
	}
	
	public void getTutorByEmail(String email){
		Query q = entityManager.createQuery("select c from Tbusuario c where c.email = :email");
	    q.setParameter("email", email);
	    
	    Tb_usuario tbU = (Tb_usuario) q.getSingleResult();
	}
	*/
	
	public Tutor getTutor(String login){
		return entityManager.find(Tutor.class, login);
	}
}
