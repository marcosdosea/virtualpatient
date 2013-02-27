package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;

import java.util.Set;


/**
 * The persistent class for the consulta database table.
 * 
 */
@Entity
@Table(name="consulta")
public class Consulta implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name="fkAluno")
	private Aluno fkAluno;

	@ManyToOne
	@JoinColumn(name="fkCasoClinico")
	private CasoClinico fkCasoClinico;


    public Consulta() {
    }

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Aluno getFkAluno() {
		return fkAluno;
	}

	public void setFkAluno(Aluno fkAluno) {
		this.fkAluno = fkAluno;
	}

	public CasoClinico getFkCasoClinico() {
		return fkCasoClinico;
	}

	public void setFkCasoClinico(CasoClinico fkCasoClinico) {
		this.fkCasoClinico = fkCasoClinico;
	}

	
}