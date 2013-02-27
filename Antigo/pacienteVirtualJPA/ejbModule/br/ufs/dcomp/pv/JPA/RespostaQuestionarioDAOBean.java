package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class RespostaQuestionarioDAOBean implements RespostaQuestionarioDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	public void addRespostaQuestionario(RespostaQuestionario resposta) {
		entityManager.persist(resposta);
	}

}
