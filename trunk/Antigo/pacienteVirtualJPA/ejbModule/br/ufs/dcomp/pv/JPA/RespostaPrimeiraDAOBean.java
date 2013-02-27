package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class RespostaPrimeiraDAOBean implements RespostaPrimeiraDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public int addRespostaPrimeira(RespostaPrimeira respostaPri) {
		entityManager.persist(respostaPri);
		return respostaPri.getId();
	}
	
	public RespostaPrimeira getRespostaPrimeiraByConsulta(Consulta consulta){
		return (RespostaPrimeira) entityManager.createQuery("from RespostaPrimeira e where fkConsulta = ?1 and flCorreto = ?2").setParameter(1, consulta.getId()).setParameter(2, "V").getSingleResult();
	}
	
	public RespostaPrimeira getUltimaRespostaByConsulta(int i){
		
		ArrayList<RespostaPrimeira> lista = (ArrayList<RespostaPrimeira>) entityManager.createQuery("from RespostaPrimeira where fkConsulta = ?1 and nota = -1").setParameter(1, i).getResultList();
		return lista.get(0);
	}
	
	public RespostaPrimeira getRespostaUltimaTentativaByConsulta(int i){
		
		ArrayList<RespostaPrimeira> lista = (ArrayList<RespostaPrimeira>) entityManager.createQuery("from RespostaPrimeira where fkConsulta = ?1 order by numeroTentativa DESC").setParameter(1, i).getResultList();
		return lista.get(0);
	}
	
	public void addCorrecao(RespostaPrimeira resp1){
		RespostaPrimeira aux = entityManager.find(RespostaPrimeira.class, resp1.getId());
		aux.setComentario(resp1.getComentario());
		aux.setComentarioAluno(resp1.getComentarioAluno());
		aux.setNota(resp1.getNota());
		aux.setFlCorreto(resp1.getFlCorreto());
	}
	
	public RespostaPrimeira getAnteriorByConsulta(Consulta c){
		ArrayList<RespostaPrimeira> listaretorno = (ArrayList<RespostaPrimeira>) entityManager.createQuery("from RespostaPrimeira e where fkConsulta = ?1 order by id DESC").setParameter(1, c.getId()).getResultList();
		return listaretorno.get(0);
	}

}
