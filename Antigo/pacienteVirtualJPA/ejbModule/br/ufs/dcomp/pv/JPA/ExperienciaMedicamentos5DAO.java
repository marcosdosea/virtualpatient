package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface ExperienciaMedicamentos5DAO {
	
	public void addExperienciaMedicamentos5(ExperienciaMedicamentos5 exp);
	public ArrayList<ExperienciaMedicamentos5> getAllByIdioma(String idioma);
}
