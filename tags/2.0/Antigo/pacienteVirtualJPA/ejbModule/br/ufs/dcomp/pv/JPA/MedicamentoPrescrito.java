package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the medicamentoprescrito database table.
 * 
 */
@Entity
@Table(name="medicamentoprescrito")
public class MedicamentoPrescrito implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String descricao;

	private String dosagem;

	private String especialidadeMedico;

	private String nmMedico;

	private String posologia;
	
	private String flItalico;

	//uni-directional many-to-one association to CasoClinico
    @ManyToOne
	@JoinColumn(name="fkCasoClinico")
	private CasoClinico casoclinico;

    public MedicamentoPrescrito() {
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

	public String getEspecialidadeMedico() {
		return this.especialidadeMedico;
	}

	public void setEspecialidadeMedico(String especialidadeMedico) {
		this.especialidadeMedico = especialidadeMedico;
	}

	public String getNmMedico() {
		return this.nmMedico;
	}

	public void setNmMedico(String nmMedico) {
		this.nmMedico = nmMedico;
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