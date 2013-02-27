package br.ufs.dcomp.pv.JPA;

import javax.ejb.Remote;

@Remote
public interface RespostaSegundaDAO {
	public int addRespostaSegunda(RespostaSegunda respostaSeg);
	public void addCorrecao(RespostaSegunda resp2);
	public void addCarta(RespostaSegunda resp2);
	public RespostaSegunda getSemCorrecaoByConsulta(Consulta consulta);
	public RespostaSegunda getAnteriorByConsulta(Consulta c);
}
