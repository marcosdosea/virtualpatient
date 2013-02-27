package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Set;


/**
 * The persistent class for the queixarespostaterceira database table.
 * 
 */
@Entity
@Table(name="queixarespostaterceira")
public class QueixaRespostaTerceira implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String descricao;
	
	private int numeroPRM;

	private String periodoSurgimento;

	private int prioridade;
	
	private String tipo;

	//bi-directional many-to-one association to RespostaTerceira
    @ManyToOne
	@JoinColumn(name="fkResposta")
	private RespostaTerceira respostaterceira;

    public QueixaRespostaTerceira() {
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

	public RespostaTerceira getRespostaterceira() {
		return this.respostaterceira;
	}

	public void setRespostaterceira(RespostaTerceira respostaterceira) {
		this.respostaterceira = respostaterceira;
	}

	public void setNumeroPRM(int numeroPRM) {
		this.numeroPRM = numeroPRM;
	}

	public int getNumeroPRM() {
		return numeroPRM;
	}

	public void setPeriodoSurgimento(String periodoSurgimento) {
		this.periodoSurgimento = periodoSurgimento;
	}

	public String getPeriodoSurgimento() {
		return periodoSurgimento;
	}

	public void setPrioridade(int prioridade) {
		this.prioridade = prioridade;
	}

	public int getPrioridade() {
		return prioridade;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getTipo() {
		return tipo;
	}
	
}