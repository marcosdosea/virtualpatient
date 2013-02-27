package br.ufs.dcomp.pv.web;

import java.util.Date;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import br.ufs.dcomp.pv.JPA.Aluno;
import br.ufs.dcomp.pv.JPA.AlunoDAO;
import br.ufs.dcomp.pv.JPA.CasoClinico;
import br.ufs.dcomp.pv.JPA.CasoClinicoDAO;
import br.ufs.dcomp.pv.JPA.Consulta;
import br.ufs.dcomp.pv.JPA.ConsultaDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoAnterior;
import br.ufs.dcomp.pv.JPA.MedicamentoNaoPrescrito;
import br.ufs.dcomp.pv.JPA.MedicamentoPrescrito;
import br.ufs.dcomp.pv.JPA.ParametroClinico;
import br.ufs.dcomp.pv.JPA.QueixaRespostaPrimeira;
import br.ufs.dcomp.pv.JPA.QueixaRespostaPrimeiraDAO;
import br.ufs.dcomp.pv.JPA.RespostaPrimeira;
import br.ufs.dcomp.pv.JPA.RespostaPrimeiraDAO;

public class RespostaDoAlunoBean {
	
	ArrayList<CasoClinico> listaDeCasos = new ArrayList<CasoClinico>();
	
	ArrayList<CasoClinico> listaCasosByIdioma = new ArrayList<CasoClinico>();

	CasoClinico casoEscolhido = new CasoClinico();
	
	private int id;

	private float altura;

	private Date dataDeRealizacao;

	private Date dataNascimento;
	
	private String dataNascimentoAux;

	private String escolaridade;

	private String flAlturaCerta;

	private String flBebeAlcool;

	private String flBebeAlcoolCerto;

	private String flBebeCafe;

	private String flBebeCafeCerto;

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

	private String genero;

	private float imc;

	private String nome;

	private String ocupacao;

	private float peso;

	private int pressaoDiastolica;

	private int pressaoSistolica;
	
	private float temperatura;
	
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
	
	private String pesoString ;
	private String temperaturaString;
	private String pressaoDiastolicaString;
	private String pressaoSistolicaString;
	private String imcString;
	private String alturaString;
	
	private String alergias;
	
	private String medicosQueAtendem;
	
	private String moradiaFamilia;
	
	private String planoDeSaude;
	
	private RespostaPrimeira respostaAnterior;
	
	private String historiaAlcoolAnterior;
	
	private String historiaAlcoolAtual;
	
	private String historiaCafeAnterior;
	
	private String historiaCafeAtual;
	
	private String historiaTabacoAnterior;
	
	private String historiaTabacoAtual;
	
	private String tipoBebidaAlcoolica;
	
	private String historiaMedicaPregressa;
	
	private String historiafamiliar;
	
	private boolean outroRazaoEncontroCb;	
	private String outroRazaoEncontroTxt;	
	
	private boolean outroExpMed1Cb;
	private String outroExpMed1Txt;
	
	private boolean outroExpMed2Cb;
	private String outroExpMed2Txt;
	
	private boolean outroExpMed3Cb;
	private String outroExpMed3Txt;
	
	private boolean outroExpMed4Cb;
	private String outroExpMed4Txt;
	
	private boolean outroExpMed5Cb;
	private String outroExpMed5Txt;
		
	public boolean isOutroRazaoEncontroCb() {
		return outroRazaoEncontroCb;
	}

	public void setOutroRazaoEncontroCb(boolean outroRazaoEncontroCb) {
		this.outroRazaoEncontroCb = outroRazaoEncontroCb;
	}

	public String getOutroRazaoEncontroTxt() {
		return outroRazaoEncontroTxt;
	}

	public void setOutroRazaoEncontroTxt(String outroRazaoEncontroTxt) {
		this.outroRazaoEncontroTxt = outroRazaoEncontroTxt;
	}

	public boolean isOutroExpMed1Cb() {
		return outroExpMed1Cb;
	}

	public void setOutroExpMed1Cb(boolean outroExpMed1Cb) {
		this.outroExpMed1Cb = outroExpMed1Cb;
	}

	public String getOutroExpMed1Txt() {
		return outroExpMed1Txt;
	}

	public void setOutroExpMed1Txt(String outroExpMed1Txt) {
		this.outroExpMed1Txt = outroExpMed1Txt;
	}

	public boolean isOutroExpMed2Cb() {
		return outroExpMed2Cb;
	}

	public void setOutroExpMed2Cb(boolean outroExpMed2Cb) {
		this.outroExpMed2Cb = outroExpMed2Cb;
	}

	public String getOutroExpMed2Txt() {
		return outroExpMed2Txt;
	}

	public void setOutroExpMed2Txt(String outroExpMed2Txt) {
		this.outroExpMed2Txt = outroExpMed2Txt;
	}

	public boolean isOutroExpMed3Cb() {
		return outroExpMed3Cb;
	}

	public void setOutroExpMed3Cb(boolean outroExpMed3Cb) {
		this.outroExpMed3Cb = outroExpMed3Cb;
	}

	public String getOutroExpMed3Txt() {
		return outroExpMed3Txt;
	}

	public void setOutroExpMed3Txt(String outroExpMed3Txt) {
		this.outroExpMed3Txt = outroExpMed3Txt;
	}

	public boolean isOutroExpMed4Cb() {
		return outroExpMed4Cb;
	}

	public void setOutroExpMed4Cb(boolean outroExpMed4Cb) {
		this.outroExpMed4Cb = outroExpMed4Cb;
	}

	public String getOutroExpMed4Txt() {
		return outroExpMed4Txt;
	}

	public void setOutroExpMed4Txt(String outroExpMed4Txt) {
		this.outroExpMed4Txt = outroExpMed4Txt;
	}

	public boolean isOutroExpMed5Cb() {
		return outroExpMed5Cb;
	}

	public void setOutroExpMed5Cb(boolean outroExpMed5Cb) {
		this.outroExpMed5Cb = outroExpMed5Cb;
	}

	public String getOutroExpMed5Txt() {
		return outroExpMed5Txt;
	}

	public void setOutroExpMed5Txt(String outroExpMed5Txt) {
		this.outroExpMed5Txt = outroExpMed5Txt;
	}

	public boolean isOutroExpMedConcCb() {
		return outroExpMedConcCb;
	}

	public void setOutroExpMedConcCb(boolean outroExpMedConcCb) {
		this.outroExpMedConcCb = outroExpMedConcCb;
	}

	public String getOutroExpMedConcTxt() {
		return outroExpMedConcTxt;
	}

	public void setOutroExpMedConcTxt(String outroExpMedConcTxt) {
		this.outroExpMedConcTxt = outroExpMedConcTxt;
	}

	private boolean outroExpMedConcCb;
	private String outroExpMedConcTxt;
	
	//variáveis necessárias para o cadastro de queixas
	private boolean ativoSGeral1;
	private boolean ativoSGeral2;
	private boolean ativoSGeral3;
	private boolean ativoSGeral4;
	private boolean ativoSGeral5;
	private boolean ativoOONB1;
	private boolean ativoOONB2;
	private boolean ativoOONB3;
	private boolean ativoOONB4;
	private boolean ativoOONB5;
	private boolean ativoOONB6;
	private boolean ativoOONB7;
	private boolean ativoCardio1;
	private boolean ativoCardio2;
	private boolean ativoCardio3;
	private boolean ativoCardio4;
	private boolean ativoPulm1;
	private boolean ativoPulm2;
	private boolean ativoPulm3;
	private boolean ativoTGI1;
	private boolean ativoTGI2;
	private boolean ativoTGI3;
	private boolean ativoTGI4;
	private boolean ativoTGI5;
	private boolean ativoSEndoc1;
	private boolean ativoSEndoc2;
	private boolean ativoSEndoc3;
	private boolean ativoSUrin1;
	private boolean ativoSGenitRepr1;
	private boolean ativoSGenitRepr2;
	private boolean ativoSGenitRepr3;
	private boolean ativoSGenitRepr4;
	private boolean ativoSGenitRepr5;
	private boolean ativoSHematop1;
	private boolean ativoSHematop2;
	private boolean ativoSHematop3;
	private boolean ativoMuscEsq1;
	private boolean ativoMuscEsq2;
	private boolean ativoMuscEsq3;
	private boolean ativoMuscEsq4;
	private boolean ativoSNervoso1;
	private boolean ativoSNervoso2;
	private boolean ativoSNervoso3;
	private boolean ativoSNervoso4;
	private boolean ativoSNervoso5;
	private boolean ativoSNervoso6;
	private boolean ativoSNervoso7;
	private boolean ativoPele1;
	private boolean ativoPele2;
	private boolean ativoPele3;
	private boolean ativoDoencInfec1;
	private boolean ativoDoencInfec2;
	private boolean ativoDoencInfec3;
	private boolean ativoDoencInfec4;
	private boolean ativoDoencInfec5;
	
	private String doencaOuPRMSGeral1;
	private String doencaOuPRMSGeral2;
	private String doencaOuPRMSGeral3;
	private String doencaOuPRMSGeral4;
	private String doencaOuPRMSGeral5;
	private String doencaOuPRMOONB1;
	private String doencaOuPRMOONB2;
	private String doencaOuPRMOONB3;
	private String doencaOuPRMOONB4;
	private String doencaOuPRMOONB5;
	private String doencaOuPRMOONB6;
	private String doencaOuPRMOONB7;
	private String doencaOuPRMCardio1;
	private String doencaOuPRMCardio2;
	private String doencaOuPRMCardio3;
	private String doencaOuPRMCardio4;
	private String doencaOuPRMPulm1;
	private String doencaOuPRMPulm2;
	private String doencaOuPRMPulm3;
	private String doencaOuPRMTGI1;
	private String doencaOuPRMTGI2;
	private String doencaOuPRMTGI3;
	private String doencaOuPRMTGI4;
	private String doencaOuPRMTGI5;
	private String doencaOuPRMSEndoc1;
	private String doencaOuPRMSEndoc2;
	private String doencaOuPRMSEndoc3;
	private String doencaOuPRMSUrin1;
	private String doencaOuPRMSGenitRepr1;
	private String doencaOuPRMSGenitRepr2;
	private String doencaOuPRMSGenitRepr3;
	private String doencaOuPRMSGenitRepr4;
	private String doencaOuPRMSGenitRepr5;
	private String doencaOuPRMSHematop1;
	private String doencaOuPRMSHematop2;
	private String doencaOuPRMSHematop3;
	private String doencaOuPRMMuscEsq1;
	private String doencaOuPRMMuscEsq2;
	private String doencaOuPRMMuscEsq3;
	private String doencaOuPRMMuscEsq4;
	private String doencaOuPRMSNervoso1;
	private String doencaOuPRMSNervoso2;
	private String doencaOuPRMSNervoso3;
	private String doencaOuPRMSNervoso4;
	private String doencaOuPRMSNervoso5;
	private String doencaOuPRMSNervoso6;
	private String doencaOuPRMSNervoso7;
	private String doencaOuPRMPele1;
	private String doencaOuPRMPele2;
	private String doencaOuPRMPele3;
	private String doencaOuPRMDoencInfec1;
	private String doencaOuPRMDoencInfec2;
	private String doencaOuPRMDoencInfec3;
	private String doencaOuPRMDoencInfec4;
	private String doencaOuPRMDoencInfec5;
	
