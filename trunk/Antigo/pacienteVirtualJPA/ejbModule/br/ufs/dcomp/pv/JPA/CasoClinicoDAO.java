package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface CasoClinicoDAO {
	public ArrayList<CasoClinico> getAll();
	public int addCasoClinico(CasoClinico casoclinico);
	public CasoClinico getCasoClinico(int id);
	public ArrayList<ParametroClinico> getAllParametrosClinicos(int i);
	public ArrayList<MedicamentoNaoPrescrito> getAllMedicamentosNaoPrescritos(int i);
	public ArrayList<MedicamentoPrescrito> getAllMedicamentosPrescritos(int i);
	public ArrayList<CasoClinico> getCasosByIdioma(String idiomaAtual);
	public ArrayList<MedicamentoAnterior> getAllMedicamentosAnteriores(int id);
	public ArrayList<DiarioMedicamentosCaso> getAllDiarioMed(int id);
	
}
