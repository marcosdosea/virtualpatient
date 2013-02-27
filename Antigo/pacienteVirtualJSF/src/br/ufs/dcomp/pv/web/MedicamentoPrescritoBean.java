package br.ufs.dcomp.pv.web;

public class MedicamentoPrescritoBean {

	private String descricao;

	private String dosagem;

	private String especialidademedico;

	private String nmmedico;

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

	public String getEspecialidademedico() {
		return especialidademedico;
	}

	public void setEspecialidademedico(String especialidademedico) {
		this.especialidademedico = especialidademedico;
	}

	public String getNmmedico() {
		return nmmedico;
	}

	public void setNmmedico(String nmmedico) {
		this.nmmedico = nmmedico;
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
