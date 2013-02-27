package br.ufs.dcomp.pv.web;

public class MedicamentoAnteriorBean {
	
	private String descricao;

	private String indicacao;

	private String resposta;
	
	private String periodo;

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setIndicacao(String indicacao) {
		this.indicacao = indicacao;
	}

	public String getIndicacao() {
		return indicacao;
	}

	public void setResposta(String resposta) {
		this.resposta = resposta;
	}

	public String getResposta() {
		return resposta;
	}

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

	public String getPeriodo() {
		return periodo;
	}

}
