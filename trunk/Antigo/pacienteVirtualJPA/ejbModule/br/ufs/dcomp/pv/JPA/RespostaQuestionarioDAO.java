package br.ufs.dcomp.pv.JPA;

import javax.ejb.Remote;

@Remote
public interface RespostaQuestionarioDAO {
	public void addRespostaQuestionario(RespostaQuestionario resposta);
}