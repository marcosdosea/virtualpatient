package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface ExperienciaMedicamentosConcDAO {
	
	public void addExperienciaMedicamentosConc(ExperienciaMedicamentosConc exp);
	public ArrayList<ExperienciaMedicamentosConc> getAllByIdioma(String idioma);
}
