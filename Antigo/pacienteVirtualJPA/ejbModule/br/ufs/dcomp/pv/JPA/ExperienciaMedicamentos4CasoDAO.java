package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface ExperienciaMedicamentos4CasoDAO {
	
	public void addExperienciaMedicamentos4Caso(ExperienciaMedicamentos4Caso expCaso);
	public ArrayList<ExperienciaMedicamentos4Caso> getAllByCasoClinico(int id);
}
