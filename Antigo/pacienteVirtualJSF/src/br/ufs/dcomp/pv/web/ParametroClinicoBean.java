package br.ufs.dcomp.pv.web;


//import java.util.Collection;
//import java.util.Iterator;

//import br.ufs.dcomp.pv.JPA.*;

public class ParametroClinicoBean {

	private String descricao;
	private String unidade;
	private float valor;
	private String valorDeReferencia;

	
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getUnidade() {
		return unidade;
	}

	public void setUnidade(String unidade) {
		this.unidade = unidade;
	}

	public float getValor() {
		return valor;
	}

	public void setValor(float valor) {
		this.valor = valor;
	}

	public String getValorDeReferencia() {
		return valorDeReferencia;
	}

	public void setValorDeReferencia(String valorDeReferencia) {
		this.valorDeReferencia = valorDeReferencia;
	}
	
	/*public String inserir(){
		Tb_parametroclinico newParametro = new Tb_parametroclinico();
		newParametro.setDescricao(this.descricao);
		newParametro.setUnidade(this.unidade);
		newParametro.setValor(this.valor);
		newParametro.setValorDeReferencia(this.valorDeReferencia);
		System.out.println(this.descricao);
		System.out.println(this.valor);
		System.out.println(this.unidade);
		System.out.println(this.valorDeReferencia);
		this.listaParametros1.add(this);
		return "sucesso";
	}*/
	
	/*public String remover(){
		Tb_parametroclinico newParametro = new Tb_parametroclinico();
		newParametro.setDescricao(this.descricao);
		newParametro.setUnidade(this.unidade);
		newParametro.setValor(this.valor);
		newParametro.setValorDeReferencia(this.valorDeReferencia);
		this.listaParametros1.remove(this);
		return "sucesso";
	}*/
	
	
}
