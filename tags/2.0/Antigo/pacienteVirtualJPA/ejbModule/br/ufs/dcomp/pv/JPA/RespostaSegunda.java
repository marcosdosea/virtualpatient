package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Date;


/**
 * The persistent class for the respostasegunda database table.
 * 
 */
@Entity
@Table(name="respostasegunda")
public class RespostaSegunda implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private Date dataRealizacao;

	private String flCorreto;

	private int numeroTentativa;
	
	private String comentario;
	
	private String comentarioAluno;
	
	private float nota;

	private String carta;

	//bi-directional many-to-one association to Consulta
    @ManyToOne
	@JoinColumn(name="fkConsulta")
	private Consulta consulta;

    public RespostaSegunda() {
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

	public int getNumeroTentativa() {
		return this.numeroTentativa;
	}

	public void setNumeroTentativa(int numeroTentativa) {
		this.numeroTentativa = numeroTentativa;
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

	public void setCarta(String carta) {
		this.carta = carta;
	}

	public String getCarta() {
		return carta;
	}
	
}