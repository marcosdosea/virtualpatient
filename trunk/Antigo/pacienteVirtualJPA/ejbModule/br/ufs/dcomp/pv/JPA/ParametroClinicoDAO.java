package br.ufs.dcomp.pv.JPA;

import javax.ejb.Remote;

@Remote
public interface ParametroClinicoDAO {

	public void addParametroClinico(ParametroClinico parametro);
	
}
