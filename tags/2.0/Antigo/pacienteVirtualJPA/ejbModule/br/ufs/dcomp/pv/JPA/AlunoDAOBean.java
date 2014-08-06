package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;
import java.util.Collection;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class AlunoDAOBean implements AlunoDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;
	
	public void addAluno(Aluno aluno) {
		entityManager.persist(aluno);

	}

    @SuppressWarnings("unchecked")
    public Collection<Aluno> getAllAlunos() {
        return (Collection<Aluno>) entityManager.createQuery(
        "SELECT e FROM Aluno e JOIN FETCH e.tbusuario").getResultList();

    }
    
    public ArrayList<Aluno> getAll(){
    	return (ArrayList<Aluno>) entityManager.createQuery("from Aluno e").getResultList();
    }
    
	public Aluno getAluno(String login){
		return entityManager.find(Aluno.class, login);
	}
	
	public void progredirConsulta(Aluno aluno){
			Aluno alunoAux = entityManager.find(Aluno.class, aluno.getLogin());			
			//alunoAux.setOcupado(aluno.getOcupado());
			alunoAux.setConsultaAtual(aluno.getConsultaAtual());
			alunoAux.setLiberado(aluno.getLiberado());
	}
	
	public void alocarEmTurma(Aluno aluno){
		Aluno alunoAux = entityManager.find(Aluno.class, aluno.getLogin());			
		alunoAux.setTurma(aluno.getTurma());
	}
	
    public ArrayList<Aluno> getAllSemTurma(){
    	return (ArrayList<Aluno>) entityManager.createQuery("from Aluno e where fkTurma = null").getResultList();
    }

	public ArrayList<Aluno> getOcupados(Turma turma){
		return (ArrayList<Aluno>) entityManager.createQuery("from Aluno e where liberado = ?2 and fkturma = ?1").setParameter(1, turma.getId()).setParameter(2, 'N').getResultList();
	}
	
	public ArrayList<Aluno> getAlunosFinalizados(){
		return (ArrayList<Aluno>) entityManager.createQuery("from Aluno e where nrconsulta > 4").getResultList();		
	}
	
	public void setarOcupado(Aluno aluno, int nConsulta, int nTentativa, char lib){
		Aluno aux = entityManager.find(Aluno.class, aluno.getLogin());
		aux.setNrConsulta(nConsulta);
		aux.setLiberado(lib);
		aux.setNrTentativa(nTentativa);
	}
    
}
