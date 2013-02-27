package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface QueixaRespostaSegundaDAO {
	public int addQueixaRespostaSegunda(QueixaRespostaSegunda qrs);
	public ArrayList<QueixaRespostaSegunda> getQueixasByResposta(RespostaSegunda resp2);
	public ArrayList<QueixaRespostaSegunda> getAllQueixasByResposta(RespostaSegunda resp2);
}
