package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface RazaoEncontroCasoDAO {
	
	public void addRazaoEncontroCaso(RazaoEncontroCaso razaoEncontroCaso);
	public ArrayList<RazaoEncontroCaso> getAllByCasoClinico(int id);
}
