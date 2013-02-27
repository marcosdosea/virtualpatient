package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface IntervencaoDAO {
	public void addIntervencoes(Intervencao intervencao);
	public ArrayList<Intervencao> getIntervencesByCasoClinico(CasoClinico caso, int etapa);
}
