package br.ufs.dcomp.pv.JPA;

import javax.ejb.Remote;

@Remote
public interface DiarioMedicamentosDAO {
	
	public void addDiarioMedicamentos(DiarioMedicamentos diario);
}
