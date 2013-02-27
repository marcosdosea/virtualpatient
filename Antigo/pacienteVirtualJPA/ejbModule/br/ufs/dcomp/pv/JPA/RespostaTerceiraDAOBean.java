package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class RespostaTerceiraDAOBean implements RespostaTerceiraDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public int addRespostaTerceira(RespostaTerceira respostaTer) {
		entityManager.persist(respostaTer);
		return respostaTer.getId();
	}
	
	public RespostaTerceira getRespostaTerceiraByConsulta(Consulta consulta){
		return (RespostaTerceira) entityManager.createQuery("from RespostaTerceira e where fkConsulta = ?1 and flCorreto = ?2").setParameter(1, consulta.getId()).setParameter(2, "V").getSingleResult();
	}

	public void addCorrecao(RespostaTerceira resp3){
		RespostaTerceira aux = entityManager.find(RespostaTerceira.class, resp3.getId());
		aux.setComentario(resp3.getComentario());
		aux.setComentarioAluno(resp3.getComentarioAluno());
		aux.setNota(resp3.getNota());
		aux.setFlCorreto(resp3.getFlCorreto());
	}
	
	public RespostaTerceira getSemCorrecaoByConsulta(Consulta consulta){
		return (RespostaTerceira) entityManager.createQuery("from RespostaTerceira e where fkConsulta = ?1 and nota = ?2").setParameter(1, consulta.getId()).setParameter(2, (float) -1).getSingleResult();
	}
	
	public RespostaTerceira getAnteriorByConsulta(Consulta c){
		ArrayList<RespostaTerceira> listaretorno = (ArrayList<RespostaTerceira>) entityManager.createQuery("from RespostaTerceira e where fkConsulta = ?1 order by id DESC").setParameter(1, c.getId()).getResultList();
		return listaretorno.get(0);
	}

	@Override
	public ArrayList<DiarioMedicamentos> getDiarioMedicamentos(int id) {
		
		Query abc = entityManager.createQuery("from DiarioMedicamentos d where fkRespostaTerceira = ?1").setParameter(1, id);
		return (ArrayList<DiarioMedicamentos>) abc.getResultList();
	}
	
}
