package br.ufs.dcomp.pv.web;

import br.ufs.dcomp.pv.JPA.Usuario;
import br.ufs.dcomp.pv.JPA.UsuarioDAO;

public class AlunoAux {

	private String login;
	private String nome;
	private String matricula;
	private int turma;
	
	
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getMatricula() {
		return matricula;
	}
	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}
	public int getTurma() {
		return turma;
	}
	public void setTurma(int turma) {
		this.turma = turma;
	}
	
}
