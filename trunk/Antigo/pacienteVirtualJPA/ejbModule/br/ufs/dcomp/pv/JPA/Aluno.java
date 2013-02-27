package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the aluno database table.
 * 
 */
@Entity
@Table(name="aluno")
public class Aluno implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String login;
	
	private String nome;

	private String anoInicioCurso;

	private String flCursouAssistenciaFarmaceutica;

	private String flCursouAtencaoFarmaceutica;

	private String flCursouDispencaoFarmaceutica;

	private String flCursouFarmaciaClinica;

	private String flCursouIntroducaoFarmacia;

	private String flCursouSemiologiaFarmaceutica;

	private String flCursouTopicosFarmaciaClinica;

	private String genero;

	private int idade;

	private String matricula;

	private int nrConsulta;
	
	private int nrTentativa;
	
	private char liberado;
	
	private String flAcessoCasa;
	private String flAcessoUniversidade;
	private String flAcessoCasaAmigo;
	private String flAcessoOutro;

		
	@OneToOne
	@JoinColumn(name="fkConsultaAtual")
	private Consulta consultaAtual;
	
	@ManyToOne
	@JoinColumn(name="fkTurma")
	private Turma turma;
	
    public Aluno() {
    }

	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getAnoInicioCurso() {
		return this.anoInicioCurso;
	}

	public void setAnoInicioCurso(String anoInicioCurso) {
		this.anoInicioCurso = anoInicioCurso;
	}

	public String getFlCursouAssistenciaFarmaceutica() {
		return this.flCursouAssistenciaFarmaceutica;
	}

	public void setFlCursouAssistenciaFarmaceutica(String flCursouAssistenciaFarmaceutica) {
		this.flCursouAssistenciaFarmaceutica = flCursouAssistenciaFarmaceutica;
	}

	public String getFlCursouAtencaoFarmaceutica() {
		return this.flCursouAtencaoFarmaceutica;
	}

	public void setFlCursouAtencaoFarmaceutica(String flCursouAtencaoFarmaceutica) {
		this.flCursouAtencaoFarmaceutica = flCursouAtencaoFarmaceutica;
	}

	public String getFlCursouDispencaoFarmaceutica() {
		return this.flCursouDispencaoFarmaceutica;
	}

	public void setFlCursouDispencaoFarmaceutica(String flCursouDispencaoFarmaceutica) {
		this.flCursouDispencaoFarmaceutica = flCursouDispencaoFarmaceutica;
	}

	public String getFlCursouFarmaciaClinica() {
		return this.flCursouFarmaciaClinica;
	}

	public void setFlCursouFarmaciaClinica(String flCursouFarmaciaClinica) {
		this.flCursouFarmaciaClinica = flCursouFarmaciaClinica;
	}

	public String getFlCursouIntroducaoFarmacia() {
		return this.flCursouIntroducaoFarmacia;
	}

	public void setFlCursouIntroducaoFarmacia(String flCursouIntroducaoFarmacia) {
		this.flCursouIntroducaoFarmacia = flCursouIntroducaoFarmacia;
	}

	public String getFlCursouSemiologiaFarmaceutica() {
		return this.flCursouSemiologiaFarmaceutica;
	}

	public void setFlCursouSemiologiaFarmaceutica(String flCursouSemiologiaFarmaceutica) {
		this.flCursouSemiologiaFarmaceutica = flCursouSemiologiaFarmaceutica;
	}

	public String getFlCursouTopicosFarmaciaClinica() {
		return this.flCursouTopicosFarmaciaClinica;
	}

	public void setFlCursouTopicosFarmaciaClinica(String flCursouTopicosFarmaciaClinica) {
		this.flCursouTopicosFarmaciaClinica = flCursouTopicosFarmaciaClinica;
	}

	public String getGenero() {
		return this.genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public int getIdade() {
		return this.idade;
	}

	public void setIdade(int idade) {
		this.idade = idade;
	}

	public String getMatricula() {
		return this.matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public void setTurma(Turma turma) {
		this.turma = turma;
	}

	public Turma getTurma() {
		return turma;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNome() {
		return nome;
	}

	public void setLiberado(char liberado) {
		this.liberado = liberado;
	}

	public char getLiberado() {
		return liberado;
	}

	public void setConsultaAtual(Consulta consultaAtual) {
		this.consultaAtual = consultaAtual;
	}

	public Consulta getConsultaAtual() {
		return consultaAtual;
	}

	public int getNrConsulta() {
		return nrConsulta;
	}

	public void setNrConsulta(int nrConsulta) {
		this.nrConsulta = nrConsulta;
	}

	public int getNrTentativa() {
		return nrTentativa;
	}

	public void setNrTentativa(int nrTentativa) {
		this.nrTentativa = nrTentativa;
	}

	public String getFlAcessoCasa() {
		return flAcessoCasa;
	}

	public void setFlAcessoCasa(String flAcessoCasa) {
		this.flAcessoCasa = flAcessoCasa;
	}

	public String getFlAcessoUniversidade() {
		return flAcessoUniversidade;
	}

	public void setFlAcessoUniversidade(String flAcessoUniversidade) {
		this.flAcessoUniversidade = flAcessoUniversidade;
	}

	public String getFlAcessoCasaAmigo() {
		return flAcessoCasaAmigo;
	}

	public void setFlAcessoCasaAmigo(String flAcessoCasaAmigo) {
		this.flAcessoCasaAmigo = flAcessoCasaAmigo;
	}

	public String getFlAcessoOutro() {
		return flAcessoOutro;
	}

	public void setFlAcessoOutro(String flAcessoOutro) {
		this.flAcessoOutro = flAcessoOutro;
	}

}