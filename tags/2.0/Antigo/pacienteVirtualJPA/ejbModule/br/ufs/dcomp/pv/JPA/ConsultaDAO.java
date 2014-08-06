package br.ufs.dcomp.pv.JPA;

import javax.ejb.Remote;

@Remote
public interface ConsultaDAO {
	public int addConsulta(Consulta consulta);
}
