package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The persistent class for the razaoencontrocaso database table.
 * 
 */
@Entity
@Table(name="razaoencontrocaso")

public class RazaoEncontroCaso implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String descricao;

	//uni-directional many-to-one association to CasoClinico
    @ManyToOne
	@JoinColumn(name="fkCasoClinico")
	private CasoClinico casoclinico;
    
    public RazaoEncontroCaso(){    	
    }

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setCasoclinico(CasoClinico casoclinico) {
		this.casoclinico = casoclinico;
	}

	public CasoClinico getCasoclinico() {
		return casoclinico;
	}
    

}
