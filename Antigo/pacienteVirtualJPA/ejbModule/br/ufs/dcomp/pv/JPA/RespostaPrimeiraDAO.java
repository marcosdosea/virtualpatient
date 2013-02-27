package br.ufs.dcomp.pv.JPA;

import javax.ejb.Remote;

@Remote
public interface RespostaPrimeiraDAO {
	public int addRespostaPrimeira(RespostaPrimeira respostaPri);
	public RespostaPrimeira getRespostaPrimeiraByConsulta(Consulta consulta);
	public RespostaPrimeira getUltimaRespostaByConsulta(int i);
	public RespostaPrimeira getRespostaUltimaTentativaByConsulta(int i);	 
	public void addCorrecao(RespostaPrimeira resp1);
	public RespostaPrimeira getAnteriorByConsulta(Consulta c);
}
