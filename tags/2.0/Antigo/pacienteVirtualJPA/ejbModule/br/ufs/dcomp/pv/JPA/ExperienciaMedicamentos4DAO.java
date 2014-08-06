package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface ExperienciaMedicamentos4DAO {
	
	public void addExperienciaMedicamentos4(ExperienciaMedicamentos4 exp);
	public ArrayList<ExperienciaMedicamentos4> getAllByIdioma(String idioma);
}
