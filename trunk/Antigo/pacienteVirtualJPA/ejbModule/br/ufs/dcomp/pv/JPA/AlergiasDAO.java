package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface AlergiasDAO {
	
	public void addAlergia(Alergias alergia);
	public ArrayList<Alergias> getAllByIdioma(String idioma);
}
