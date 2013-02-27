package br.ufs.dcomp.pv.JPA;

import javax.ejb.Remote;

@Remote
public interface MedicamentoAnteriorDAO {
	
	public void addMedicamentoAnterior(MedicamentoAnterior medicamento);
}
