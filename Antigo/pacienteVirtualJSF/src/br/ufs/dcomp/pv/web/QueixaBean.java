package br.ufs.dcomp.pv.web;

import java.util.ArrayList;

import javax.faces.component.UIParameter;
import javax.faces.event.ActionEvent;


public class QueixaBean {
	
	private String conheceOuPreocupa;

	private String descricao;
	
	private int numeroPRM;
	
	private int numeroPRMMed;

	private int numeroEtapa;
	
	private String descPRM;

	private String periodoSurgimento;
	
	private int prioridade;
	
	private String descricaoMedicamento;
	
	private String dose;
	
	private String efetivo;
	
	private String necessario;
	
	private String periodoMedicamento;
	
	private String seguro;
	
	private String cumprimento;
	
	private String conheceCumpre;
	
	private String tipo;
	
	private String situacao;
	
	private String alternativa1;
	
	private String alternativa2;
	
	private ArrayList<MedicamentoQueixaBean> listaMedicamentos;
	
	private MedicamentoQueixaBean med;
	
	public QueixaBean(){
		listaMedicamentos = new ArrayList<MedicamentoQueixaBean>();
	}
	
	public String addMedicamento(){
		
		med = new MedicamentoQueixaBean();
		
		med.setConheceCumpre(conheceCumpre);
		med.setCumprimento(cumprimento);
		med.setDescrição(descricaoMedicamento);
		med.setDose(dose);
		med.setEfetivo(efetivo);
		med.setNecessario(necessario);
		med.setPeriodo(periodoMedicamento);
		med.setSeguro(seguro);
		med.setNumeroPRM(numeroPRMMed);
		med.setSituacao(situacao);	
		med.setAlternativa1(alternativa1);
		med.setAlternativa2(alternativa2);
		
		conheceCumpre = new String();
		cumprimento = new String();
		descricaoMedicamento = new String();
		dose = new String();
		efetivo = new String();
		necessario = new String();
		periodoMedicamento = new String();
		seguro = new String();
		numeroPRMMed = 1;
		situacao =  new String();
		alternativa1 = new String();
		alternativa2 = new String();
		
		listaMedicamentos.add(med);
		
		return "sucess";
	}
	
	
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public String getConheceOuPreocupa() {
		return conheceOuPreocupa;
	}
	public void setConheceOuPreocupa(String conheceOuPreocupa) {
		this.conheceOuPreocupa = conheceOuPreocupa;
	}
	public int getNumeroEtapa() {
		return numeroEtapa;
	}
	public void setNumeroEtapa(int numeroEtapa) {
		this.numeroEtapa = numeroEtapa;
	}
	public String getPeriodoSurgimento() {
		return periodoSurgimento;
	}
	public void setPeriodoSurgimento(String periodoSurgimento) {
		this.periodoSurgimento = periodoSurgimento;
	}
	public int getPrioridade() {
		return prioridade;
	}
	public void setPrioridade(int prioridade) {
		this.prioridade = prioridade;
	}

	public void setListaMedicamentos(ArrayList<MedicamentoQueixaBean> listaMedicamentos) {
		this.listaMedicamentos = listaMedicamentos;
	}

	public ArrayList<MedicamentoQueixaBean> getListaMedicamentos() {
		return listaMedicamentos;
	}
	
	public String getDose() {
		return dose;
	}

	public void setDose(String dose) {
		this.dose = dose;
	}

	public String getEfetivo() {
		return efetivo;
	}

	public void setEfetivo(String efetivo) {
		this.efetivo = efetivo;
	}

	public String getNecessario() {
		return necessario;
	}

	public void setNecessario(String necessario) {
		this.necessario = necessario;
	}

	public String getPeriodoMedicamento() {
		return periodoMedicamento;
	}

	public void setPeriodoMedicamento(String periodoMedicamento) {
		this.periodoMedicamento = periodoMedicamento;
	}

	public String getSeguro() {
		return seguro;
	}

	public void setSeguro(String seguro) {
		this.seguro = seguro;
	}

	public String getCumprimento() {
		return cumprimento;
	}

	public void setCumprimento(String cumprimento) {
		this.cumprimento = cumprimento;
	}

	public String getConheceCumpre() {
		return conheceCumpre;
	}

	public void setConheceCumpre(String conheceCumpre) {
		this.conheceCumpre = conheceCumpre;
	}

	public String getDescricaoMedicamento() {
		return descricaoMedicamento;
	}

	public void setDescricaoMedicamento(String descricaoMedicamento) {
		this.descricaoMedicamento = descricaoMedicamento;
	}

	public MedicamentoQueixaBean getMed() {
		return med;
	}

	public void setMed(MedicamentoQueixaBean med) {
		this.med = med;
	}

	public void setDescPRM(String descPRM) {
		this.descPRM = descPRM;
	}

	public String getDescPRM() {
		return descPRM;
	}

	public void setNumeroPRM(int numeroPRM) {
		this.numeroPRM = numeroPRM;
	}

	public int getNumeroPRM() {
		return numeroPRM;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getTipo() {
		return tipo;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setNumeroPRMMed(int numeroPRMMed) {
		this.numeroPRMMed = numeroPRMMed;
	}

	public int getNumeroPRMMed() {
		return numeroPRMMed;
	}

	public void setAlternativa1(String alternativa1) {
		this.alternativa1 = alternativa1;
	}

	public String getAlternativa1() {
		return alternativa1;
	}

	public void setAlternativa2(String alternativa2) {
		this.alternativa2 = alternativa2;
	}

	public String getAlternativa2() {
		return alternativa2;
	}


}
