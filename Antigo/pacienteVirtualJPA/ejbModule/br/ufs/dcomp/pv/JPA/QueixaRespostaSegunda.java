package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Set;


/**
 * The persistent class for the queixarespostasegunda database table.
 * 
 */
@Entity
@Table(name="queixarespostasegunda")
public class QueixaRespostaSegunda implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String descricao;
	
	private String periodoSurgimento;
	
	private int numeroPRM;
	
	private String tipo;

	//bi-directional many-to-one association to RespostaSegunda
    @ManyToOne
	@JoinColumn(name="fkResposta2")
	private RespostaSegunda respostasegunda;

	private String flConheceOuPreocupa;	

	private int prioridade;

	//bi-directional many-to-one association to MedicamentoQueixasSgunda
	@OneToMany(mappedBy="queixarespostasegunda")
	private Set<MedicamentoQueixaSegunda> medicamentoqueixasegundas;

    public QueixaRespostaSegunda() {
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

	public String getFlConheceOuPreocupa() {
		return this.flConheceOuPreocupa;
	}

	public void setFlConheceOuPreocupa(String flConheceOuPreocupa) {
		this.flConheceOuPreocupa = flConheceOuPreocupa;
	}

	public int getPrioridade() {
		return this.prioridade;
	}

	public void setPrioridade(int prioridade) {
		this.prioridade = prioridade;
	}

	public Set<MedicamentoQueixaSegunda> getMedicamentoqueixasegundas() {
		return this.medicamentoqueixasegundas;
	}

	public void setMedicamentoqueixasegundas(Set<MedicamentoQueixaSegunda> medicamentoqueixasegundas) {
		this.medicamentoqueixasegundas = medicamentoqueixasegundas;
	}

	public void setRespostasegunda(RespostaSegunda respostasegunda) {
		this.respostasegunda = respostasegunda;
	}

	public RespostaSegunda getRespostasegunda() {
		return respostasegunda;
	}

	public void setPeriodoSurgimento(String periodoSurgimento) {
		this.periodoSurgimento = periodoSurgimento;
	}

	public String getPeriodoSurgimento() {
		return periodoSurgimento;
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