package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the turma database table.
 * 
 */
@Entity
@Table(name="turma")
public class Turma implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String codigo;
	
	private String periodo;
	
	private String nmDisciplina;

    @ManyToOne
	@JoinColumn(name="fktutor")
	private Tutor tutor;

    public Turma() {
    }

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCodigo() {
		return this.codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public Tutor getTutor() {
		return this.tutor;
	}

	public void setTutor(Tutor fktutor) {
		this.tutor = fktutor;
	}

	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

	public String getPeriodo() {
		return periodo;
	}

	public void setNmDisciplina(String nmDisciplina) {
		this.nmDisciplina = nmDisciplina;
	}

	public String getNmDisciplina() {
		return nmDisciplina;
	}

}