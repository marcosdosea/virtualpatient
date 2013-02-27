package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface ExperienciaMedicamentos1DAO {
	
	public void addExperienciaMedicamentos1(ExperienciaMedicamentos1 exp);
	public ArrayList<ExperienciaMedicamentos1> getAllByIdioma(String idioma);
}
