package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface ExperienciaMedicamentos2DAO {
	
	public void addExperienciaMedicamentos2(ExperienciaMedicamentos2 exp);
	public ArrayList<ExperienciaMedicamentos2> getAllByIdioma(String idioma);
}
