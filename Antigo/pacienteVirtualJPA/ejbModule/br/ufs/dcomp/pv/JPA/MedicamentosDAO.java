package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface MedicamentosDAO {
	
	public void addMedicamento(Medicamentos medicamento);
	public ArrayList<Medicamentos> getAllByIdioma(String idioma);
}
