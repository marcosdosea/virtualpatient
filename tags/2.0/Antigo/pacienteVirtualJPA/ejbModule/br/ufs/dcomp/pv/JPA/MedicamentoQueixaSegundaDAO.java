package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;

import javax.ejb.Remote;

@Remote
public interface MedicamentoQueixaSegundaDAO {
	public void addMedicamentoQueixaSegunda(MedicamentoQueixaSegunda medQ2);
	public ArrayList<MedicamentoQueixaSegunda> getMedicamentosByQueixa(QueixaRespostaSegunda qr2);
}
