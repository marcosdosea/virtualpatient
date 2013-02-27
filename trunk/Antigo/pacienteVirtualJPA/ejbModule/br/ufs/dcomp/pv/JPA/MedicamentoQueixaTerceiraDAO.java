package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface MedicamentoQueixaTerceiraDAO {
	public void addMedicamentoQueixaTerceira(MedicamentoQueixaTerceira medQ3);
	public ArrayList<MedicamentoQueixaTerceira> getMedicamentosByQueixa(QueixaRespostaTerceira qr3);
}
