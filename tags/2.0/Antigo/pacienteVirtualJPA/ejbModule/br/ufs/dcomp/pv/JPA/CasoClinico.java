package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;

import java.util.Date;
import java.util.Map;


/**
 * The persistent class for the casoclinico database table.
 * 
 */
@Entity
@Table(name="casoclinico")
public class CasoClinico implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private float altura;
	
	private String alergias;

    @Temporal( TemporalType.TIMESTAMP)
	private Date dataNascimento;

	private String disponibilidade;

	private String escolaridade;
	
	private String idioma;
	
	private String historiaMedicaPregressa;
	
	private String historiafamiliar;

	private String flBebeAlcool;

	private String flBebeCafe;

	private String flFuma;

	private String genero;
	
	private String historiaAlcoolAnterior;
	
	private String historiaAlcoolAtual;
	
	private String historiaCafeAnterior;
	
	private String historiaCafeAtual;
	
	private String historiaTabacoAnterior;
	
	private String historiaTabacoAtual;

	private String medicosQueAtendem;

	private String moradiaFamilia;

	private String nome;

	private String ocupacao;

	private float peso;

	private float peso2;
	
	private String planoDeSaude;

	private int pressaoDiastolica;

	private int pressaoSistolica;
	
	private int pressaoDiastolica2;

	private int pressaoSistolica2;
	
	private String fotoFileName;

    @Lob()
	private String relatoDeCasoPrimeiraConsulta;
    
    @Lob()
	private String relatoDeCasoSegundaConsulta;

    @Lob()
	private String relatoDeCasoTerceiraConsulta;
    
    @Lob()
	private String relatoDeCasoQuartaConsulta;
    
    @Lob()
    private String proxEncontro;
    
	private String necessidadeAtencao1;
	
	private String necessidadeAtencao2;
	
	private String necessidadeAtencao3;
	
	private String necessidadeAtencao4;
	
	private String necessidadeAtencao5;

	private String tipoBebidaAlcoolica;
    
    private float temperatura;
	
	private float temperatura2;
	
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

	@ManyToOne
	@JoinColumn(name="fkTutor")
	private Tutor tutor;

    public CasoClinico() {
    }

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getAltura() {
		return this.altura;
	}

	public void setAltura(float altura) {
		this.altura = altura;
	}

	public void setAlergias(String alergias) {
		this.alergias = alergias;
	}

	public String getAlergias() {
		return alergias;
	}

	public Date getDataNascimento() {
		return this.dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getDisponibilidade() {
		return this.disponibilidade;
	}

	public void setDisponibilidade(String disponibilidade) {
		this.disponibilidade = disponibilidade;
	}

	public String getEscolaridade() {
		return this.escolaridade;
	}

	public void setEscolaridade(String escolaridade2) {
		this.escolaridade = escolaridade2;
	}

	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}

	public String getIdioma() {
		return idioma;
	}

	public String getFlBebeAlcool() {
		return this.flBebeAlcool;
	}

	public void setFlBebeAlcool(String flBebeAlcool) {
		this.flBebeAlcool = flBebeAlcool;
	}

	public String getFlBebeCafe() {
		return this.flBebeCafe;
	}

	public void setFlBebeCafe(String flBebeCafe) {
		this.flBebeCafe = flBebeCafe;
	}

	public String getFlFuma() {
		return this.flFuma;
	}

	public void setFlFuma(String flFuma) {
		this.flFuma = flFuma;
	}

	public String getGenero() {
		return this.genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getHistoriaAlcoolAnterior() {
		return historiaAlcoolAnterior;
	}

	public void setHistoriaAlcoolAnterior(String historiaAlcoolAnterior) {
		this.historiaAlcoolAnterior = historiaAlcoolAnterior;
	}

	public String getHistoriaAlcoolAtual() {
		return historiaAlcoolAtual;
	}

	public void setHistoriaAlcoolAtual(String historiaAlcoolAtual) {
		this.historiaAlcoolAtual = historiaAlcoolAtual;
	}

	public String getHistoriaCafeAnterior() {
		return historiaCafeAnterior;
	}

	public void setHistoriaCafeAnterior(String historiaCafeAnterior) {
		this.historiaCafeAnterior = historiaCafeAnterior;
	}

	public String getHistoriaCafeAtual() {
		return historiaCafeAtual;
	}

	public void setHistoriaCafeAtual(String historiaCafeAtual) {
		this.historiaCafeAtual = historiaCafeAtual;
	}

	public String getHistoriaTabacoAnterior() {
		return historiaTabacoAnterior;
	}

	public void setHistoriaTabacoAnterior(String historiaTabacoAnterior) {
		this.historiaTabacoAnterior = historiaTabacoAnterior;
	}

	public String getHistoriaTabacoAtual() {
		return historiaTabacoAtual;
	}

	public void setHistoriaTabacoAtual(String historiaTabacoAtual) {
		this.historiaTabacoAtual = historiaTabacoAtual;
	}

	public String getTipoBebidaAlcoolica() {
		return tipoBebidaAlcoolica;
	}

	public void setTipoBebidaAlcoolica(String tipoBebidaAlcoolica) {
		this.tipoBebidaAlcoolica = tipoBebidaAlcoolica;
	}

	public String getMedicosQueAtendem() {
		return this.medicosQueAtendem;
	}

	public void setMedicosQueAtendem(String medicosQueAtendem) {
		this.medicosQueAtendem = medicosQueAtendem;
	}

	public String getMoradiaFamilia() {
		return this.moradiaFamilia;
	}

	public void setMoradiaFamilia(String moradiaFamilia) {
		this.moradiaFamilia = moradiaFamilia;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getOcupacao() {
		return this.ocupacao;
	}

	public void setOcupacao(String ocupacao) {
		this.ocupacao = ocupacao;
	}

	public float getPeso() {
		return this.peso;
	}

	public void setPeso(float peso) {
		this.peso = peso;
	}

	public String getPlanoDeSaude() {
		return this.planoDeSaude;
	}

	public void setPlanoDeSaude(String planoDeSaude) {
		this.planoDeSaude = planoDeSaude;
	}

	public int getPressaoDiastolica() {
		return this.pressaoDiastolica;
	}

	public void setPressaoDiastolica(int pressaoDiastolica) {
		this.pressaoDiastolica = pressaoDiastolica;
	}

	public int getPressaoSistolica() {
		return this.pressaoSistolica;
	}

	public void setPressaoSistolica(int pressaoSistolica) {
		this.pressaoSistolica = pressaoSistolica;
	}

	public String getRelatoDeCasoPrimeiraConsulta() {
		return this.relatoDeCasoPrimeiraConsulta;
	}

	public void setRelatoDeCasoPrimeiraConsulta(String relatoDeCasoPrimeiraConsulta) {
		this.relatoDeCasoPrimeiraConsulta = relatoDeCasoPrimeiraConsulta;
	}

	public String getRelatoDeCasoTerceiraConsulta() {
		return this.relatoDeCasoTerceiraConsulta;
	}

	public void setRelatoDeCasoTerceiraConsulta(String relatoDeCasoTerceiraConsulta) {
		this.relatoDeCasoTerceiraConsulta = relatoDeCasoTerceiraConsulta;
	}

	public float getTemperatura() {
		return this.temperatura;
	}

	public void setTemperatura(float temperatura) {
		this.temperatura = temperatura;
	}

	public float getPeso2() {
		return peso2;
	}

	public void setPeso2(float peso2) {
		this.peso2 = peso2;
	}

	public int getPressaoDiastolica2() {
		return pressaoDiastolica2;
	}

	public void setPressaoDiastolica2(int pressaoDiastolica2) {
		this.pressaoDiastolica2 = pressaoDiastolica2;
	}

	public int getPressaoSistolica2() {
		return pressaoSistolica2;
	}

	public void setPressaoSistolica2(int pressaoSistolica2) {
		this.pressaoSistolica2 = pressaoSistolica2;
	}

	public float getTemperatura2() {
		return temperatura2;
	}

	public void setTemperatura2(float temperatura2) {
		this.temperatura2 = temperatura2;
	}

	public void setTutor(Tutor tutor) {
		this.tutor = tutor;
	}

	public Tutor getTutor() {
		return tutor;
	}

	public void setNecessidadeAtencao1(String necessidadeAtencao1) {
		this.necessidadeAtencao1 = necessidadeAtencao1;
	}

	public String getNecessidadeAtencao1() {
		return necessidadeAtencao1;
	}

	public void setNecessidadeAtencao2(String necessidadeAtencao2) {
		this.necessidadeAtencao2 = necessidadeAtencao2;
	}

	public String getNecessidadeAtencao2() {
		return necessidadeAtencao2;
	}

	public void setNecessidadeAtencao3(String necessidadeAtencao3) {
		this.necessidadeAtencao3 = necessidadeAtencao3;
	}

	public String getNecessidadeAtencao3() {
		return necessidadeAtencao3;
	}

	public void setNecessidadeAtencao4(String necessidadeAtencao4) {
		this.necessidadeAtencao4 = necessidadeAtencao4;
	}

	public String getNecessidadeAtencao4() {
		return necessidadeAtencao4;
	}

	public void setNecessidadeAtencao5(String necessidadeAtencao5) {
		this.necessidadeAtencao5 = necessidadeAtencao5;
	}

	public String getNecessidadeAtencao5() {
		return necessidadeAtencao5;
	}

	public void setHistoriaMedicaPregressa(String historiaMedicaPregressa) {
		this.historiaMedicaPregressa = historiaMedicaPregressa;
	}

	public String getHistoriaMedicaPregressa() {
		return historiaMedicaPregressa;
	}

	public void setHistoriafamiliar(String historiafamiliar) {
		this.historiafamiliar = historiafamiliar;
	}

	public String getHistoriafamiliar() {
		return historiafamiliar;
	}

	public void setRelatoDeCasoSegundaConsulta(
			String relatoDeCasoSegundaConsulta) {
		this.relatoDeCasoSegundaConsulta = relatoDeCasoSegundaConsulta;
	}

	public String getRelatoDeCasoSegundaConsulta() {
		return relatoDeCasoSegundaConsulta;
	}

	public void setProxEncontro(String proxEncontro) {
		this.proxEncontro = proxEncontro;
	}

	public String getProxEncontro() {
		return proxEncontro;
	}
	
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

	public void setRelatoDeCasoQuartaConsulta(String relatoDeCasoQuartaConsulta) {
		this.relatoDeCasoQuartaConsulta = relatoDeCasoQuartaConsulta;
	}

	public String getRelatoDeCasoQuartaConsulta() {
		return relatoDeCasoQuartaConsulta;
	}

	public void setFotoFileName(String fotoFileName) {
		this.fotoFileName = fotoFileName;
	}

	public String getFotoFileName() {
		return fotoFileName;
	}

}