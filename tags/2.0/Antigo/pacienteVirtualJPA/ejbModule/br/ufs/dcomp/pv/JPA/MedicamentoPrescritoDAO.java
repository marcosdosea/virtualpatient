package br.ufs.dcomp.pv.JPA;

import javax.ejb.Remote;

@Remote
public interface MedicamentoPrescritoDAO {

	public void addMedicamentoPrescrito(MedicamentoPrescrito medicamento);
	
}