	private Integer nPRMSGeral1;
	private Integer nPRMSGeral2;
	private Integer nPRMSGeral3;
	private Integer nPRMSGeral4;
	private Integer nPRMSGeral5;
	private Integer nPRMOONB1;
	private Integer nPRMOONB2;
	private Integer nPRMOONB3;
	private Integer nPRMOONB4;
	private Integer nPRMOONB5;
	private Integer nPRMOONB6;
	private Integer nPRMOONB7;
	private Integer nPRMCardio1;
	private Integer nPRMCardio2;
	private Integer nPRMCardio3;
	private Integer nPRMCardio4;
	private Integer nPRMPulm1;
	private Integer nPRMPulm2;
	private Integer nPRMPulm3;
	private Integer nPRMTGI1;
	private Integer nPRMTGI2;
	private Integer nPRMTGI3;
	private Integer nPRMTGI4;
	private Integer nPRMTGI5;
	private Integer nPRMSEndoc1;
	private Integer nPRMSEndoc2;
	private Integer nPRMSEndoc3;
	private Integer nPRMSUrin1;
	private Integer nPRMSGenitRepr1;
	private Integer nPRMSGenitRepr2;
	private Integer nPRMSGenitRepr3;
	private Integer nPRMSGenitRepr4;
	private Integer nPRMSGenitRepr5;
	private Integer nPRMSHematop1;
	private Integer nPRMSHematop2;
	private Integer nPRMSHematop3;
	private Integer nPRMMuscEsq1;
	private Integer nPRMMuscEsq2;
	private Integer nPRMMuscEsq3;
	private Integer nPRMMuscEsq4;
	private Integer nPRMSNervoso1;
	private Integer nPRMSNervoso2;
	private Integer nPRMSNervoso3;
	private Integer nPRMSNervoso4;
	private Integer nPRMSNervoso5;
	private Integer nPRMSNervoso6;
	private Integer nPRMSNervoso7;
	private Integer nPRMPele1;
	private Integer nPRMPele2;
	private Integer nPRMPele3;
	private Integer nPRMDoencInfec1;
	private Integer nPRMDoencInfec2;
	private Integer nPRMDoencInfec3;
	private Integer nPRMDoencInfec4;
	private Integer nPRMDoencInfec5;
		
	private String descricaoSGeral1 = TraducaoBean.getTraducao("descricaoSGeral1");
	private String descricaoSGeral2 = TraducaoBean.getTraducao("descricaoSGeral2");
	private String descricaoSGeral3 = TraducaoBean.getTraducao("descricaoSGeral3");
	private String descricaoSGeral4 = TraducaoBean.getTraducao("descricaoSGeral4");
	private String descricaoSGeral5 = TraducaoBean.getTraducao("descricaoSGeral5");
	private String descricaoOONB1 = TraducaoBean.getTraducao("descricaoOONB1");
	private String descricaoOONB2 = TraducaoBean.getTraducao("descricaoOONB2");
	private String descricaoOONB3 = TraducaoBean.getTraducao("descricaoOONB3");
	private String descricaoOONB4 = TraducaoBean.getTraducao("descricaoOONB4");
	private String descricaoOONB5 = TraducaoBean.getTraducao("descricaoOONB5");
	private String descricaoOONB6 = TraducaoBean.getTraducao("descricaoOONB6");
	private String descricaoOONB7 = TraducaoBean.getTraducao("descricaoOONB7");
	private String descricaoCardio1 = TraducaoBean.getTraducao("descricaoCardio1");
	private String descricaoCardio2 = TraducaoBean.getTraducao("descricaoCardio2");
	private String descricaoCardio3 = TraducaoBean.getTraducao("descricaoCardio3");
	private String descricaoCardio4 = TraducaoBean.getTraducao("descricaoCardio4");
	private String descricaoPulm1 = TraducaoBean.getTraducao("descricaoPulm1");
	private String descricaoPulm2 = TraducaoBean.getTraducao("descricaoPulm2");
	private String descricaoPulm3 = TraducaoBean.getTraducao("descricaoPulm3");
	private String descricaoTGI1 = TraducaoBean.getTraducao("descricaoTGI1");
	private String descricaoTGI2 = TraducaoBean.getTraducao("descricaoTGI2");
	private String descricaoTGI3 = TraducaoBean.getTraducao("descricaoTGI3");
	private String descricaoTGI4 = TraducaoBean.getTraducao("descricaoTGI4");
	private String descricaoTGI5 = TraducaoBean.getTraducao("descricaoTGI5");
	private String descricaoSEndoc1 = TraducaoBean.getTraducao("descricaoSEndoc1");
	private String descricaoSEndoc2 = TraducaoBean.getTraducao("descricaoSEndoc2");
	private String descricaoSEndoc3 = TraducaoBean.getTraducao("descricaoSEndoc3");
	private String descricaoSUrin1 = TraducaoBean.getTraducao("descricaoSUrin1");
	private String descricaoSGenitRepr1 = TraducaoBean.getTraducao("descricaoSGenitRepr1");
	private String descricaoSGenitRepr2 = TraducaoBean.getTraducao("descricaoSGenitRepr2");
	private String descricaoSGenitRepr3 = TraducaoBean.getTraducao("descricaoSGenitRepr3");
	private String descricaoSGenitRepr4 = TraducaoBean.getTraducao("descricaoSGenitRepr4");
	private String descricaoSGenitRepr5 = TraducaoBean.getTraducao("descricaoSGenitRepr5");
	private String descricaoSHematop1 = TraducaoBean.getTraducao("descricaoSHematop1");
	private String descricaoSHematop2 = TraducaoBean.getTraducao("descricaoSHematop2");
	private String descricaoSHematop3 = TraducaoBean.getTraducao("descricaoSHematop3");
	private String descricaoMuscEsq1 = TraducaoBean.getTraducao("descricaoMuscEsq1");
	private String descricaoMuscEsq2 = TraducaoBean.getTraducao("descricaoMuscEsq2");
	private String descricaoMuscEsq3 = TraducaoBean.getTraducao("descricaoMuscEsq3");
	private String descricaoMuscEsq4 = TraducaoBean.getTraducao("descricaoMuscEsq4");
	private String descricaoSNervoso1 = TraducaoBean.getTraducao("descricaoSNervoso1");
	private String descricaoSNervoso2 = TraducaoBean.getTraducao("descricaoSNervoso2");
	private String descricaoSNervoso3 = TraducaoBean.getTraducao("descricaoSNervoso3");
	private String descricaoSNervoso4 = TraducaoBean.getTraducao("descricaoSNervoso4");
	private String descricaoSNervoso5 = TraducaoBean.getTraducao("descricaoSNervoso5");
	private String descricaoSNervoso6 = TraducaoBean.getTraducao("descricaoSNervoso6");
	private String descricaoSNervoso7 = TraducaoBean.getTraducao("descricaoSNervoso7");
	private String descricaoPele1 = TraducaoBean.getTraducao("descricaoPele1");
	private String descricaoPele2 = TraducaoBean.getTraducao("descricaoPele2");
	private String descricaoPele3 = TraducaoBean.getTraducao("descricaoPele3");
	private String descricaoDoencInfec1 = TraducaoBean.getTraducao("descricaoDoencInfec1");
	private String descricaoDoencInfec2 = TraducaoBean.getTraducao("descricaoDoencInfec2");
	private String descricaoDoencInfec3 = TraducaoBean.getTraducao("descricaoDoencInfec3");
	private String descricaoDoencInfec4 = TraducaoBean.getTraducao("descricaoDoencInfec4");
	private String descricaoDoencInfec5 = TraducaoBean.getTraducao("descricaoDoencInfec5");

	private Aluno newAluno;
	
	private String PRM;
	private Map<String, Object> PRMsItens;
		
