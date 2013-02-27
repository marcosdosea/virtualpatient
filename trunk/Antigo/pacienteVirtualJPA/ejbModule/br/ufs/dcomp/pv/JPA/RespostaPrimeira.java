package br.ufs.dcomp.pv.JPA;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Date;
import java.util.Set;


/**
 * The persistent class for the respostaprimeira database table.
 * 
 */
@Entity
@Table(name="respostaprimeira")
public class RespostaPrimeira implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String alergias;

	private float altura;

	private Date dataDeRealizacao;

	private Date dataNascimento;

	private String escolaridade;

	private String flAlturaCerta;

	private String flBebeAlcool;

	private String flBebeAlcoolCerto;

	private String flBebeCafe;

	private String flBebeCafeCerto;

	private String flCorreto;

	private String flDataNascimentoCerta;

	private String flEscolaridadeCerta;

	private String flFuma;

	private String flFumaCerto;

	private String flGeneroCerto;

	private String flIMCCerto;

	private String flNomeCerto;

	private String flOcupacaoCerta;

	private String flPesoCerto;

	private String flPressaoDiastolicaCerta;

	private String flPressaoSistolicaCerta;

	private String flTemperaturaCerta;

	private String genero;

	@Column(name="IMC")
	private float imc;

	private String medicosQueAtendem;

	private String moradiaFamilia;

	private String nome;

	private int numeroTentativa;

	private String ocupacao;

	private float peso;

	private String planoDeSaude;

	private int pressaoDiastolica;

	private int pressaoSistolica;

	private float temperatura;
	
	private String comentario;
	
	private String comentarioAluno;
	
	private float nota;
	
	private String historiaAlcoolAnterior;
	
	private String historiaAlcoolAtual;
	
	private String historiaCafeAnterior;
	
	private String historiaCafeAtual;
	
	private String historiaTabacoAnterior;
	
	private String historiaTabacoAtual;

	private String tipoBebidaAlcoolica;
	
	private String razaoEncontro;
	
	private String experienciaMedicamentos1;
	
	private String experienciaMedicamentos2;
	
	private String experienciaMedicamentos3;
	
	private String experienciaMedicamentos4;
	
	private String experienciaMedicamentos5;
	
	private String necessidadeAtencao1;
	
	private String necessidadeAtencao2;
	
	private String necessidadeAtencao3;
	
	private String necessidadeAtencao4;
	
	private String necessidadeAtencao5;
	
	private String conclusao;
	
	private String historiaMedicaPregressa;
	
	private String historiafamiliar;
	
	private String outroRazaoEncontroTxt;
	
	public String getOutroRazaoEncontroTxt() {
		return outroRazaoEncontroTxt;
	}

	public void setOutroRazaoEncontroTxt(String outroRazaoEncontroTxt) {
		this.outroRazaoEncontroTxt = outroRazaoEncontroTxt;
	}

	public String getOutroExpMed1Txt() {
		return outroExpMed1Txt;
	}

	public void setOutroExpMed1Txt(String outroExpMed1Txt) {
		this.outroExpMed1Txt = outroExpMed1Txt;
	}

	public String getOutroExpMed2Txt() {
		return outroExpMed2Txt;
	}

	public void setOutroExpMed2Txt(String outroExpMed2Txt) {
		this.outroExpMed2Txt = outroExpMed2Txt;
	}

	public String getOutroExpMed3Txt() {
		return outroExpMed3Txt;
	}

	public void setOutroExpMed3Txt(String outroExpMed3Txt) {
		this.outroExpMed3Txt = outroExpMed3Txt;
	}

	public String getOutroExpMed4Txt() {
		return outroExpMed4Txt;
	}

	public void setOutroExpMed4Txt(String outroExpMed4Txt) {
		this.outroExpMed4Txt = outroExpMed4Txt;
	}

	public String getOutroExpMed5Txt() {
		return outroExpMed5Txt;
	}

	public void setOutroExpMed5Txt(String outroExpMed5Txt) {
		this.outroExpMed5Txt = outroExpMed5Txt;
	}

	public String getOutroExpMedConcTxt() {
		return outroExpMedConcTxt;
	}

	public void setOutroExpMedConcTxt(String outroExpMedConcTxt) {
		this.outroExpMedConcTxt = outroExpMedConcTxt;
	}

	private String outroExpMed1Txt;

	private String outroExpMed2Txt;
	
	private String outroExpMed3Txt;

	private String outroExpMed4Txt;
	
	private String outroExpMed5Txt;
	
	private String outroExpMedConcTxt;
	
	public String getRazaoEncontro() {
		return razaoEncontro;
	}

	public void setRazaoEncontro(String razaoEncontro) {
		this.razaoEncontro = razaoEncontro;
	}

	public String getExperienciaMedicamentos1() {
		return experienciaMedicamentos1;
	}

	public void setExperienciaMedicamentos1(String experienciaMedicamentos1) {
		this.experienciaMedicamentos1 = experienciaMedicamentos1;
	}

	public String getExperienciaMedicamentos2() {
		return experienciaMedicamentos2;
	}

	public void setExperienciaMedicamentos2(String experienciaMedicamentos2) {
		this.experienciaMedicamentos2 = experienciaMedicamentos2;
	}

	public String getExperienciaMedicamentos3() {
		return experienciaMedicamentos3;
	}

	public void setExperienciaMedicamentos3(String experienciaMedicamentos3) {
		this.experienciaMedicamentos3 = experienciaMedicamentos3;
	}

	public String getExperienciaMedicamentos4() {
		return experienciaMedicamentos4;
	}

	public void setExperienciaMedicamentos4(String experienciaMedicamentos4) {
		this.experienciaMedicamentos4 = experienciaMedicamentos4;
	}

	public String getExperienciaMedicamentos5() {
		return experienciaMedicamentos5;
	}

	public void setExperienciaMedicamentos5(String experienciaMedicamentos5) {
		this.experienciaMedicamentos5 = experienciaMedicamentos5;
	}

	public String getNecessidadeAtencao1() {
		return necessidadeAtencao1;
	}

	public void setNecessidadeAtencao1(String necessidadeAtencao1) {
		this.necessidadeAtencao1 = necessidadeAtencao1;
	}

	public String getNecessidadeAtencao2() {
		return necessidadeAtencao2;
	}

	public void setNecessidadeAtencao2(String necessidadeAtencao2) {
		this.necessidadeAtencao2 = necessidadeAtencao2;
	}

	public String getNecessidadeAtencao3() {
		return necessidadeAtencao3;
	}

	public void setNecessidadeAtencao3(String necessidadeAtencao3) {
		this.necessidadeAtencao3 = necessidadeAtencao3;
	}

	public String getNecessidadeAtencao4() {
		return necessidadeAtencao4;
	}

	public void setNecessidadeAtencao4(String necessidadeAtencao4) {
		this.necessidadeAtencao4 = necessidadeAtencao4;
	}

	public String getNecessidadeAtencao5() {
		return necessidadeAtencao5;
	}

	public void setNecessidadeAtencao5(String necessidadeAtencao5) {
		this.necessidadeAtencao5 = necessidadeAtencao5;
	}

	public String getConclusao() {
		return conclusao;
	}

	public void setConclusao(String conclusao) {
		this.conclusao = conclusao;
	}

	//bi-directional many-to-one association to QueixaRespostaPrimeira
	@OneToMany(mappedBy="respostaprimeira")
	private Set<QueixaRespostaPrimeira> queixarespostaprimeiras;

	//bi-directional many-to-one association to Consulta
    @ManyToOne
	@JoinColumn(name="fkConsulta")
	private Consulta consulta;

    public RespostaPrimeira() {
    }

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAlergias() {
		return this.alergias;
	}

	public void setAlergias(String alergias) {
		this.alergias = alergias;
	}

	public float getAltura() {
		return this.altura;
	}

	public void setAltura(float altura) {
		this.altura = altura;
	}

	public Date getDataDeRealizacao() {
		return this.dataDeRealizacao;
	}

	public void setDataDeRealizacao(Date dataDeRealizacao) {
		this.dataDeRealizacao = dataDeRealizacao;
	}

	public Date getDataNascimento() {
		return this.dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getEscolaridade() {
		return this.escolaridade;
	}

	public void setEscolaridade(String escolaridade) {
		this.escolaridade = escolaridade;
	}

	public String getFlAlturaCerta() {
		return this.flAlturaCerta;
	}

	public void setFlAlturaCerta(String flAlturaCerta) {
		this.flAlturaCerta = flAlturaCerta;
	}

	public String getFlBebeAlcool() {
		return this.flBebeAlcool;
	}

	public void setFlBebeAlcool(String flBebeAlcool) {
		this.flBebeAlcool = flBebeAlcool;
	}

	public String getFlBebeAlcoolCerto() {
		return this.flBebeAlcoolCerto;
	}

	public void setFlBebeAlcoolCerto(String flBebeAlcoolCerto) {
		this.flBebeAlcoolCerto = flBebeAlcoolCerto;
	}

	public String getFlBebeCafe() {
		return this.flBebeCafe;
	}

	public void setFlBebeCafe(String flBebeCafe) {
		this.flBebeCafe = flBebeCafe;
	}

	public String getFlBebeCafeCerto() {
		return this.flBebeCafeCerto;
	}

	public void setFlBebeCafeCerto(String flBebeCafeCerto) {
		this.flBebeCafeCerto = flBebeCafeCerto;
	}

	public String getFlCorreto() {
		return this.flCorreto;
	}

	public void setFlCorreto(String flCorreto) {
		this.flCorreto = flCorreto;
	}

	public String getFlDataNascimentoCerta() {
		return this.flDataNascimentoCerta;
	}

	public void setFlDataNascimentoCerta(String flDataNascimentoCerta) {
		this.flDataNascimentoCerta = flDataNascimentoCerta;
	}

	public String getFlEscolaridadeCerta() {
		return this.flEscolaridadeCerta;
	}

	public void setFlEscolaridadeCerta(String flEscolaridadeCerta) {
		this.flEscolaridadeCerta = flEscolaridadeCerta;
	}

	public String getFlFuma() {
		return this.flFuma;
	}

	public void setFlFuma(String flFuma) {
		this.flFuma = flFuma;
	}

	public String getFlFumaCerto() {
		return this.flFumaCerto;
	}

	public void setFlFumaCerto(String flFumaCerto) {
		this.flFumaCerto = flFumaCerto;
	}

	public String getFlGeneroCerto() {
		return this.flGeneroCerto;
	}

	public void setFlGeneroCerto(String flGeneroCerto) {
		this.flGeneroCerto = flGeneroCerto;
	}

	public String getFlIMCCerto() {
		return this.flIMCCerto;
	}

	public void setFlIMCCerto(String flIMCCerto) {
		this.flIMCCerto = flIMCCerto;
	}

	public String getFlNomeCerto() {
		return this.flNomeCerto;
	}

	public void setFlNomeCerto(String flNomeCerto) {
		this.flNomeCerto = flNomeCerto;
	}

	public String getFlOcupacaoCerta() {
		return this.flOcupacaoCerta;
	}

	public void setFlOcupacaoCerta(String flOcupacaoCerta) {
		this.flOcupacaoCerta = flOcupacaoCerta;
	}

	public String getFlPesoCerto() {
		return this.flPesoCerto;
	}

	public void setFlPesoCerto(String flPesoCerto) {
		this.flPesoCerto = flPesoCerto;
	}

	public String getFlPressaoDiastolicaCerta() {
		return this.flPressaoDiastolicaCerta;
	}

	public void setFlPressaoDiastolicaCerta(String flPressaoDiastolicaCerta) {
		this.flPressaoDiastolicaCerta = flPressaoDiastolicaCerta;
	}

	public String getFlPressaoSistolicaCerta() {
		return this.flPressaoSistolicaCerta;
	}

	public void setFlPressaoSistolicaCerta(String flPressaoSistolicaCerta) {
		this.flPressaoSistolicaCerta = flPressaoSistolicaCerta;
	}

	public String getFlTemperaturaCerta() {
		return this.flTemperaturaCerta;
	}

	public void setFlTemperaturaCerta(String flTemperaturaCerta) {
		this.flTemperaturaCerta = flTemperaturaCerta;
	}

	public String getGenero() {
		return this.genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public float getImc() {
		return this.imc;
	}

	public void setImc(float imc) {
		this.imc = imc;
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

	public int getNumeroTentativa() {
		return this.numeroTentativa;
	}

	public void setNumeroTentativa(int numeroTentativa) {
		this.numeroTentativa = numeroTentativa;
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

	public float getTemperatura() {
		return this.temperatura;
	}

	public void setTemperatura(float temperatura) {
		this.temperatura = temperatura;
	}

	public Set<QueixaRespostaPrimeira> getQueixarespostaprimeiras() {
		return this.queixarespostaprimeiras;
	}

	public void setQueixarespostaprimeiras(Set<QueixaRespostaPrimeira> queixarespostaprimeiras) {
		this.queixarespostaprimeiras = queixarespostaprimeiras;
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
}