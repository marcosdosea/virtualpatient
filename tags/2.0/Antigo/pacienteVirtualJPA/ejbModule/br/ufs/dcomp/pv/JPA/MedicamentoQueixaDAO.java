package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface MedicamentoQueixaDAO {
	public void addMedicamentoQueixa(MedicamentoQueixa medq);
	public ArrayList<MedicamentoQueixa> getMedicamentosByQueixa(Queixa q);
}
