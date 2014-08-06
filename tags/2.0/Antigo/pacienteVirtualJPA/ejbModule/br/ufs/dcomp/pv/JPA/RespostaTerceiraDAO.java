package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface RespostaTerceiraDAO {
	public int addRespostaTerceira(RespostaTerceira respostaTer);
	public RespostaTerceira getRespostaTerceiraByConsulta(Consulta consulta);
	public void addCorrecao(RespostaTerceira resp3);
	public RespostaTerceira getSemCorrecaoByConsulta(Consulta consulta);
	public RespostaTerceira getAnteriorByConsulta(Consulta c);
	public ArrayList<DiarioMedicamentos> getDiarioMedicamentos(int id);
}
