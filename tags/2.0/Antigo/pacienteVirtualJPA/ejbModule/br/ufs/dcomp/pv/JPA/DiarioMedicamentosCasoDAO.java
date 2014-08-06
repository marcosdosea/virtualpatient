package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface DiarioMedicamentosCasoDAO {
	
	public void addDiarioMedicamentosCaso(DiarioMedicamentosCaso diarioCaso);

	public ArrayList<DiarioMedicamentosCaso> getDiarioMedicamentos(
			CasoClinico fkCasoClinico);
}
