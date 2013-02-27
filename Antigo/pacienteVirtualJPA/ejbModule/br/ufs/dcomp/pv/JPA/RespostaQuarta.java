package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;

import java.sql.Date;
import java.util.Set;


/**
 * The persistent class for the respostaquarta database table.
 * 
 */
@Entity
@Table(name="respostaquarta")
public class RespostaQuarta implements Serializable {
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
	
	private String nomeDr;
	
	private String telefone;
	
	@Lob()
	private String motivosRefMedica;
	
	@Lob()
	private String alternativaRefMed1;
	
	@Lob()
	private String alternativaRefMed2;
	
	@Lob()
	private String referencias;
	
	private String farmacNome;
	
	private String farmacCrf;

	private String farmacTel;

	public String getNomeDr() {
		return nomeDr;
	}

	public void setNomeDr(String nomeDr) {
		this.nomeDr = nomeDr;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getMotivosRefMedica() {
		return motivosRefMedica;
	}

	public void setMotivosRefMedica(String motivosRefMedica) {
		this.motivosRefMedica = motivosRefMedica;
	}

	public String getAlternativaRefMed1() {
		return alternativaRefMed1;
	}

	public void setAlternativaRefMed1(String alternativaRefMed1) {
		this.alternativaRefMed1 = alternativaRefMed1;
	}

	public String getAlternativaRefMed2() {
		return alternativaRefMed2;
	}

	public void setAlternativaRefMed2(String alternativaRefMed2) {
		this.alternativaRefMed2 = alternativaRefMed2;
	}

	public String getReferencias() {
		return referencias;
	}

	public void setReferencias(String referencias) {
		this.referencias = referencias;
	}

	public String getFarmacNome() {
		return farmacNome;
	}

	public void setFarmacNome(String farmacNome) {
		this.farmacNome = farmacNome;
	}

	public String getFarmacCrf() {
		return farmacCrf;
	}

	public void setFarmacCrf(String farmacCrf) {
		this.farmacCrf = farmacCrf;
	}

	public String getFarmacTel() {
		return farmacTel;
	}

	public void setFarmacTel(String farmacTel) {
		this.farmacTel = farmacTel;
	}

	//bi-directional many-to-one association to Consulta
    @ManyToOne
	@JoinColumn(name="fkConsulta")
	private Consulta consulta;

    public RespostaQuarta() {
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