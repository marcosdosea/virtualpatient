package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface ExperienciaMedicamentos3DAO {
	
	public void addExperienciaMedicamentos3(ExperienciaMedicamentos3 exp);
	public ArrayList<ExperienciaMedicamentos3> getAllByIdioma(String idioma);
}
