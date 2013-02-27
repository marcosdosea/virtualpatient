package br.ufs.dcomp.pv.JPA;

import javax.ejb.Remote;

@Remote
public interface RespostaQuartaDAO {
	
	public int addRespostaQuarta(RespostaQuarta respostaQuar);
	public void addCorrecao(RespostaQuarta resp4);
	public RespostaQuarta getSemCorrecaoByConsulta(Consulta consulta);
	public void addCarta(RespostaQuarta resp2);
	public RespostaQuarta getAnteriorByConsulta(Consulta c);
}
