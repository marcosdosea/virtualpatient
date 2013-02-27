package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the tbtutor database table.
 * 
 */
@Entity
@Table(name="tutor")
public class Tutor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String login;
	
	private String nome;

	//uni-directional one-to-one association to Usuario
	@OneToOne
	@JoinColumn(name="login")
	private Usuario tbusuario;

    public Tutor() {
    }

	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public Usuario getTbusuario() {
		return this.tbusuario;
	}

	public void setTbusuario(Usuario tbusuario) {
		this.tbusuario = tbusuario;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNome() {
		return nome;
	}
	
}