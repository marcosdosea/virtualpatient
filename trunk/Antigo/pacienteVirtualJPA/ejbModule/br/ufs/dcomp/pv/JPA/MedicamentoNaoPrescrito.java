package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the medicamentonaoprescrito database table.
 * 
 */
@Entity
@Table(name="medicamentonaoprescrito")
public class MedicamentoNaoPrescrito implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String descricao;

	private String dosagem;

	private String posologia;
	
	private String flItalico;

	//uni-directional many-to-one association to CasoClinico
    @ManyToOne
	@JoinColumn(name="fkCasoClinico")
	private CasoClinico casoclinico;

    public MedicamentoNaoPrescrito() {
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

	public String getDosagem() {
		return this.dosagem;
	}

	public void setDosagem(String dosagem) {
		this.dosagem = dosagem;
	}

	public String getPosologia() {
		return this.posologia;
	}

	public void setPosologia(String posologia) {
		this.posologia = posologia;
	}

	public CasoClinico getCasoclinico() {
		return this.casoclinico;
	}

	public void setCasoclinico(CasoClinico casoclinico) {
		this.casoclinico = casoclinico;
	}

	public void setFlItalico(String flItalico) {
		this.flItalico = flItalico;
	}

	public String getFlItalico() {
		return flItalico;
	}
	
}