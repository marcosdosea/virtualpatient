package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the medicamentoqueixaterceira database table.
 * 
 */
@Entity
@Table(name="medicamentoqueixaterceira")
public class MedicamentoQueixaTerceira implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String cumprimento;

	private String descricao;

	private String dose;

	private String efetivo;

	private String necessario;

	private String periodo;

	private String seguro;
	
	private int numeroPRM;
	
	private String situacao;
	
	private String alternativa1;
	
	private String alternativa2;

	//bi-directional many-to-one association to QueixaRespostaTerceira
    @ManyToOne
	@JoinColumn(name="fkQueixaTerceira")
	private QueixaRespostaTerceira queixarespostaterceira;

    public MedicamentoQueixaTerceira() {
    }

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCumprimento() {
		return this.cumprimento;
	}

	public void setCumprimento(String cumprimento) {
		this.cumprimento = cumprimento;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDose() {
		return this.dose;
	}

	public void setDose(String dose) {
		this.dose = dose;
	}

	public String getEfetivo() {
		return this.efetivo;
	}

	public void setEfetivo(String efetivo) {
		this.efetivo = efetivo;
	}

	public String getNecessario() {
		return this.necessario;
	}

	public void setNecessario(String necessario) {
		this.necessario = necessario;
	}

	public String getPeriodo() {
		return this.periodo;
	}

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

	public String getSeguro() {
		return this.seguro;
	}

	public void setSeguro(String seguro) {
		this.seguro = seguro;
	}

	public QueixaRespostaTerceira getQueixarespostaTerceira() {
		return this.queixarespostaterceira;
	}

	public void setQueixarespostaTerceira(QueixaRespostaTerceira queixarespostaterceira) {
		this.queixarespostaterceira = queixarespostaterceira;
	}

	public void setNumeroPRM(int numeroPRM) {
		this.numeroPRM = numeroPRM;
	}

	public int getNumeroPRM() {
		return numeroPRM;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public String getSituacao() {
		return situacao;
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