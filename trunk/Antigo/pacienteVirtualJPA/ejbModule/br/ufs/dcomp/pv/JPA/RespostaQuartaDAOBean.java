package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class RespostaQuartaDAOBean implements RespostaQuartaDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public int addRespostaQuarta(RespostaQuarta respostaQuar) {
		entityManager.persist(respostaQuar);
		return respostaQuar.getId();
	}
	
	public void addCorrecao(RespostaQuarta resp4){
		RespostaQuarta aux = entityManager.find(RespostaQuarta.class, resp4.getId());
		aux.setComentario(resp4.getComentario());
		aux.setComentarioAluno(resp4.getComentarioAluno());
		aux.setNota(resp4.getNota());
		aux.setFlCorreto(resp4.getFlCorreto());
	}
	
	public RespostaQuarta getSemCorrecaoByConsulta(Consulta consulta){
		return (RespostaQuarta) entityManager.createQuery("from RespostaQuarta e where fkConsulta = ?1 and nota = ?2").setParameter(1, consulta.getId()).setParameter(2, (float) -1).getSingleResult();
	}

	public void addCarta(RespostaQuarta resp2){
		RespostaQuarta aux = entityManager.find(RespostaQuarta.class, resp2.getId());
		aux.setCarta(resp2.getCarta());
	}
	
	public RespostaQuarta getAnteriorByConsulta(Consulta c){
		ArrayList<RespostaQuarta> listaretorno = (ArrayList<RespostaQuarta>) entityManager.createQuery("from RespostaQuarta e where fkConsulta = ?1 order by id DESC").setParameter(1, c.getId()).getResultList();
		return listaretorno.get(0);
	}

}
