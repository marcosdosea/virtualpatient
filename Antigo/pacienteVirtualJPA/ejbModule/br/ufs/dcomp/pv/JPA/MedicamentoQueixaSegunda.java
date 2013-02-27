package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the medicamentoqueixasegunda database table.
 * 
 */
@Entity
@Table(name="medicamentoqueixasegunda")
public class MedicamentoQueixaSegunda implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String conheceCumpre;

	private String cumprimento;

	private String descricao;

	private String dose;

	private String efetivo;

	private String necessario;

	private String periodo;

	private String seguro;
	
	private int numeroPRM;
	
	private String alternativa1;
	
	private String alternativa2;

	//bi-directional many-to-one association to QueixaRespostaSegunda
    @ManyToOne
	@JoinColumn(name="fkQueixaSegunda")
	private QueixaRespostaSegunda queixarespostasegunda;

    public MedicamentoQueixaSegunda() {
    }

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getConheceCumpre() {
		return this.conheceCumpre;
	}

	public void setConheceCumpre(String conheceCumpre) {
		this.conheceCumpre = conheceCumpre;
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

	public QueixaRespostaSegunda getQueixarespostasegunda() {
		return this.queixarespostasegunda;
	}

	public void setQueixarespostasegunda(QueixaRespostaSegunda queixarespostasegunda) {
		this.queixarespostasegunda = queixarespostasegunda;
	}

	public void setNumeroPRM(int numeroPRM) {
		this.numeroPRM = numeroPRM;
	}

	public int getNumeroPRM() {
		return numeroPRM;
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