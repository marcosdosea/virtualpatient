package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface QueixaRespostaTerceiraDAO {
	public int addQueixaRespostaTerceira(QueixaRespostaTerceira qrt);
	public ArrayList<QueixaRespostaTerceira> getAll(RespostaTerceira resp);

}
