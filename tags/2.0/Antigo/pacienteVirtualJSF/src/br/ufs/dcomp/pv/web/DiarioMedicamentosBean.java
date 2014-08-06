package br.ufs.dcomp.pv.web;

public class DiarioMedicamentosBean {
	
	private String periodo;
	
	private String horario;

	private String quantidade;

	private String medicamento;	
	
	private String tipoBebida;

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

	public String getPeriodo() {
		return periodo;
	}

	public void setHorario(String horario) {
		this.horario = horario;
	}

	public String getHorario() {
		return horario;
	}

	public void setQuantidade(String quantidade) {
		this.quantidade = quantidade;
	}

	public String getQuantidade() {
		return quantidade;
	}

	public void setMedicamento(String medicamento) {
		this.medicamento = medicamento;
	}

	public String getMedicamento() {
		return medicamento;
	}

	public void setTipoBebida(String tipoBebida) {
		this.tipoBebida = tipoBebida;
	}

	public String getTipoBebida() {
		return tipoBebida;
	}

}
