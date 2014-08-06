package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class TurmaDAOBean implements TurmaDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;
	
	public void addTurma(Turma turma) {
		entityManager.persist(turma);

	}
	
	public ArrayList<Turma> getAllTurmas(){
		Query abc = entityManager.createQuery("from Turma e");
		return (ArrayList<Turma>) abc.getResultList();
	}
	
	public Turma getTurma(int id){
		return entityManager.find(Turma.class, id);
	}
	
	public ArrayList<Turma> getTurmasByTutor(Tutor tutor){
		return (ArrayList<Turma>) entityManager.createQuery("from Turma e where fktutor = ?1").setParameter(1, tutor.getLogin()).getResultList();
	}
	
}
