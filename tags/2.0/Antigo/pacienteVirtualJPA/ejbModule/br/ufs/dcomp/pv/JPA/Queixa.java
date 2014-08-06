package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;

import java.util.Set;


/**
 * The persistent class for the queixa database table.
 * 
 */
@Entity
@Table(name="queixa")
public class Queixa implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String conheceOuPreocupa;

	private String descricao;

	//uni-directional many-to-one association to CasoClinico
    @ManyToOne
	@JoinColumn(name="fkCasoClinico")
	private CasoClinico casoclinico;

	private int numeroEtapa;	

	private String periodoSurgimento;

	private int prioridade;
	
	private int numeroPRM;
	
	private String tipo;	

	//bi-directional many-to-one association to MedicamentoQueixa
	@OneToMany(mappedBy="queixa")
	private Set<MedicamentoQueixa> medicamentoqueixas;

    public Queixa() {
    }

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getConheceOuPreocupa() {
		return this.conheceOuPreocupa;
	}

	public void setConheceOuPreocupa(String conheceOuPreocupa) {
		this.conheceOuPreocupa = conheceOuPreocupa;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public int getNumeroEtapa() {
		return this.numeroEtapa;
	}

	public void setNumeroEtapa(int numeroEtapa) {
		this.numeroEtapa = numeroEtapa;
	}

	public String getPeriodoSurgimento() {
		return this.periodoSurgimento;
	}

	public void setPeriodoSurgimento(String periodoSurgimento) {
		this.periodoSurgimento = periodoSurgimento;
	}

	public int getPrioridade() {
		return this.prioridade;
	}

	public void setPrioridade(int prioridade) {
		this.prioridade = prioridade;
	}

	public Set<MedicamentoQueixa> getMedicamentoqueixas() {
		return this.medicamentoqueixas;
	}

	public void setMedicamentoqueixas(Set<MedicamentoQueixa> medicamentoqueixas) {
		this.medicamentoqueixas = medicamentoqueixas;
	}

	public void setCasoclinico(CasoClinico casoclinico) {
		this.casoclinico = casoclinico;
	}

	public CasoClinico getCasoclinico() {
		return casoclinico;
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
	
}