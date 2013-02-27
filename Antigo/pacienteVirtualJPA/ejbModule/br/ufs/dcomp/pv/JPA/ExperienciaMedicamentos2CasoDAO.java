package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface ExperienciaMedicamentos2CasoDAO {
	
	public void addExperienciaMedicamentos2Caso(ExperienciaMedicamentos2Caso expCaso);
	public ArrayList<ExperienciaMedicamentos2Caso> getAllByCasoClinico(int id);
}
