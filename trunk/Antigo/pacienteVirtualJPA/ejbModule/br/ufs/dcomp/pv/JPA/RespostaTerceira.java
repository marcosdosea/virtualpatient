package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Date;
import java.util.Set;


/**
 * The persistent class for the respostaterceira database table.
 * 
 */
@Entity
@Table(name="respostaterceira")
public class RespostaTerceira implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private Date dataRealizacao;

	private String flCorreto;

	private float peso;
	
	private float imc;

	private int pressaodiastolica;

	private int pressaosistolica;

	private float temperatura;
	
	private String comentario;
	
	private String comentarioAluno;
	
	private float nota;
	
	private String proxEncontro;


	//bi-directional many-to-one association to QueixaRespostaTerceira
	@OneToMany(mappedBy="respostaterceira")
	private Set<QueixaRespostaTerceira> queixarespostaterceiras;

	//bi-directional many-to-one association to Consulta
    @ManyToOne
	@JoinColumn(name="fkConsulta")
	private Consulta consulta;

    public RespostaTerceira() {
    }

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDataRealizacao() {
		return this.dataRealizacao;
	}

	public void setDataRealizacao(Date dataRealizacao) {
		this.dataRealizacao = dataRealizacao;
	}

	public String getFlCorreto() {
		return this.flCorreto;
	}

	public void setFlCorreto(String flCorreto) {
		this.flCorreto = flCorreto;
	}

	public float getPeso() {
		return this.peso;
	}

	public void setPeso(float peso) {
		this.peso = peso;
	}

	public int getPressaodiastolica() {
		return this.pressaodiastolica;
	}

	public void setPressaodiastolica(int pressaodiastolica) {
		this.pressaodiastolica = pressaodiastolica;
	}

	public int getPressaosistolica() {
		return this.pressaosistolica;
	}

	public void setPressaosistolica(int pressaosistolica) {
		this.pressaosistolica = pressaosistolica;
	}

	public float getTemperatura() {
		return this.temperatura;
	}

	public void setTemperatura(float temperatura) {
		this.temperatura = temperatura;
	}

	public Set<QueixaRespostaTerceira> getQueixarespostaterceiras() {
		return this.queixarespostaterceiras;
	}

	public void setQueixarespostaterceiras(Set<QueixaRespostaTerceira> queixarespostaterceiras) {
		this.queixarespostaterceiras = queixarespostaterceiras;
	}
	
	public Consulta getConsulta() {
		return this.consulta;
	}

	public void setConsulta(Consulta consulta) {
		this.consulta = consulta;
	}

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}

	public String getComentarioAluno() {
		return comentarioAluno;
	}

	public void setComentarioAluno(String comentarioAluno) {
		this.comentarioAluno = comentarioAluno;
	}

	public float getNota() {
		return nota;
	}

	public void setNota(float nota) {
		this.nota = nota;
	}

	public void setImc(float imc) {
		this.imc = imc;
	}

	public float getImc() {
		return imc;
	}

	public void setProxEncontro(String proxEncontro) {
		this.proxEncontro = proxEncontro;
	}

	public String getProxEncontro() {
		return proxEncontro;
	}
	
}