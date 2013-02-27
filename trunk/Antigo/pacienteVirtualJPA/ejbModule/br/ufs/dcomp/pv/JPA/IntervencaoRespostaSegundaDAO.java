package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface IntervencaoRespostaSegundaDAO {
	public void addIntervencaoRespostaSegunda(IntervencaoRespostaSegunda inter);
	public ArrayList<IntervencaoRespostaSegunda> getIntervencoesRSByRespostaSegunda(RespostaSegunda resp2);
}
