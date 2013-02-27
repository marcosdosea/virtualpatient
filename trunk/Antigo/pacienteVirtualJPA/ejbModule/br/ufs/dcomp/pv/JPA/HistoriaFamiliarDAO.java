package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface HistoriaFamiliarDAO {
	
	public void addHistoriaFamiliar(HistoriaFamiliar hist);
	public ArrayList<HistoriaFamiliar> getAllByIdioma(String idioma);
}
