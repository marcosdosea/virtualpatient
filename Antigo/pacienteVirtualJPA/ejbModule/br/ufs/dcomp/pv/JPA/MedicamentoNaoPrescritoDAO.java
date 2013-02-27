package br.ufs.dcomp.pv.JPA;

import javax.ejb.Remote;

@Remote
public interface MedicamentoNaoPrescritoDAO {

	public void addMedicamentoNaoPrescrito(MedicamentoNaoPrescrito medicamento);
	
}
