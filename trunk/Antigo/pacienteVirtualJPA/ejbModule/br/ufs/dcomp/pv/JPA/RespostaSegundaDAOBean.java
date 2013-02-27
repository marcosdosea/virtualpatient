package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class RespostaSegundaDAOBean implements RespostaSegundaDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public int addRespostaSegunda(RespostaSegunda respostaSeg) {
		entityManager.persist(respostaSeg);
		return respostaSeg.getId();
	}
	
	public void addCorrecao(RespostaSegunda resp2){
		RespostaSegunda aux = entityManager.find(RespostaSegunda.class, resp2.getId());
		aux.setComentario(resp2.getComentario());
		aux.setComentarioAluno(resp2.getComentarioAluno());
		aux.setNota(resp2.getNota());
		aux.setFlCorreto(resp2.getFlCorreto());
	}

	public void addCarta(RespostaSegunda resp2){
		RespostaSegunda aux = entityManager.find(RespostaSegunda.class, resp2.getId());
		aux.setCarta(resp2.getCarta());
	}
	
	public RespostaSegunda getSemCorrecaoByConsulta(Consulta consulta){
		return (RespostaSegunda) entityManager.createQuery("from RespostaSegunda e where fkConsulta = ?1 and nota = ?2").setParameter(1, consulta.getId()).setParameter(2, (float) -1).getSingleResult();
	}
	
	public RespostaSegunda getAnteriorByConsulta(Consulta c){
		ArrayList<RespostaSegunda> listaretorno = (ArrayList<RespostaSegunda>) entityManager.createQuery("from RespostaSegunda e where fkConsulta = ?1 order by id DESC").setParameter(1, c.getId()).getResultList();
		return listaretorno.get(0);
	}
	
	public RespostaSegunda getRespostaUltimaTentativaByConsulta(Consulta c){
		ArrayList<RespostaSegunda> listaretorno = (ArrayList<RespostaSegunda>) entityManager.createQuery("from RespostaSegunda e where fkConsulta = ?1 order by numeroTentativa DESC").setParameter(1, c.getId()).getResultList();
		return listaretorno.get(0);
	}
	
}
