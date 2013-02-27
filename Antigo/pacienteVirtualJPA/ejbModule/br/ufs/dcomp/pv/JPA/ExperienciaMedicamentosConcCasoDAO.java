package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface ExperienciaMedicamentosConcCasoDAO {
	
	public void addExperienciaMedicamentosConcCaso(ExperienciaMedicamentosConcCaso expCaso);
	public ArrayList<ExperienciaMedicamentosConcCaso> getAllByCasoClinico(int id);
}
