package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface HistoriaMedicaPregressaDAO {
	
	public void addHistoriaMedicaPregressa(HistoriaMedicaPregressa hist);
	public ArrayList<HistoriaMedicaPregressa> getAllByIdioma(String idioma);
}
