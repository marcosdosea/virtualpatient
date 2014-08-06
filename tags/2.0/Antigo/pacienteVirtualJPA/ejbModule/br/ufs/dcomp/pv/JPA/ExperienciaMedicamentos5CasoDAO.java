package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface ExperienciaMedicamentos5CasoDAO {
	
	public void addExperienciaMedicamentos5Caso(ExperienciaMedicamentos5Caso expCaso);
	public ArrayList<ExperienciaMedicamentos5Caso> getAllByCasoClinico(int id);
}
