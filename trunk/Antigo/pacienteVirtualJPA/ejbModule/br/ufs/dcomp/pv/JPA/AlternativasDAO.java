package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface AlternativasDAO {
	
	public void addAlternativa(Alternativas alternativa);
	public ArrayList<Alternativas> getAllByIdioma(String idioma);
}
