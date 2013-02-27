package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface QueixaRespostaPrimeiraDAO {
	public void addQueixaRespostaPrimeira(QueixaRespostaPrimeira qrp);
	public ArrayList<QueixaRespostaPrimeira> getQueixasByResposta(RespostaPrimeira respostaP);
}
