package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface QueixaDAO {
	public int addQueixas(Queixa queixa);
	public ArrayList<Queixa> getAll(CasoClinico caso, int i);
	public ArrayList<Queixa> getAllOrder(CasoClinico caso, int i);
}