	public RespostaDoAlunoBean(){
		PRMsItens = new LinkedHashMap<String, Object>();
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens1"), 1);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens2"), 2);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens3"), 3);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens4"), 4);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens5"), 5);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens6"), 6);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens7"), 7);
		
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		
		newAluno = (Aluno) session.getAttribute("AlunoLogado");
		
		if(newAluno.getNrTentativa() > 1){
			CasoClinicoDAO daoCC = getCasoClinicoDAO();
			
			casoEscolhido = daoCC.getCasoClinico(newAluno.getConsultaAtual().getFkCasoClinico().getId());
		}

	}
	
	public String getConstrutorFake(){
		/*HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		
		newAluno = (Aluno) session.getAttribute("AlunoLogado");
		
		if(newAluno.getNrTentativa() > 1){
			CasoClinicoDAO daoCC = getCasoClinicoDAO();
			
			casoEscolhido = daoCC.getCasoClinico(newAluno.getConsultaAtual().getFkCasoClinico().getId());
		}*/
		return "";
	}
	
	public String goHome() {
		return "goHome";
	}
	
	//getter e setters necessários para o cadastro de queixas
	public boolean isAtivoSGeral1() {
		return ativoSGeral1;
	}

	public void setAtivoSGeral1(boolean ativoSGeral1) {
		this.ativoSGeral1 = ativoSGeral1;
	}

	public boolean isAtivoSGeral2() {
		return ativoSGeral2;
	}

	public void setAtivoSGeral2(boolean ativoSGeral2) {
		this.ativoSGeral2 = ativoSGeral2;
	}

	public boolean isAtivoSGeral3() {
		return ativoSGeral3;
	}

	public void setAtivoSGeral3(boolean ativoSGeral3) {
		this.ativoSGeral3 = ativoSGeral3;
	}

	public boolean isAtivoSGeral4() {
		return ativoSGeral4;
	}

	public void setAtivoSGeral4(boolean ativoSGeral4) {
		this.ativoSGeral4 = ativoSGeral4;
	}

	public boolean isAtivoSGeral5() {
		return ativoSGeral5;
	}

	public void setAtivoSGeral5(boolean ativoSGeral5) {
		this.ativoSGeral5 = ativoSGeral5;
	}

	public boolean isAtivoOONB1() {
		return ativoOONB1;
	}

	public void setAtivoOONB1(boolean ativoOONB1) {
		this.ativoOONB1 = ativoOONB1;
	}

	public boolean isAtivoOONB2() {
		return ativoOONB2;
	}

	public void setAtivoOONB2(boolean ativoOONB2) {
		this.ativoOONB2 = ativoOONB2;
	}

	public boolean isAtivoOONB3() {
		return ativoOONB3;
	}

	public void setAtivoOONB3(boolean ativoOONB3) {
		this.ativoOONB3 = ativoOONB3;
	}

	public boolean isAtivoOONB4() {
		return ativoOONB4;
	}

	public void setAtivoOONB4(boolean ativoOONB4) {
		this.ativoOONB4 = ativoOONB4;
	}

	public boolean isAtivoOONB5() {
		return ativoOONB5;
	}

	public void setAtivoOONB5(boolean ativoOONB5) {
		this.ativoOONB5 = ativoOONB5;
	}

	public boolean isAtivoOONB6() {
		return ativoOONB6;
	}

	public void setAtivoOONB6(boolean ativoOONB6) {
		this.ativoOONB6 = ativoOONB6;
	}

	public boolean isAtivoOONB7() {
		return ativoOONB7;
	}

	public void setAtivoOONB7(boolean ativoOONB7) {
		this.ativoOONB7 = ativoOONB7;
	}

	public boolean isAtivoCardio1() {
		return ativoCardio1;
	}

	public void setAtivoCardio1(boolean ativoCardio1) {
		this.ativoCardio1 = ativoCardio1;
	}

	public boolean isAtivoCardio2() {
		return ativoCardio2;
	}

	public void setAtivoCardio2(boolean ativoCardio2) {
		this.ativoCardio2 = ativoCardio2;
	}

	public boolean isAtivoCardio3() {
		return ativoCardio3;
	}

	public void setAtivoCardio3(boolean ativoCardio3) {
		this.ativoCardio3 = ativoCardio3;
	}

	public boolean isAtivoCardio4() {
		return ativoCardio4;
	}

	public void setAtivoCardio4(boolean ativoCardio4) {
		this.ativoCardio4 = ativoCardio4;
	}

	public boolean isAtivoPulm1() {
		return ativoPulm1;
	}

	public void setAtivoPulm1(boolean ativoPulm1) {
		this.ativoPulm1 = ativoPulm1;
	}

	public boolean isAtivoPulm2() {
		return ativoPulm2;
	}

	public void setAtivoPulm2(boolean ativoPulm2) {
		this.ativoPulm2 = ativoPulm2;
	}

	public boolean isAtivoPulm3() {
		return ativoPulm3;
	}

	public void setAtivoPulm3(boolean ativoPulm3) {
		this.ativoPulm3 = ativoPulm3;
	}

	public boolean isAtivoTGI1() {
		return ativoTGI1;
	}

	public void setAtivoTGI1(boolean ativoTGI1) {
		this.ativoTGI1 = ativoTGI1;
	}

	public boolean isAtivoTGI2() {
		return ativoTGI2;
	}

	public void setAtivoTGI2(boolean ativoTGI2) {
		this.ativoTGI2 = ativoTGI2;
	}

	public boolean isAtivoTGI3() {
		return ativoTGI3;
	}

	public void setAtivoTGI3(boolean ativoTGI3) {
		this.ativoTGI3 = ativoTGI3;
	}

	public boolean isAtivoTGI4() {
		return ativoTGI4;
	}

	public void setAtivoTGI4(boolean ativoTGI4) {
		this.ativoTGI4 = ativoTGI4;
	}

	public boolean isAtivoTGI5() {
		return ativoTGI5;
	}

	public void setAtivoTGI5(boolean ativoTGI5) {
		this.ativoTGI5 = ativoTGI5;
	}

	public boolean isAtivoSEndoc1() {
		return ativoSEndoc1;
	}

	public void setAtivoSEndoc1(boolean ativoSEndoc1) {
		this.ativoSEndoc1 = ativoSEndoc1;
	}

	public boolean isAtivoSEndoc2() {
		return ativoSEndoc2;
	}

	public void setAtivoSEndoc2(boolean ativoSEndoc2) {
		this.ativoSEndoc2 = ativoSEndoc2;
	}

	public boolean isAtivoSEndoc3() {
		return ativoSEndoc3;
	}

	public void setAtivoSEndoc3(boolean ativoSEndoc3) {
		this.ativoSEndoc3 = ativoSEndoc3;
	}

	public boolean isAtivoSUrin1() {
		return ativoSUrin1;
	}

	public void setAtivoSUrin1(boolean ativoSUrin1) {
		this.ativoSUrin1 = ativoSUrin1;
	}

	public boolean isAtivoSGenitRepr1() {
		return ativoSGenitRepr1;
	}

	public void setAtivoSGenitRepr1(boolean ativoSGenitRepr1) {
		this.ativoSGenitRepr1 = ativoSGenitRepr1;
	}

	public boolean isAtivoSGenitRepr2() {
		return ativoSGenitRepr2;
	}

	public void setAtivoSGenitRepr2(boolean ativoSGenitRepr2) {
		this.ativoSGenitRepr2 = ativoSGenitRepr2;
	}

	public boolean isAtivoSGenitRepr3() {
		return ativoSGenitRepr3;
	}

	public void setAtivoSGenitRepr3(boolean ativoSGenitRepr3) {
		this.ativoSGenitRepr3 = ativoSGenitRepr3;
	}

	public boolean isAtivoSGenitRepr4() {
		return ativoSGenitRepr4;
	}

	public void setAtivoSGenitRepr4(boolean ativoSGenitRepr4) {
		this.ativoSGenitRepr4 = ativoSGenitRepr4;
	}

	public boolean isAtivoSGenitRepr5() {
		return ativoSGenitRepr5;
	}

	public void setAtivoSGenitRepr5(boolean ativoSGenitRepr5) {
		this.ativoSGenitRepr5 = ativoSGenitRepr5;
	}

	public boolean isAtivoSHematop1() {
		return ativoSHematop1;
	}

	public void setAtivoSHematop1(boolean ativoSHematop1) {
		this.ativoSHematop1 = ativoSHematop1;
	}

	public boolean isAtivoSHematop2() {
		return ativoSHematop2;
	}

	public void setAtivoSHematop2(boolean ativoSHematop2) {
		this.ativoSHematop2 = ativoSHematop2;
	}

	public boolean isAtivoSHematop3() {
		return ativoSHematop3;
	}

	public void setAtivoSHematop3(boolean ativoSHematop3) {
		this.ativoSHematop3 = ativoSHematop3;
	}

	public boolean isAtivoMuscEsq1() {
		return ativoMuscEsq1;
	}

	public void setAtivoMuscEsq1(boolean ativoMuscEsq1) {
		this.ativoMuscEsq1 = ativoMuscEsq1;
	}

	public boolean isAtivoMuscEsq2() {
		return ativoMuscEsq2;
	}

	public void setAtivoMuscEsq2(boolean ativoMuscEsq2) {
		this.ativoMuscEsq2 = ativoMuscEsq2;
	}

	public boolean isAtivoMuscEsq3() {
		return ativoMuscEsq3;
	}

	public void setAtivoMuscEsq3(boolean ativoMuscEsq3) {
		this.ativoMuscEsq3 = ativoMuscEsq3;
	}

	public boolean isAtivoMuscEsq4() {
		return ativoMuscEsq4;
	}

	public void setAtivoMuscEsq4(boolean ativoMuscEsq4) {
		this.ativoMuscEsq4 = ativoMuscEsq4;
	}

	public boolean isAtivoSNervoso1() {
		return ativoSNervoso1;
	}

	public void setAtivoSNervoso1(boolean ativoSNervoso1) {
		this.ativoSNervoso1 = ativoSNervoso1;
	}

	public boolean isAtivoSNervoso2() {
		return ativoSNervoso2;
	}

	public void setAtivoSNervoso2(boolean ativoSNervoso2) {
		this.ativoSNervoso2 = ativoSNervoso2;
	}

	public boolean isAtivoSNervoso3() {
		return ativoSNervoso3;
	}

	public void setAtivoSNervoso3(boolean ativoSNervoso3) {
		this.ativoSNervoso3 = ativoSNervoso3;
	}

	public boolean isAtivoSNervoso4() {
		return ativoSNervoso4;
	}

	public void setAtivoSNervoso4(boolean ativoSNervoso4) {
		this.ativoSNervoso4 = ativoSNervoso4;
	}

	public boolean isAtivoSNervoso5() {
		return ativoSNervoso5;
	}

	public void setAtivoSNervoso5(boolean ativoSNervoso5) {
		this.ativoSNervoso5 = ativoSNervoso5;
	}

	public boolean isAtivoSNervoso6() {
		return ativoSNervoso6;
	}

	public void setAtivoSNervoso6(boolean ativoSNervoso6) {
		this.ativoSNervoso6 = ativoSNervoso6;
	}

	public boolean isAtivoSNervoso7() {
		return ativoSNervoso7;
	}

	public void setAtivoSNervoso7(boolean ativoSNervoso7) {
		this.ativoSNervoso7 = ativoSNervoso7;
	}

	public boolean isAtivoPele1() {
		return ativoPele1;
	}

	public void setAtivoPele1(boolean ativoPele1) {
		this.ativoPele1 = ativoPele1;
	}

	public boolean isAtivoPele2() {
		return ativoPele2;
	}

	public void setAtivoPele2(boolean ativoPele2) {
		this.ativoPele2 = ativoPele2;
	}

	public boolean isAtivoPele3() {
		return ativoPele3;
	}

	public void setAtivoPele3(boolean ativoPele3) {
		this.ativoPele3 = ativoPele3;
	}

	public boolean isAtivoDoencInfec1() {
		return ativoDoencInfec1;
	}

	public void setAtivoDoencInfec1(boolean ativoDoencInfec1) {
		this.ativoDoencInfec1 = ativoDoencInfec1;
	}

	public boolean isAtivoDoencInfec2() {
		return ativoDoencInfec2;
	}

	public void setAtivoDoencInfec2(boolean ativoDoencInfec2) {
		this.ativoDoencInfec2 = ativoDoencInfec2;
	}

	public boolean isAtivoDoencInfec3() {
		return ativoDoencInfec3;
	}

	public void setAtivoDoencInfec3(boolean ativoDoencInfec3) {
		this.ativoDoencInfec3 = ativoDoencInfec3;
	}

	public boolean isAtivoDoencInfec4() {
		return ativoDoencInfec4;
	}

	public void setAtivoDoencInfec4(boolean ativoDoencInfec4) {
		this.ativoDoencInfec4 = ativoDoencInfec4;
	}

	public boolean isAtivoDoencInfec5() {
		return ativoDoencInfec5;
	}

	public void setAtivoDoencInfec5(boolean ativoDoencInfec5) {
		this.ativoDoencInfec5 = ativoDoencInfec5;
	}

	public String getDoencaOuPRMSGeral1() {
		return doencaOuPRMSGeral1;
	}

	public void setDoencaOuPRMSGeral1(String doencaOuPRMSGeral1) {
		this.doencaOuPRMSGeral1 = doencaOuPRMSGeral1;
	}

	public String getDoencaOuPRMSGeral2() {
		return doencaOuPRMSGeral2;
	}

	public void setDoencaOuPRMSGeral2(String doencaOuPRMSGeral2) {
		this.doencaOuPRMSGeral2 = doencaOuPRMSGeral2;
	}

	public String getDoencaOuPRMSGeral3() {
		return doencaOuPRMSGeral3;
	}

	public void setDoencaOuPRMSGeral3(String doencaOuPRMSGeral3) {
		this.doencaOuPRMSGeral3 = doencaOuPRMSGeral3;
	}

	public String getDoencaOuPRMSGeral4() {
		return doencaOuPRMSGeral4;
	}

	public void setDoencaOuPRMSGeral4(String doencaOuPRMSGeral4) {
		this.doencaOuPRMSGeral4 = doencaOuPRMSGeral4;
	}

	public String getDoencaOuPRMSGeral5() {
		return doencaOuPRMSGeral5;
	}

	public void setDoencaOuPRMSGeral5(String doencaOuPRMSGeral5) {
		this.doencaOuPRMSGeral5 = doencaOuPRMSGeral5;
	}

	public String getDoencaOuPRMOONB1() {
		return doencaOuPRMOONB1;
	}

	public void setDoencaOuPRMOONB1(String doencaOuPRMOONB1) {
		this.doencaOuPRMOONB1 = doencaOuPRMOONB1;
	}

	public String getDoencaOuPRMOONB2() {
		return doencaOuPRMOONB2;
	}

	public void setDoencaOuPRMOONB2(String doencaOuPRMOONB2) {
		this.doencaOuPRMOONB2 = doencaOuPRMOONB2;
	}

	public String getDoencaOuPRMOONB3() {
		return doencaOuPRMOONB3;
	}

	public void setDoencaOuPRMOONB3(String doencaOuPRMOONB3) {
		this.doencaOuPRMOONB3 = doencaOuPRMOONB3;
	}

	public String getDoencaOuPRMOONB4() {
		return doencaOuPRMOONB4;
	}

	public void setDoencaOuPRMOONB4(String doencaOuPRMOONB4) {
		this.doencaOuPRMOONB4 = doencaOuPRMOONB4;
	}

	public String getDoencaOuPRMOONB5() {
		return doencaOuPRMOONB5;
	}

	public void setDoencaOuPRMOONB5(String doencaOuPRMOONB5) {
		this.doencaOuPRMOONB5 = doencaOuPRMOONB5;
	}

	public String getDoencaOuPRMOONB6() {
		return doencaOuPRMOONB6;
	}

	public void setDoencaOuPRMOONB6(String doencaOuPRMOONB6) {
		this.doencaOuPRMOONB6 = doencaOuPRMOONB6;
	}

	public String getDoencaOuPRMOONB7() {
		return doencaOuPRMOONB7;
	}

	public void setDoencaOuPRMOONB7(String doencaOuPRMOONB7) {
		this.doencaOuPRMOONB7 = doencaOuPRMOONB7;
	}

	public String getDoencaOuPRMCardio1() {
		return doencaOuPRMCardio1;
	}

	public void setDoencaOuPRMCardio1(String doencaOuPRMCardio1) {
		this.doencaOuPRMCardio1 = doencaOuPRMCardio1;
	}

	public String getDoencaOuPRMCardio2() {
		return doencaOuPRMCardio2;
	}

	public void setDoencaOuPRMCardio2(String doencaOuPRMCardio2) {
		this.doencaOuPRMCardio2 = doencaOuPRMCardio2;
	}

	public String getDoencaOuPRMCardio3() {
		return doencaOuPRMCardio3;
	}

	public void setDoencaOuPRMCardio3(String doencaOuPRMCardio3) {
		this.doencaOuPRMCardio3 = doencaOuPRMCardio3;
	}

	public String getDoencaOuPRMCardio4() {
		return doencaOuPRMCardio4;
	}

	public void setDoencaOuPRMCardio4(String doencaOuPRMCardio4) {
		this.doencaOuPRMCardio4 = doencaOuPRMCardio4;
	}

	public String getDoencaOuPRMPulm1() {
		return doencaOuPRMPulm1;
	}

	public void setDoencaOuPRMPulm1(String doencaOuPRMPulm1) {
		this.doencaOuPRMPulm1 = doencaOuPRMPulm1;
	}

	public String getDoencaOuPRMPulm2() {
		return doencaOuPRMPulm2;
	}

	public void setDoencaOuPRMPulm2(String doencaOuPRMPulm2) {
		this.doencaOuPRMPulm2 = doencaOuPRMPulm2;
	}

	public String getDoencaOuPRMPulm3() {
		return doencaOuPRMPulm3;
	}

	public void setDoencaOuPRMPulm3(String doencaOuPRMPulm3) {
		this.doencaOuPRMPulm3 = doencaOuPRMPulm3;
	}

	public String getDoencaOuPRMTGI1() {
		return doencaOuPRMTGI1;
	}

	public void setDoencaOuPRMTGI1(String doencaOuPRMTGI1) {
		this.doencaOuPRMTGI1 = doencaOuPRMTGI1;
	}

	public String getDoencaOuPRMTGI2() {
		return doencaOuPRMTGI2;
	}

	public void setDoencaOuPRMTGI2(String doencaOuPRMTGI2) {
		this.doencaOuPRMTGI2 = doencaOuPRMTGI2;
	}

	public String getDoencaOuPRMTGI3() {
		return doencaOuPRMTGI3;
	}

	public void setDoencaOuPRMTGI3(String doencaOuPRMTGI3) {
		this.doencaOuPRMTGI3 = doencaOuPRMTGI3;
	}

	public String getDoencaOuPRMTGI4() {
		return doencaOuPRMTGI4;
	}

	public void setDoencaOuPRMTGI4(String doencaOuPRMTGI4) {
		this.doencaOuPRMTGI4 = doencaOuPRMTGI4;
	}

	public String getDoencaOuPRMTGI5() {
		return doencaOuPRMTGI5;
	}

	public void setDoencaOuPRMTGI5(String doencaOuPRMTGI5) {
		this.doencaOuPRMTGI5 = doencaOuPRMTGI5;
	}

	public String getDoencaOuPRMSEndoc1() {
		return doencaOuPRMSEndoc1;
	}

	public void setDoencaOuPRMSEndoc1(String doencaOuPRMSEndoc1) {
		this.doencaOuPRMSEndoc1 = doencaOuPRMSEndoc1;
	}

	public String getDoencaOuPRMSEndoc2() {
		return doencaOuPRMSEndoc2;
	}

	public void setDoencaOuPRMSEndoc2(String doencaOuPRMSEndoc2) {
		this.doencaOuPRMSEndoc2 = doencaOuPRMSEndoc2;
	}

	public String getDoencaOuPRMSEndoc3() {
		return doencaOuPRMSEndoc3;
	}

	public void setDoencaOuPRMSEndoc3(String doencaOuPRMSEndoc3) {
		this.doencaOuPRMSEndoc3 = doencaOuPRMSEndoc3;
	}

	public String getDoencaOuPRMSUrin1() {
		return doencaOuPRMSUrin1;
	}

	public void setDoencaOuPRMSUrin1(String doencaOuPRMSUrin1) {
		this.doencaOuPRMSUrin1 = doencaOuPRMSUrin1;
	}

	public String getDoencaOuPRMSGenitRepr1() {
		return doencaOuPRMSGenitRepr1;
	}

	public void setDoencaOuPRMSGenitRepr1(String doencaOuPRMSGenitRepr1) {
		this.doencaOuPRMSGenitRepr1 = doencaOuPRMSGenitRepr1;
	}

	public String getDoencaOuPRMSGenitRepr2() {
		return doencaOuPRMSGenitRepr2;
	}

	public void setDoencaOuPRMSGenitRepr2(String doencaOuPRMSGenitRepr2) {
		this.doencaOuPRMSGenitRepr2 = doencaOuPRMSGenitRepr2;
	}

	public String getDoencaOuPRMSGenitRepr3() {
		return doencaOuPRMSGenitRepr3;
	}

	public void setDoencaOuPRMSGenitRepr3(String doencaOuPRMSGenitRepr3) {
		this.doencaOuPRMSGenitRepr3 = doencaOuPRMSGenitRepr3;
	}

	public String getDoencaOuPRMSGenitRepr4() {
		return doencaOuPRMSGenitRepr4;
	}

	public void setDoencaOuPRMSGenitRepr4(String doencaOuPRMSGenitRepr4) {
		this.doencaOuPRMSGenitRepr4 = doencaOuPRMSGenitRepr4;
	}

	public String getDoencaOuPRMSGenitRepr5() {
		return doencaOuPRMSGenitRepr5;
	}

	public void setDoencaOuPRMSGenitRepr5(String doencaOuPRMSGenitRepr5) {
		this.doencaOuPRMSGenitRepr5 = doencaOuPRMSGenitRepr5;
	}

	public String getDoencaOuPRMSHematop1() {
		return doencaOuPRMSHematop1;
	}

	public void setDoencaOuPRMSHematop1(String doencaOuPRMSHematop1) {
		this.doencaOuPRMSHematop1 = doencaOuPRMSHematop1;
	}

	public String getDoencaOuPRMSHematop2() {
		return doencaOuPRMSHematop2;
	}

	public void setDoencaOuPRMSHematop2(String doencaOuPRMSHematop2) {
		this.doencaOuPRMSHematop2 = doencaOuPRMSHematop2;
	}

	public String getDoencaOuPRMSHematop3() {
		return doencaOuPRMSHematop3;
	}

	public void setDoencaOuPRMSHematop3(String doencaOuPRMSHematop3) {
		this.doencaOuPRMSHematop3 = doencaOuPRMSHematop3;
	}

	public String getDoencaOuPRMMuscEsq1() {
		return doencaOuPRMMuscEsq1;
	}

	public void setDoencaOuPRMMuscEsq1(String doencaOuPRMMuscEsq1) {
		this.doencaOuPRMMuscEsq1 = doencaOuPRMMuscEsq1;
	}

	public String getDoencaOuPRMMuscEsq2() {
		return doencaOuPRMMuscEsq2;
	}

	public void setDoencaOuPRMMuscEsq2(String doencaOuPRMMuscEsq2) {
		this.doencaOuPRMMuscEsq2 = doencaOuPRMMuscEsq2;
	}

	public String getDoencaOuPRMMuscEsq3() {
		return doencaOuPRMMuscEsq3;
	}

	public void setDoencaOuPRMMuscEsq3(String doencaOuPRMMuscEsq3) {
		this.doencaOuPRMMuscEsq3 = doencaOuPRMMuscEsq3;
	}

	public String getDoencaOuPRMMuscEsq4() {
		return doencaOuPRMMuscEsq4;
	}

	public void setDoencaOuPRMMuscEsq4(String doencaOuPRMMuscEsq4) {
		this.doencaOuPRMMuscEsq4 = doencaOuPRMMuscEsq4;
	}

	public String getDoencaOuPRMSNervoso1() {
		return doencaOuPRMSNervoso1;
	}

	public void setDoencaOuPRMSNervoso1(String doencaOuPRMSNervoso1) {
		this.doencaOuPRMSNervoso1 = doencaOuPRMSNervoso1;
	}

	public String getDoencaOuPRMSNervoso2() {
		return doencaOuPRMSNervoso2;
	}

	public void setDoencaOuPRMSNervoso2(String doencaOuPRMSNervoso2) {
		this.doencaOuPRMSNervoso2 = doencaOuPRMSNervoso2;
	}

	public String getDoencaOuPRMSNervoso3() {
		return doencaOuPRMSNervoso3;
	}

	public void setDoencaOuPRMSNervoso3(String doencaOuPRMSNervoso3) {
		this.doencaOuPRMSNervoso3 = doencaOuPRMSNervoso3;
	}

	public String getDoencaOuPRMSNervoso4() {
		return doencaOuPRMSNervoso4;
	}

	public void setDoencaOuPRMSNervoso4(String doencaOuPRMSNervoso4) {
		this.doencaOuPRMSNervoso4 = doencaOuPRMSNervoso4;
	}

	public String getDoencaOuPRMSNervoso5() {
		return doencaOuPRMSNervoso5;
	}

	public void setDoencaOuPRMSNervoso5(String doencaOuPRMSNervoso5) {
		this.doencaOuPRMSNervoso5 = doencaOuPRMSNervoso5;
	}

	public String getDoencaOuPRMSNervoso6() {
		return doencaOuPRMSNervoso6;
	}

	public void setDoencaOuPRMSNervoso6(String doencaOuPRMSNervoso6) {
		this.doencaOuPRMSNervoso6 = doencaOuPRMSNervoso6;
	}

	public String getDoencaOuPRMSNervoso7() {
		return doencaOuPRMSNervoso7;
	}

	public void setDoencaOuPRMSNervoso7(String doencaOuPRMSNervoso7) {
		this.doencaOuPRMSNervoso7 = doencaOuPRMSNervoso7;
	}

	public String getDoencaOuPRMPele1() {
		return doencaOuPRMPele1;
	}

	public void setDoencaOuPRMPele1(String doencaOuPRMPele1) {
		this.doencaOuPRMPele1 = doencaOuPRMPele1;
	}

	public String getDoencaOuPRMPele2() {
		return doencaOuPRMPele2;
	}

	public void setDoencaOuPRMPele2(String doencaOuPRMPele2) {
		this.doencaOuPRMPele2 = doencaOuPRMPele2;
	}

	public String getDoencaOuPRMPele3() {
		return doencaOuPRMPele3;
	}

	public void setDoencaOuPRMPele3(String doencaOuPRMPele3) {
		this.doencaOuPRMPele3 = doencaOuPRMPele3;
	}

	public String getDoencaOuPRMDoencInfec1() {
		return doencaOuPRMDoencInfec1;
	}

	public void setDoencaOuPRMDoencInfec1(String doencaOuPRMDoencInfec1) {
		this.doencaOuPRMDoencInfec1 = doencaOuPRMDoencInfec1;
	}

	public String getDoencaOuPRMDoencInfec2() {
		return doencaOuPRMDoencInfec2;
	}

	public void setDoencaOuPRMDoencInfec2(String doencaOuPRMDoencInfec2) {
		this.doencaOuPRMDoencInfec2 = doencaOuPRMDoencInfec2;
	}

	public String getDoencaOuPRMDoencInfec3() {
		return doencaOuPRMDoencInfec3;
	}

	public void setDoencaOuPRMDoencInfec3(String doencaOuPRMDoencInfec3) {
		this.doencaOuPRMDoencInfec3 = doencaOuPRMDoencInfec3;
	}

	public String getDoencaOuPRMDoencInfec4() {
		return doencaOuPRMDoencInfec4;
	}

	public void setDoencaOuPRMDoencInfec4(String doencaOuPRMDoencInfec4) {
		this.doencaOuPRMDoencInfec4 = doencaOuPRMDoencInfec4;
	}

	public String getDoencaOuPRMDoencInfec5() {
		return doencaOuPRMDoencInfec5;
	}

	public void setDoencaOuPRMDoencInfec5(String doencaOuPRMDoencInfec5) {
		this.doencaOuPRMDoencInfec5 = doencaOuPRMDoencInfec5;
	}

	public Integer getnPRMSGeral1() {
		return nPRMSGeral1;
	}

	public void setnPRMSGeral1(Integer nPRMSGeral1) {
		this.nPRMSGeral1 = nPRMSGeral1;
	}

	public Integer getnPRMSGeral2() {
		return nPRMSGeral2;
	}

	public void setnPRMSGeral2(Integer nPRMSGeral2) {
		this.nPRMSGeral2 = nPRMSGeral2;
	}

	public Integer getnPRMSGeral3() {
		return nPRMSGeral3;
	}

	public void setnPRMSGeral3(Integer nPRMSGeral3) {
		this.nPRMSGeral3 = nPRMSGeral3;
	}

	public Integer getnPRMSGeral4() {
		return nPRMSGeral4;
	}

	public void setnPRMSGeral4(Integer nPRMSGeral4) {
		this.nPRMSGeral4 = nPRMSGeral4;
	}

	public Integer getnPRMSGeral5() {
		return nPRMSGeral5;
	}

	public void setnPRMSGeral5(Integer nPRMSGeral5) {
		this.nPRMSGeral5 = nPRMSGeral5;
	}

	public Integer getnPRMOONB1() {
		return nPRMOONB1;
	}

	public void setnPRMOONB1(Integer nPRMOONB1) {
		this.nPRMOONB1 = nPRMOONB1;
	}

	public Integer getnPRMOONB2() {
		return nPRMOONB2;
	}

	public void setnPRMOONB2(Integer nPRMOONB2) {
		this.nPRMOONB2 = nPRMOONB2;
	}

	public Integer getnPRMOONB3() {
		return nPRMOONB3;
	}

	public void setnPRMOONB3(Integer nPRMOONB3) {
		this.nPRMOONB3 = nPRMOONB3;
	}

	public Integer getnPRMOONB4() {
		return nPRMOONB4;
	}

	public void setnPRMOONB4(Integer nPRMOONB4) {
		this.nPRMOONB4 = nPRMOONB4;
	}

	public Integer getnPRMOONB5() {
		return nPRMOONB5;
	}

	public void setnPRMOONB5(Integer nPRMOONB5) {
		this.nPRMOONB5 = nPRMOONB5;
	}

	public Integer getnPRMOONB6() {
		return nPRMOONB6;
	}

	public void setnPRMOONB6(Integer nPRMOONB6) {
		this.nPRMOONB6 = nPRMOONB6;
	}

	public Integer getnPRMOONB7() {
		return nPRMOONB7;
	}

	public void setnPRMOONB7(Integer nPRMOONB7) {
		this.nPRMOONB7 = nPRMOONB7;
	}

	public Integer getnPRMCardio1() {
		return nPRMCardio1;
	}

	public void setnPRMCardio1(Integer nPRMCardio1) {
		this.nPRMCardio1 = nPRMCardio1;
	}

	public Integer getnPRMCardio2() {
		return nPRMCardio2;
	}

	public void setnPRMCardio2(Integer nPRMCardio2) {
		this.nPRMCardio2 = nPRMCardio2;
	}

	public Integer getnPRMCardio3() {
		return nPRMCardio3;
	}

	public void setnPRMCardio3(Integer nPRMCardio3) {
		this.nPRMCardio3 = nPRMCardio3;
	}

	public Integer getnPRMCardio4() {
		return nPRMCardio4;
	}

	public void setnPRMCardio4(Integer nPRMCardio4) {
		this.nPRMCardio4 = nPRMCardio4;
	}

	public Integer getnPRMPulm1() {
		return nPRMPulm1;
	}

	public void setnPRMPulm1(Integer nPRMPulm1) {
		this.nPRMPulm1 = nPRMPulm1;
	}

	public Integer getnPRMPulm2() {
		return nPRMPulm2;
	}

	public void setnPRMPulm2(Integer nPRMPulm2) {
		this.nPRMPulm2 = nPRMPulm2;
	}

	public Integer getnPRMPulm3() {
		return nPRMPulm3;
	}

	public void setnPRMPulm3(Integer nPRMPulm3) {
		this.nPRMPulm3 = nPRMPulm3;
	}

	public Integer getnPRMTGI1() {
		return nPRMTGI1;
	}

	public void setnPRMTGI1(Integer nPRMTGI1) {
		this.nPRMTGI1 = nPRMTGI1;
	}

	public Integer getnPRMTGI2() {
		return nPRMTGI2;
	}

	public void setnPRMTGI2(Integer nPRMTGI2) {
		this.nPRMTGI2 = nPRMTGI2;
	}

	public Integer getnPRMTGI3() {
		return nPRMTGI3;
	}

	public void setnPRMTGI3(Integer nPRMTGI3) {
		this.nPRMTGI3 = nPRMTGI3;
	}

	public Integer getnPRMTGI4() {
		return nPRMTGI4;
	}

	public void setnPRMTGI4(Integer nPRMTGI4) {
		this.nPRMTGI4 = nPRMTGI4;
	}

	public Integer getnPRMTGI5() {
		return nPRMTGI5;
	}

	public void setnPRMTGI5(Integer nPRMTGI5) {
		this.nPRMTGI5 = nPRMTGI5;
	}

	public Integer getnPRMSEndoc1() {
		return nPRMSEndoc1;
	}

	public void setnPRMSEndoc1(Integer nPRMSEndoc1) {
		this.nPRMSEndoc1 = nPRMSEndoc1;
	}

	public Integer getnPRMSEndoc2() {
		return nPRMSEndoc2;
	}

	public void setnPRMSEndoc2(Integer nPRMSEndoc2) {
		this.nPRMSEndoc2 = nPRMSEndoc2;
	}

	public Integer getnPRMSEndoc3() {
		return nPRMSEndoc3;
	}

	public void setnPRMSEndoc3(Integer nPRMSEndoc3) {
		this.nPRMSEndoc3 = nPRMSEndoc3;
	}

	public Integer getnPRMSUrin1() {
		return nPRMSUrin1;
	}

	public void setnPRMSUrin1(Integer nPRMSUrin1) {
		this.nPRMSUrin1 = nPRMSUrin1;
	}

	public Integer getnPRMSGenitRepr1() {
		return nPRMSGenitRepr1;
	}

	public void setnPRMSGenitRepr1(Integer nPRMSGenitRepr1) {
		this.nPRMSGenitRepr1 = nPRMSGenitRepr1;
	}

	public Integer getnPRMSGenitRepr2() {
		return nPRMSGenitRepr2;
	}

	public void setnPRMSGenitRepr2(Integer nPRMSGenitRepr2) {
		this.nPRMSGenitRepr2 = nPRMSGenitRepr2;
	}

	public Integer getnPRMSGenitRepr3() {
		return nPRMSGenitRepr3;
	}

	public void setnPRMSGenitRepr3(Integer nPRMSGenitRepr3) {
		this.nPRMSGenitRepr3 = nPRMSGenitRepr3;
	}

	public Integer getnPRMSGenitRepr4() {
		return nPRMSGenitRepr4;
	}

	public void setnPRMSGenitRepr4(Integer nPRMSGenitRepr4) {
		this.nPRMSGenitRepr4 = nPRMSGenitRepr4;
	}

	public Integer getnPRMSGenitRepr5() {
		return nPRMSGenitRepr5;
	}

	public void setnPRMSGenitRepr5(Integer nPRMSGenitRepr5) {
		this.nPRMSGenitRepr5 = nPRMSGenitRepr5;
	}

	public Integer getnPRMSHematop1() {
		return nPRMSHematop1;
	}

	public void setnPRMSHematop1(Integer nPRMSHematop1) {
		this.nPRMSHematop1 = nPRMSHematop1;
	}

	public Integer getnPRMSHematop2() {
		return nPRMSHematop2;
	}

	public void setnPRMSHematop2(Integer nPRMSHematop2) {
		this.nPRMSHematop2 = nPRMSHematop2;
	}

	public Integer getnPRMSHematop3() {
		return nPRMSHematop3;
	}

	public void setnPRMSHematop3(Integer nPRMSHematop3) {
		this.nPRMSHematop3 = nPRMSHematop3;
	}

	public Integer getnPRMMuscEsq1() {
		return nPRMMuscEsq1;
	}

	public void setnPRMMuscEsq1(Integer nPRMMuscEsq1) {
		this.nPRMMuscEsq1 = nPRMMuscEsq1;
	}

	public Integer getnPRMMuscEsq2() {
		return nPRMMuscEsq2;
	}

	public void setnPRMMuscEsq2(Integer nPRMMuscEsq2) {
		this.nPRMMuscEsq2 = nPRMMuscEsq2;
	}

	public Integer getnPRMMuscEsq3() {
		return nPRMMuscEsq3;
	}

	public void setnPRMMuscEsq3(Integer nPRMMuscEsq3) {
		this.nPRMMuscEsq3 = nPRMMuscEsq3;
	}

	public Integer getnPRMMuscEsq4() {
		return nPRMMuscEsq4;
	}

	public void setnPRMMuscEsq4(Integer nPRMMuscEsq4) {
		this.nPRMMuscEsq4 = nPRMMuscEsq4;
	}

	public Integer getnPRMSNervoso1() {
		return nPRMSNervoso1;
	}

	public void setnPRMSNervoso1(Integer nPRMSNervoso1) {
		this.nPRMSNervoso1 = nPRMSNervoso1;
	}

	public Integer getnPRMSNervoso2() {
		return nPRMSNervoso2;
	}

	public void setnPRMSNervoso2(Integer nPRMSNervoso2) {
		this.nPRMSNervoso2 = nPRMSNervoso2;
	}

	public Integer getnPRMSNervoso3() {
		return nPRMSNervoso3;
	}

	public void setnPRMSNervoso3(Integer nPRMSNervoso3) {
		this.nPRMSNervoso3 = nPRMSNervoso3;
	}

	public Integer getnPRMSNervoso4() {
		return nPRMSNervoso4;
	}

	public void setnPRMSNervoso4(Integer nPRMSNervoso4) {
		this.nPRMSNervoso4 = nPRMSNervoso4;
	}

	public Integer getnPRMSNervoso5() {
		return nPRMSNervoso5;
	}

	public void setnPRMSNervoso5(Integer nPRMSNervoso5) {
		this.nPRMSNervoso5 = nPRMSNervoso5;
	}

	public Integer getnPRMSNervoso6() {
		return nPRMSNervoso6;
	}

	public void setnPRMSNervoso6(Integer nPRMSNervoso6) {
		this.nPRMSNervoso6 = nPRMSNervoso6;
	}

	public Integer getnPRMSNervoso7() {
		return nPRMSNervoso7;
	}

	public void setnPRMSNervoso7(Integer nPRMSNervoso7) {
		this.nPRMSNervoso7 = nPRMSNervoso7;
	}

	public Integer getnPRMPele1() {
		return nPRMPele1;
	}

	public void setnPRMPele1(Integer nPRMPele1) {
		this.nPRMPele1 = nPRMPele1;
	}

	public Integer getnPRMPele2() {
		return nPRMPele2;
	}

	public void setnPRMPele2(Integer nPRMPele2) {
		this.nPRMPele2 = nPRMPele2;
	}

	public void setnPRMPele3(Integer nPRMPele3) {
		this.nPRMPele3 = nPRMPele3;
	}

	public Integer getnPRMPele3() {
		return nPRMPele3;
	}

	public Integer getnPRMDoencInfec1() {
		return nPRMDoencInfec1;
	}

	public void setnPRMDoencInfec1(Integer nPRMDoencInfec1) {
		this.nPRMDoencInfec1 = nPRMDoencInfec1;
	}

	public Integer getnPRMDoencInfec2() {
		return nPRMDoencInfec2;
	}

	public void setnPRMDoencInfec2(Integer nPRMDoencInfec2) {
		this.nPRMDoencInfec2 = nPRMDoencInfec2;
	}

	public Integer getnPRMDoencInfec3() {
		return nPRMDoencInfec3;
	}

	public void setnPRMDoencInfec3(Integer nPRMDoencInfec3) {
		this.nPRMDoencInfec3 = nPRMDoencInfec3;
	}

	public Integer getnPRMDoencInfec4() {
		return nPRMDoencInfec4;
	}

	public void setnPRMDoencInfec4(Integer nPRMDoencInfec4) {
		this.nPRMDoencInfec4 = nPRMDoencInfec4;
	}

	public Integer getnPRMDoencInfec5() {
		return nPRMDoencInfec5;
	}

	public void setnPRMDoencInfec5(Integer nPRMDoencInfec5) {
		this.nPRMDoencInfec5 = nPRMDoencInfec5;
	}

	public void setPRM(String pRM) {
		PRM = pRM;
	}

	public String getPRM() {
		return PRM;
	}

	
	public Map<String, Object> getPRMsItens() {
		
		PRMsItens = new LinkedHashMap<String, Object>();
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens1"), 1);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens2"), 2);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens3"), 3);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens4"), 4);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens5"), 5);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens6"), 6);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens7"), 7);
		
		return PRMsItens;
	}

	public void setPRMsItens(Map<String, Object> pRMsItens) {
		PRMsItens = pRMsItens;
	}

	
	
	
	class Aux{
		public Aux(String nome, int id) {
			super();
			this.nome = nome;
			this.id = id;
		}
		public Aux() {
			super();
		}
		String nome;
		int id;
		
		public String imprime(){
			return (Integer.toString(id) +" - "+nome); 
		}
	}
	
	Integer casoEscolhidoAuxStr;
	
	public ArrayList<SelectItem> getListaCasosStr(){
		
		
		CasoClinicoDAO daoCC = getCasoClinicoDAO();
		
		listaDeCasos = new ArrayList<CasoClinico>();
		
		listaDeCasos = daoCC.getAll();
		
		ArrayList<SelectItem> retorno = new ArrayList<SelectItem>(); 
		
		for(Iterator<CasoClinico> i = listaDeCasos.iterator(); i.hasNext();){
			CasoClinico elementoAux = i.next();
			SelectItem a = new SelectItem(elementoAux.getId(), elementoAux.getNome());
			//Aux novo = new Aux(elementoAux.getNome(), elementoAux.getId());
			retorno.add(a);
			//System.out.println(novo.imprime());
		}
		
		
		return retorno; 		
	}
	
	public ArrayList<SelectItem> getListaCasosByIdioma(){
		
		
		CasoClinicoDAO daoCC = getCasoClinicoDAO();
		
		listaCasosByIdioma = new ArrayList<CasoClinico>();
		
		listaCasosByIdioma = daoCC.getCasosByIdioma(TraducaoBean.getIdiomaAtual());
		
		ArrayList<SelectItem> retorno = new ArrayList<SelectItem>(); 
		
		for(Iterator<CasoClinico> i = listaCasosByIdioma.iterator(); i.hasNext();){
			CasoClinico elementoAux = i.next();
			SelectItem a = new SelectItem(elementoAux.getId(), elementoAux.getNome());
			retorno.add(a);
		}
		
		return retorno; 		
	}
	
	public ArrayList<ParametroClinico> getParametrosClinicos(){
		CasoClinicoDAO daoCC = getCasoClinicoDAO();
		
		return daoCC.getAllParametrosClinicos(casoEscolhido.getId());
	}
	
	public ArrayList<MedicamentoNaoPrescrito> getMedicamentosNaoPrescritos(){
		CasoClinicoDAO daoCC = getCasoClinicoDAO();
		
		return daoCC.getAllMedicamentosNaoPrescritos(casoEscolhido.getId());
	}

	public ArrayList<MedicamentoPrescrito> getMedicamentosPrescritos(){
		CasoClinicoDAO daoCC = getCasoClinicoDAO();
		
		return daoCC.getAllMedicamentosPrescritos(casoEscolhido.getId());
	}
	
	public ArrayList<MedicamentoAnterior> getMedicamentosAnteriores(){
		CasoClinicoDAO daoCC = getCasoClinicoDAO();		 	
		return daoCC.getAllMedicamentosAnteriores(casoEscolhido.getId());	
	}
	
	public String Escolher(){
		
		CasoClinicoDAO daoCC = getCasoClinicoDAO();
		
		//int idAux = (Integer) casoEscolhidoAuxStr.getValue();
				
		System.out.println(casoEscolhidoAuxStr);
		
		casoEscolhido = daoCC.getCasoClinico(casoEscolhidoAuxStr);
		
		return "Escolhido com sucesso";
	}
	
	private CasoClinicoDAO getCasoClinicoDAO(){
		
		CasoClinicoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (CasoClinicoDAO) ctx.lookup("pacienteVirtualEAR/CasoClinicoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	public void addQueixaResposta(boolean ativoQueixa, String descricaoQueixa, RespostaPrimeira newRespostaAluno){
		if (ativoQueixa) {
			QueixaRespostaPrimeiraDAO daoQueixa = getQueixaRespostaPrimeiraDAO();
			QueixaRespostaPrimeira newQueixa = new QueixaRespostaPrimeira();
			newQueixa.setDescricao(descricaoQueixa);
			newQueixa.setRespostaprimeira(newRespostaAluno);
			
			daoQueixa.addQueixaRespostaPrimeira(newQueixa);
		}
		
	}
	/*
	public void addQueixaResposta(boolean ativoQueixa, String descricaoQueixa, String doencaOuPRMQueixa, Integer nPRMQueixa, RespostaAluno newRespostaAluno){
		if (ativoQueixa) {
			QueixaRespostaDAO daoQueixa = getQueixaDAO();
			QueixaResposta newQueixa = new QueixaResposta();
			newQueixa.setDescricao(descricaoQueixa);
			if(doencaOuPRMQueixa.equals("prm")){
				newQueixa.setNumeroPRM(nPRMQueixa);
			}
			else {
				newQueixa.setNumeroPRM(-1);
			}
			newQueixa.setRespostaaluno(newRespostaAluno);
			newQueixa.setNumeroEtapa(1);
			
			daoQueixa.addQueixaPrimeiraEtapaResposta(newQueixa);
		}
		
	}*/


	private QueixaRespostaPrimeiraDAO getQueixaRespostaPrimeiraDAO(){
		
		QueixaRespostaPrimeiraDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (QueixaRespostaPrimeiraDAO) ctx.lookup("pacienteVirtualEAR/QueixaRespostaPrimeiraDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	@SuppressWarnings("unchecked")
	private static InitialContext getInitialContext() throws Exception {
		
		Hashtable properties = new Hashtable();
		
		properties.put("java.naming.factory.initial", 
				"org.jnp.interfaces.NamingContextFactory");
		properties.put("java.naming.factory.url.pkgs", 
				"org.jboss.naming:org.jnp.interfaces");
		properties.put("java.naming.provider.url", 
				"localhost");
		
		return new InitialContext(properties);
	}

	public Integer getCasoEscolhidoAuxStr() {
		return casoEscolhidoAuxStr;
	}

	public void setCasoEscolhidoAuxStr(Integer casoEscolhidoAuxStr) {
		this.casoEscolhidoAuxStr = casoEscolhidoAuxStr;
	}

	public CasoClinico getCasoEscolhido() {
		return casoEscolhido;
	}

	public void setCasoEscolhido(CasoClinico casoEscolhido) {
		this.casoEscolhido = casoEscolhido;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getAltura() {
		return altura;
	}

	public void setAltura(float altura) {
		this.altura = altura;
	}

	public java.util.Date getDataDeRealizacao() {
		return dataDeRealizacao;
	}

	public void setDataDeRealizacao(Date dataDeRealizacao) {
		this.dataDeRealizacao = dataDeRealizacao;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getEscolaridade() {
		return escolaridade;
	}

	public void setEscolaridade(String escolaridade) {
		this.escolaridade = escolaridade;
	}

	public String getFlAlturaCerta() {
		return flAlturaCerta;
	}

	public void setFlAlturaCerta(String flAlturaCerta) {
		this.flAlturaCerta = flAlturaCerta;
	}

	public String getFlBebeAlcool() {
		return flBebeAlcool;
	}

	public void setFlBebeAlcool(String flBebeAlcool) {
		this.flBebeAlcool = flBebeAlcool;
	}

	public String getFlBebeCafe() {
		return flBebeCafe;
	}

	public void setFlBebeCafe(String flBebeCafe) {
		this.flBebeCafe = flBebeCafe;
	}

	public String getFlBebeCafeCerto() {
		return flBebeCafeCerto;
	}

	public void setFlBebeCafeCerto(String flBebeCafeCerto) {
		this.flBebeCafeCerto = flBebeCafeCerto;
	}

	public String getFlDataNascimentoCerta() {
		return flDataNascimentoCerta;
	}

	public void setFlDataNascimentoCerta(String flDataNascimentoCerta) {
		this.flDataNascimentoCerta = flDataNascimentoCerta;
	}

	public String getFlEscolaridadeCerta() {
		return flEscolaridadeCerta;
	}

	public void setFlEscolaridadeCerta(String flEscolaridadeCerta) {
		this.flEscolaridadeCerta = flEscolaridadeCerta;
	}

	public String getFlFuma() {
		return flFuma;
	}

	public void setFlFuma(String flFuma) {
		this.flFuma = flFuma;
	}

	public String getFlFumaCerto() {
		return flFumaCerto;
	}

	public void setFlFumaCerto(String flFumaCerto) {
		this.flFumaCerto = flFumaCerto;
	}

	public String getFlGeneroCerto() {
		return flGeneroCerto;
	}

	public void setFlGeneroCerto(String flGeneroCerto) {
		this.flGeneroCerto = flGeneroCerto;
	}

	public String getFlIMCCerto() {
		return flIMCCerto;
	}

	public void setFlIMCCerto(String flIMCCerto) {
		this.flIMCCerto = flIMCCerto;
	}

	public String getFlNomeCerto() {
		return flNomeCerto;
	}

	public void setFlNomeCerto(String flNomeCerto) {
		this.flNomeCerto = flNomeCerto;
	}

	public String getFlOcupacaoCerta() {
		return flOcupacaoCerta;
	}

	public void setFlOcupacaoCerta(String flOcupacaoCerta) {
		this.flOcupacaoCerta = flOcupacaoCerta;
	}

	public String getFlPesoCerto() {
		return flPesoCerto;
	}

	public void setFlPesoCerto(String flPesoCerto) {
		this.flPesoCerto = flPesoCerto;
	}

	public String getFlPressaoDiastolicaCerta() {
		return flPressaoDiastolicaCerta;
	}

	public void setFlPressaoDiastolicaCerta(String flPressaoDiastolicaCerta) {
		this.flPressaoDiastolicaCerta = flPressaoDiastolicaCerta;
	}

	public String getFlPressaoSistolicaCerta() {
		return flPressaoSistolicaCerta;
	}

	public void setFlPressaoSistolicaCerta(String flPressaoSistolicaCerta) {
		this.flPressaoSistolicaCerta = flPressaoSistolicaCerta;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public float getImc() {
		return imc;
	}

	public void setImc(float imc) {
		this.imc = imc;
	}
	
	public void setImc() {
		this.imc = Float.parseFloat(imcString);
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getOcupacao() {
		return ocupacao;
	}

	public void setOcupacao(String ocupacao) {
		this.ocupacao = ocupacao;
	}

	public float getPeso() {
		return peso;
	}

	public void setPeso(float peso) {
		this.peso = peso;
	}
	
	public void setPeso() {
		this.peso = Float.parseFloat(pesoString);
	}

	public int getPressaoDiastolica() {
		return pressaoDiastolica;
	}

	public void setPressaoDiastolica(int pressaoDiastolica) {
		this.pressaoDiastolica = pressaoDiastolica;
	}
	
	public void setPressaoDiastolica() {
		this.pressaoDiastolica = Integer.parseInt(pressaoDiastolicaString);
	}

	public int getPressaoSistolica() {
		return pressaoSistolica;
	}

	public void setPressaoSistolica(int pressaoSistolica) {
		this.pressaoSistolica = pressaoSistolica;
	}
	
	public void setPressaoSistolica() {
		this.pressaoSistolica = Integer.parseInt(pressaoSistolicaString);
	}

	public String getDataNascimentoAux() {
		return dataNascimentoAux;
	}

	public void setDataNascimentoAux(String dataNascimentoAux) {
		this.dataNascimentoAux = dataNascimentoAux;
	}

	public float getTemperatura() {
		return temperatura;
	}

	public void setTemperatura(float temperatura) {
		this.temperatura = temperatura;
	}
	
	public void setTemperatura() {
		this.temperatura = Float.parseFloat(temperaturaString);
	}

	public String addRespostaPrimeira(){
		
		//FacesContext facesContext = FacesContext.getCurrentInstance();		
		

		AlunoBean alu = new AlunoBean();
		RespostaPrimeiraDAO daoR = getRespostaAlunoPrimeiraDAO();
		AlunoDAO daoA = alu.getAlunoDAO();
		SimpleDateFormat fmt = new SimpleDateFormat("dd/MM/yyyy");
		
		try {
			dataNascimento = fmt.parse(dataNascimentoAux);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  

		ConsultaDAO daoConsulta = getConsultaDAO();
		Consulta newConsulta = new Consulta();

		
		RespostaPrimeira newRespostaPrimeira = new RespostaPrimeira();
		
		DecimalFormat df = new DecimalFormat("#.0");
		
		if ((newAluno.getNrConsulta() == 1) && (newAluno.getNrTentativa() == 1)){

			newConsulta.setFkAluno(newAluno);
			newConsulta.setFkCasoClinico(casoEscolhido);
			
			int idAux = daoConsulta.addConsulta(newConsulta);
			newConsulta.setId(idAux);
			//newConsulta.setId(idAuxiliar);
		}else{
			newConsulta = newAluno.getConsultaAtual();
		}
		
		newRespostaPrimeira.setConsulta(newConsulta);
		
		System.out.println("id: "+newRespostaPrimeira.getConsulta().getId());
		
		System.out.println(newAluno.getMatricula());
		//System.out.println(fmt.format(newRespostaPrimeira.getDataDeRealizacao()));		
		newRespostaPrimeira.setAltura(altura);
		System.out.println(newRespostaPrimeira.getAltura());
		newRespostaPrimeira.setFlAlturaCerta(newRespostaPrimeira.getAltura() == casoEscolhido.getAltura() ? "V" : "F");
		System.out.println(newRespostaPrimeira.getFlAlturaCerta());
		//System.out.println(dataNascimento.getTime());
		newRespostaPrimeira.setDataNascimento(new java.sql.Date(dataNascimento.getTime()));
		System.out.println(fmt.format(newRespostaPrimeira.getDataNascimento()));
		newRespostaPrimeira.setFlDataNascimentoCerta(newRespostaPrimeira.getDataNascimento().equals(casoEscolhido.getDataNascimento()) ? "V" : "F");
		System.out.println(newRespostaPrimeira.getFlDataNascimentoCerta());
		newRespostaPrimeira.setEscolaridade(escolaridade);
		System.out.println(newRespostaPrimeira.getEscolaridade());
		newRespostaPrimeira.setFlEscolaridadeCerta(newRespostaPrimeira.getEscolaridade().equals(casoEscolhido.getEscolaridade()) ? "V" : "F");
		System.out.println(newRespostaPrimeira.getFlEscolaridadeCerta());
		newRespostaPrimeira.setFlBebeAlcool(flBebeAlcool);
		if(flBebeAlcool.equals("V")){
			newRespostaPrimeira.setTipoBebidaAlcoolica(tipoBebidaAlcoolica);
			newRespostaPrimeira.setHistoriaAlcoolAtual(historiaAlcoolAtual);
		}
		newRespostaPrimeira.setHistoriaAlcoolAnterior(historiaAlcoolAnterior);
		newRespostaPrimeira.setFlBebeCafe(flBebeCafe);
		if(flBebeCafe.equals("V")){
			newRespostaPrimeira.setHistoriaCafeAtual(historiaCafeAtual);
		}
		newRespostaPrimeira.setHistoriaCafeAnterior(historiaCafeAnterior);
		newRespostaPrimeira.setFlFuma(flFuma);
		if(flFuma.equals("V")){
			newRespostaPrimeira.setHistoriaTabacoAtual(historiaTabacoAtual);
		}
		newRespostaPrimeira.setHistoriaTabacoAnterior(historiaTabacoAnterior);
		newRespostaPrimeira.setGenero(genero);		
		newRespostaPrimeira.setFlGeneroCerto(newRespostaPrimeira.getGenero().equals(casoEscolhido.getGenero()) ? "V" : "F");
		newRespostaPrimeira.setNome(nome);
		newRespostaPrimeira.setFlNomeCerto(newRespostaPrimeira.getNome().equals(casoEscolhido.getNome()) ? "V" : "F");
		newRespostaPrimeira.setOcupacao(ocupacao);
		newRespostaPrimeira.setFlOcupacaoCerta(newRespostaPrimeira.getOcupacao().equals(casoEscolhido.getOcupacao()) ? "V" : "F");
		newRespostaPrimeira.setPeso(peso);
		newRespostaPrimeira.setFlPesoCerto(newRespostaPrimeira.getPeso() == casoEscolhido.getPeso() ? "V" : "F");
		newRespostaPrimeira.setImc(imc);
		newRespostaPrimeira.setFlIMCCerto(df.format(newRespostaPrimeira.getImc()) == df.format((casoEscolhido.getPeso()/(casoEscolhido.getAltura()*casoEscolhido.getAltura()))) ? "V" : "F");
		newRespostaPrimeira.setPressaoDiastolica(pressaoDiastolica);
		newRespostaPrimeira.setFlPressaoDiastolicaCerta(newRespostaPrimeira.getPressaoDiastolica() == casoEscolhido.getPressaoDiastolica() ? "V" : "F");
		newRespostaPrimeira.setPressaoSistolica(pressaoSistolica);
		newRespostaPrimeira.setFlPressaoSistolicaCerta(newRespostaPrimeira.getPressaoSistolica() == casoEscolhido.getPressaoSistolica() ? "V" : "F");
		newRespostaPrimeira.setTemperatura(temperatura);
		newRespostaPrimeira.setFlTemperaturaCerta(newRespostaPrimeira.getTemperatura() == casoEscolhido.getTemperatura() ? "V" : "F");
		newRespostaPrimeira.setAlergias(alergias);
		newRespostaPrimeira.setMoradiaFamilia(moradiaFamilia);
		newRespostaPrimeira.setMedicosQueAtendem(medicosQueAtendem);
		newRespostaPrimeira.setPlanoDeSaude(planoDeSaude);
		newRespostaPrimeira.setNumeroTentativa(newAluno.getNrTentativa());
		
		if(outroRazaoEncontroCb && outroRazaoEncontroTxt != "")	{
			newRespostaPrimeira.setOutroRazaoEncontroTxt(outroRazaoEncontroTxt);
		}
		else {
			newRespostaPrimeira.setOutroRazaoEncontroTxt("");
			newRespostaPrimeira.setRazaoEncontro(razaoEncontro);
			
		}		
		if(outroExpMed1Cb && outroExpMed1Txt != "")	{
			newRespostaPrimeira.setOutroExpMed1Txt(outroExpMed1Txt);
		}
		else {
			newRespostaPrimeira.setOutroExpMed1Txt("");
			newRespostaPrimeira.setExperienciaMedicamentos1(experienciaMedicamentos1);
		}
		if(outroExpMed2Cb && outroExpMed2Txt != "")	{
			newRespostaPrimeira.setOutroExpMed2Txt(outroExpMed2Txt);
		}
		else {
			newRespostaPrimeira.setOutroExpMed2Txt("");
			newRespostaPrimeira.setExperienciaMedicamentos2(experienciaMedicamentos2);
		}		
		if(outroExpMed3Cb && outroExpMed3Txt != "")	{
			newRespostaPrimeira.setOutroExpMed3Txt(outroExpMed3Txt);
		}
		else {
			newRespostaPrimeira.setOutroExpMed3Txt("");
			newRespostaPrimeira.setExperienciaMedicamentos3(experienciaMedicamentos3);
		}
		if(outroExpMed4Cb && outroExpMed4Txt != "")	{
			newRespostaPrimeira.setOutroExpMed4Txt(outroExpMed4Txt);
		}
		else {
			newRespostaPrimeira.setOutroExpMed4Txt("");
			newRespostaPrimeira.setExperienciaMedicamentos4(experienciaMedicamentos4);
		}
		if(outroExpMed5Cb && outroExpMed5Txt != "")	{
			newRespostaPrimeira.setOutroExpMed5Txt(outroExpMed5Txt);
		}
		else {
			newRespostaPrimeira.setOutroExpMed5Txt("");
			newRespostaPrimeira.setExperienciaMedicamentos5(experienciaMedicamentos5);
		}
		if(outroExpMedConcCb && outroExpMedConcTxt != "")	{
			newRespostaPrimeira.setOutroExpMedConcTxt(outroExpMedConcTxt);
		}
		else {
			newRespostaPrimeira.setOutroExpMedConcTxt("");
			newRespostaPrimeira.setConclusao(conclusao);
		}
		
		newRespostaPrimeira.setNecessidadeAtencao1(necessidadeAtencao1);
		newRespostaPrimeira.setNecessidadeAtencao2(necessidadeAtencao2);
		newRespostaPrimeira.setNecessidadeAtencao3(necessidadeAtencao3);
		newRespostaPrimeira.setNecessidadeAtencao4(necessidadeAtencao4);
		newRespostaPrimeira.setNecessidadeAtencao5(necessidadeAtencao5);
		newRespostaPrimeira.setHistoriafamiliar(historiafamiliar);
		newRespostaPrimeira.setHistoriaMedicaPregressa(historiaMedicaPregressa);
		
		dataDeRealizacao = new Date();
		newRespostaPrimeira.setDataDeRealizacao(new java.sql.Date(dataDeRealizacao.getTime()));
		
		newRespostaPrimeira.setNota(-1);
		
		int id1 = daoR.addRespostaPrimeira(newRespostaPrimeira);
		
		newRespostaPrimeira.setId(id1);
		
		// chamadas para método que persiste as queixas
		addQueixaResposta(ativoSGeral1, descricaoSGeral1, newRespostaPrimeira);
		addQueixaResposta(ativoSGeral2, descricaoSGeral2, newRespostaPrimeira);
		addQueixaResposta(ativoSGeral3, descricaoSGeral3, newRespostaPrimeira);
		addQueixaResposta(ativoSGeral4, descricaoSGeral4, newRespostaPrimeira);
		addQueixaResposta(ativoSGeral5, descricaoSGeral5, newRespostaPrimeira);
		addQueixaResposta(ativoOONB1, descricaoOONB1, newRespostaPrimeira);
		addQueixaResposta(ativoOONB2, descricaoOONB2, newRespostaPrimeira);
		addQueixaResposta(ativoOONB3, descricaoOONB3, newRespostaPrimeira);
		addQueixaResposta(ativoOONB4, descricaoOONB4, newRespostaPrimeira);
		addQueixaResposta(ativoOONB5, descricaoOONB5, newRespostaPrimeira);
		addQueixaResposta(ativoOONB6, descricaoOONB6, newRespostaPrimeira);
		addQueixaResposta(ativoOONB7, descricaoOONB7, newRespostaPrimeira);
		addQueixaResposta(ativoCardio1, descricaoCardio1, newRespostaPrimeira);
		addQueixaResposta(ativoCardio2, descricaoCardio2, newRespostaPrimeira);
		addQueixaResposta(ativoCardio3, descricaoCardio3, newRespostaPrimeira);
		addQueixaResposta(ativoCardio4, descricaoCardio4, newRespostaPrimeira);
		addQueixaResposta(ativoPulm1, descricaoPulm1, newRespostaPrimeira);
		addQueixaResposta(ativoPulm2, descricaoPulm2, newRespostaPrimeira);
		addQueixaResposta(ativoPulm3, descricaoPulm3, newRespostaPrimeira);
		addQueixaResposta(ativoTGI1, descricaoTGI1, newRespostaPrimeira);
		addQueixaResposta(ativoTGI2, descricaoTGI2, newRespostaPrimeira);
		addQueixaResposta(ativoTGI3, descricaoTGI3, newRespostaPrimeira);
		addQueixaResposta(ativoTGI4, descricaoTGI4, newRespostaPrimeira);
		addQueixaResposta(ativoTGI5, descricaoTGI5, newRespostaPrimeira);
		addQueixaResposta(ativoSEndoc1, descricaoSEndoc1, newRespostaPrimeira);
		addQueixaResposta(ativoSEndoc2, descricaoSEndoc2, newRespostaPrimeira);
		addQueixaResposta(ativoSEndoc3, descricaoSEndoc3, newRespostaPrimeira);
		addQueixaResposta(ativoSUrin1, descricaoSUrin1, newRespostaPrimeira);
		addQueixaResposta(ativoSGenitRepr1, descricaoSGenitRepr1, newRespostaPrimeira);
		addQueixaResposta(ativoSGenitRepr2, descricaoSGenitRepr2, newRespostaPrimeira);
		addQueixaResposta(ativoSGenitRepr3, descricaoSGenitRepr3, newRespostaPrimeira);
		addQueixaResposta(ativoSGenitRepr4, descricaoSGenitRepr4, newRespostaPrimeira);
		addQueixaResposta(ativoSGenitRepr5, descricaoSGenitRepr5, newRespostaPrimeira);
		addQueixaResposta(ativoSHematop1, descricaoSHematop1, newRespostaPrimeira);
		addQueixaResposta(ativoSHematop2, descricaoSHematop2, newRespostaPrimeira);
		addQueixaResposta(ativoSHematop3, descricaoSHematop3, newRespostaPrimeira);
		addQueixaResposta(ativoMuscEsq1, descricaoMuscEsq1, newRespostaPrimeira);
		addQueixaResposta(ativoMuscEsq2, descricaoMuscEsq2, newRespostaPrimeira);
		addQueixaResposta(ativoMuscEsq3, descricaoMuscEsq3, newRespostaPrimeira);
		addQueixaResposta(ativoMuscEsq4, descricaoMuscEsq4, newRespostaPrimeira);
		addQueixaResposta(ativoSNervoso1, descricaoSNervoso1, newRespostaPrimeira);
		addQueixaResposta(ativoSNervoso2, descricaoSNervoso2, newRespostaPrimeira);
		addQueixaResposta(ativoSNervoso3, descricaoSNervoso3, newRespostaPrimeira);
		addQueixaResposta(ativoSNervoso4, descricaoSNervoso4, newRespostaPrimeira);
		addQueixaResposta(ativoSNervoso5, descricaoSNervoso5, newRespostaPrimeira);
		addQueixaResposta(ativoSNervoso6, descricaoSNervoso6, newRespostaPrimeira);
		addQueixaResposta(ativoSNervoso7, descricaoSNervoso7, newRespostaPrimeira);
		addQueixaResposta(ativoPele1, descricaoPele1, newRespostaPrimeira);
		addQueixaResposta(ativoPele2, descricaoPele2, newRespostaPrimeira);
		addQueixaResposta(ativoPele3, descricaoPele3, newRespostaPrimeira);
		addQueixaResposta(ativoDoencInfec1, descricaoDoencInfec1, newRespostaPrimeira);
		addQueixaResposta(ativoDoencInfec2, descricaoDoencInfec2, newRespostaPrimeira);
		addQueixaResposta(ativoDoencInfec3, descricaoDoencInfec3, newRespostaPrimeira);
		addQueixaResposta(ativoDoencInfec4, descricaoDoencInfec4, newRespostaPrimeira);
		addQueixaResposta(ativoDoencInfec5, descricaoDoencInfec5, newRespostaPrimeira);
		
		
		
		newAluno.setConsultaAtual(newConsulta);
		newAluno.setLiberado('N');
		
		daoA.progredirConsulta(newAluno);
		
		return "Primeira consulta concluida";
	}

	public String getFlBebeAlcoolCerto() {
		return flBebeAlcoolCerto;
	}

	public void setFlBebeAlcoolCerto(String flBebeAlcoolCerto) {
		this.flBebeAlcoolCerto = flBebeAlcoolCerto;
	}
	
	private RespostaPrimeiraDAO getRespostaAlunoPrimeiraDAO(){
		
		RespostaPrimeiraDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (RespostaPrimeiraDAO) ctx.lookup("pacienteVirtualEAR/RespostaPrimeiraDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	private ConsultaDAO getConsultaDAO(){
		
		ConsultaDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ConsultaDAO) ctx.lookup("pacienteVirtualEAR/ConsultaDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}


	public String getMedicosQueAtendem() {
		return medicosQueAtendem;
	}

	public void setMedicosQueAtendem(String medicosQueAtendem) {
		this.medicosQueAtendem = medicosQueAtendem;
	}

	public String getMoradiaFamilia() {
		return moradiaFamilia;
	}

	public void setMoradiaFamilia(String moradiaFamilia) {
		this.moradiaFamilia = moradiaFamilia;
	}

	public String getAlergias() {
		return alergias;
	}

	public void setAlergias(String alergias) {
		this.alergias = alergias;
	}

	public void setPlanoDeSaude(String planoDeSaude) {
		this.planoDeSaude = planoDeSaude;
	}

	public String getPlanoDeSaude() {
		return planoDeSaude;
	}

	public Aluno getNewAluno() {
		return newAluno;
	}

	public void setNewAluno(Aluno newAluno) {
		this.newAluno = newAluno;
	}

	public String getPesoString() {
		return pesoString;
	}

	public void setPesoString(String pesoString) {
		if (!(pesoString.equals(""))) {
			pesoString = pesoString.replace(",", ".");
			this.pesoString = pesoString;
			setPeso();
		}
	}

	public String getTemperaturaString() {
		return temperaturaString;
	}

	public void setTemperaturaString(String temperaturaString) {
		if (!(temperaturaString.equals(""))) {
			temperaturaString = temperaturaString.replace(",", ".");
			this.temperaturaString = temperaturaString;
			setTemperatura();
		}
	}

	public String getPressaoDiastolicaString() {
		return pressaoDiastolicaString;
	}

	public void setPressaoDiastolicaString(String pressaoDiastolicaString) {
		this.pressaoDiastolicaString = pressaoDiastolicaString;
		setPressaoDiastolica();
	}

	public String getPressaoSistolicaString() {
		return pressaoSistolicaString;
	}

	public void setPressaoSistolicaString(String pressaoSistolicaString) {
		this.pressaoSistolicaString = pressaoSistolicaString;
		setPressaoSistolica();
	}

	public void setImcString(String imcString) {
		if (!(imcString.equals(""))) {
			imcString = imcString.replace(",", ".");
			this.imcString = imcString;
			setImc();
		}
	}

	public String getImcString() {
		return imcString;
	}
	

	public void setAltura() {
		this.altura = Float.parseFloat(alturaString);
	}

	public void setAlturaString(String alturaString) {
		if (!(alturaString.equals(""))) {
			alturaString = alturaString.replace(",", ".");
			this.alturaString = alturaString;
			setAltura();
		}
	}

	public String getAlturaString() {
		return alturaString;
	}

	public void setRespostaAnterior(RespostaPrimeira respostaAnterior) {
		this.respostaAnterior = respostaAnterior;
	}

	public RespostaPrimeira getRespostaAnterior() {
		
		RespostaPrimeiraDAO daoR1 = getRespostaAlunoPrimeiraDAO();
		
		respostaAnterior = daoR1.getAnteriorByConsulta(newAluno.getConsultaAtual());
		
		return respostaAnterior;
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

	public void setRazaoEncontro(String razaoEncontro) {
		this.razaoEncontro = razaoEncontro;
	}

	public String getRazaoEncontro() {
		return razaoEncontro;
	}

	public void setExperienciaMedicamentos1(String experienciaMedicamentos1) {
		this.experienciaMedicamentos1 = experienciaMedicamentos1;
	}

	public String getExperienciaMedicamentos1() {
		return experienciaMedicamentos1;
	}

	public void setExperienciaMedicamentos2(String experienciaMedicamentos2) {
		this.experienciaMedicamentos2 = experienciaMedicamentos2;
	}

	public String getExperienciaMedicamentos2() {
		return experienciaMedicamentos2;
	}

	public void setExperienciaMedicamentos3(String experienciaMedicamentos3) {
		this.experienciaMedicamentos3 = experienciaMedicamentos3;
	}

	public String getExperienciaMedicamentos3() {
		return experienciaMedicamentos3;
	}

	public void setExperienciaMedicamentos4(String experienciaMedicamentos4) {
		this.experienciaMedicamentos4 = experienciaMedicamentos4;
	}

	public String getExperienciaMedicamentos4() {
		return experienciaMedicamentos4;
	}

	public void setExperienciaMedicamentos5(String experienciaMedicamentos5) {
		this.experienciaMedicamentos5 = experienciaMedicamentos5;
	}

	public String getExperienciaMedicamentos5() {
		return experienciaMedicamentos5;
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

	public void setConclusao(String conclusao) {
		this.conclusao = conclusao;
	}

	public String getConclusao() {
		return conclusao;
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
