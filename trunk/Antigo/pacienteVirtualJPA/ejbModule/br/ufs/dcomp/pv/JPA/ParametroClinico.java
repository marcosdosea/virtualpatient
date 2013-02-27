package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the parametroclinico database table.
 * 
 */
@Entity
@Table(name="parametroclinico")
public class ParametroClinico implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String descricao;

	private String unidade;

	private float valor;

	private String valorDeReferencia;
	
	//uni-directional many-to-one association to CasoClinico
    @ManyToOne
	@JoinColumn(name="fkCasoClinico")
	private CasoClinico casoclinico;

    public ParametroClinico() {
    }

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getUnidade() {
		return this.unidade;
	}

	public void setUnidade(String unidade) {
		this.unidade = unidade;
	}

	public float getValor() {
		return this.valor;
	}

	public void setValor(float valor) {
		this.valor = valor;
	}

	public String getValorDeReferencia() {
		return this.valorDeReferencia;
	}

	public void setValorDeReferencia(String valorDeReferencia) {
		this.valorDeReferencia = valorDeReferencia;
	}

	public CasoClinico getCasoclinico() {
		return casoclinico;
	}

	public void setCasoclinico(CasoClinico casoclinico) {
		this.casoclinico = casoclinico;
	}

}