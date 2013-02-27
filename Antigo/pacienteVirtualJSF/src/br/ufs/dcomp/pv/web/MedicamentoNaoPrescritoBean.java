package br.ufs.dcomp.pv.web;

//import br.ufs.dcomp.pv.JPA.CasoClinico;

public class MedicamentoNaoPrescritoBean {

	private String descricao;

	private String dosagem;

	private String posologia;
	
	private boolean flItalico;

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDosagem() {
		return dosagem;
	}

	public void setDosagem(String dosagem) {
		this.dosagem = dosagem;
	}

	public String getPosologia() {
		return posologia;
	}

	public void setPosologia(String posologia) {
		this.posologia = posologia;
	}

	public void setFlItalico(boolean flItalico) {
		this.flItalico = flItalico;
	}

	public boolean isFlItalico() {
		return flItalico;
	}
	
}
