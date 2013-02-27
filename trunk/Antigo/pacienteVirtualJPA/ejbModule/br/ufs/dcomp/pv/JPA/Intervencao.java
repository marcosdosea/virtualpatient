package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the intervencao database table.
 * 
 */
@Entity
@Table(name="intervencao")
public class Intervencao implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String descricao;
	
	private String indicacao;

	
	private int numeroEtapa;
	
	//uni-directional many-to-one association to CasoClinico
    @ManyToOne
	@JoinColumn(name="fkCasoClinico")
	private CasoClinico casoclinico;


    public Intervencao() {
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

	public void setNumeroEtapa(int numeroEtapa) {
		this.numeroEtapa = numeroEtapa;
	}

	public int getNumeroEtapa() {
		return numeroEtapa;
	}

	public void setCasoclinico(CasoClinico casoclinico) {
		this.casoclinico = casoclinico;
	}

	public CasoClinico getCasoclinico() {
		return casoclinico;
	}

	public void setIndicacao(String indicacao) {
		this.indicacao = indicacao;
	}

	public String getIndicacao() {
		return indicacao;
	}

}