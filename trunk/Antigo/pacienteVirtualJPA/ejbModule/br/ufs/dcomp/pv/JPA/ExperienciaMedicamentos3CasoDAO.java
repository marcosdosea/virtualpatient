package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface ExperienciaMedicamentos3CasoDAO {
	
	public void addExperienciaMedicamentos3Caso(ExperienciaMedicamentos3Caso expCaso);
	public ArrayList<ExperienciaMedicamentos3Caso> getAllByCasoClinico(int id);
}
