package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface ExperienciaMedicamentos1CasoDAO {
	
	public void addExperienciaMedicamentos1Caso(ExperienciaMedicamentos1Caso expCaso);
	public ArrayList<ExperienciaMedicamentos1Caso> getAllByCasoClinico(int id);
}
