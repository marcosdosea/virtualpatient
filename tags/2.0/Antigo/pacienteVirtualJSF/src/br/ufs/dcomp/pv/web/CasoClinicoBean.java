package br.ufs.dcomp.pv.web;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.faces.component.UIParameter;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;
import javax.jms.Session;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import br.ufs.dcomp.pv.JPA.CasoClinico;
import br.ufs.dcomp.pv.JPA.CasoClinicoDAO;
import br.ufs.dcomp.pv.JPA.DiarioMedicamentos;
import br.ufs.dcomp.pv.JPA.DiarioMedicamentosCaso;
import br.ufs.dcomp.pv.JPA.DiarioMedicamentosCasoDAO;
import br.ufs.dcomp.pv.JPA.DiarioMedicamentosDAO;
import br.ufs.dcomp.pv.JPA.ExperienciaMedicamentos1Caso;
import br.ufs.dcomp.pv.JPA.ExperienciaMedicamentos1CasoDAO;
import br.ufs.dcomp.pv.JPA.ExperienciaMedicamentos2Caso;
import br.ufs.dcomp.pv.JPA.ExperienciaMedicamentos2CasoDAO;
import br.ufs.dcomp.pv.JPA.ExperienciaMedicamentos3Caso;
import br.ufs.dcomp.pv.JPA.ExperienciaMedicamentos3CasoDAO;
import br.ufs.dcomp.pv.JPA.ExperienciaMedicamentos4Caso;
import br.ufs.dcomp.pv.JPA.ExperienciaMedicamentos4CasoDAO;
import br.ufs.dcomp.pv.JPA.ExperienciaMedicamentos5Caso;
import br.ufs.dcomp.pv.JPA.ExperienciaMedicamentos5CasoDAO;
import br.ufs.dcomp.pv.JPA.ExperienciaMedicamentosConcCaso;
import br.ufs.dcomp.pv.JPA.ExperienciaMedicamentosConcCasoDAO;
import br.ufs.dcomp.pv.JPA.Intervencao;
import br.ufs.dcomp.pv.JPA.IntervencaoDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoAnterior;
import br.ufs.dcomp.pv.JPA.MedicamentoAnteriorDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoNaoPrescrito;
import br.ufs.dcomp.pv.JPA.MedicamentoNaoPrescritoDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoPrescrito;
import br.ufs.dcomp.pv.JPA.MedicamentoPrescritoDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixa;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaDAO;
import br.ufs.dcomp.pv.JPA.ParametroClinico;
import br.ufs.dcomp.pv.JPA.ParametroClinicoDAO;
import br.ufs.dcomp.pv.JPA.Queixa;
import br.ufs.dcomp.pv.JPA.QueixaDAO;
import br.ufs.dcomp.pv.JPA.RazaoEncontroCaso;
import br.ufs.dcomp.pv.JPA.RazaoEncontroCasoDAO;
import br.ufs.dcomp.pv.JPA.Tutor;
import br.ufs.dcomp.pv.JPA.TutorDAO;
import br.ufs.dcomp.pv.JPA.Usuario;


public class CasoClinicoBean {
	
	CasoClinico casoConsultado = new CasoClinico();
		
	private String alergias;
	
	private float altura;
	
	private String alturaString;

	private Date dataNascimento;
	
	private String dataNascimentoAuxiliar;

	private String disponibilidade;

	private String escolaridade;
	
	private String historiaMedicaPregressa;
	
	private String historiafamiliar;

	private String flBebeAlcool;

	private String flBebeCafe;

	private String flFuma;

	private String genero;

	private String medicosQueAtendem;

	private String moradiaFamilia;

	private String nome;

	private String ocupacao;

	private float peso;
	
	private String pesoString;
	
	private String planoDeSaude;

	private int pressaoDiastolica;
	
	private String pressaoDiastolicaString;

	private int pressaoSistolica;
	
	private String pressaoSistolicaString;

	private String relatoDeCasoPrimeiraConsulta;
	
	private String relatoDeCasoSegundaConsulta;
	
	private String relatoDeCasoQuartaConsulta;
	
	private String proxEncontro;	
	
	private String relatoDeCasoTerceiraConsulta;
	
	private String razaoEncontro;
	
	private String experienciaMedicamentos1;
	
	private String experienciaMedicamentos2;
	
	private String experienciaMedicamentos3;
	
	private String experienciaMedicamentos4;
	
	private String experienciaMedicamentos5;
	
	private String experienciaMedicamentosConc;
	
	private String necessidadeAtencao1;
	
	private String necessidadeAtencao2;
	
	private String necessidadeAtencao3;
	
	private String necessidadeAtencao4;
	
	private String necessidadeAtencao5;

	private float temperatura;
	
	private String temperaturaString;
	
	private int pressaoDiastolica2;

	private int pressaoSistolica2;

	private float temperatura2;

	private float peso2;

	private String pressaoSistolica2String;
	
	private String pressaoDiastolica2String;
	
	private String peso2String;
	
	private String temperatura2String;
	
	private String historiaAlcoolAnterior;
	
	private String historiaAlcoolAtual;
	
	private String historiaCafeAnterior;
	
	private String historiaCafeAtual;
	
	private String historiaTabacoAnterior;
	
	private String historiaTabacoAtual;
	
	private String tipoBebidaAlcoolica;
	
	private String nomeDr;
	
	private String telefone;
	
	private String motivosRefMedica;
	
	private String alternativaRefMed1;
	
	private String alternativaRefMed2;
	
	private String referencias;
	
	private String fotoFileName;
	
	private String fotoVisualizada;
	
	private ArrayList<DiarioMedicamentosCasoBean> listaDiarioMed = new ArrayList<DiarioMedicamentosCasoBean>();	

	private LinkedHashMap<String, String> periodoItens;
	private LinkedHashMap<String, String> tipoBebidaItens;
	
	private String diarioMedPeriodo;
	private String diarioMedHorario;
	private String diarioMedQuantidade;
	private String diarioMedDesc;
	private String diarioMedBebida;
	
		
	private ArrayList<CasoClinico> listaCasosByIdioma = new ArrayList<CasoClinico>();
	private ArrayList<ParametroClinicoBean> listaParametros = new ArrayList<ParametroClinicoBean>();
	private ArrayList<MedicamentoNaoPrescritoBean> listaMedicamentoNP = new ArrayList<MedicamentoNaoPrescritoBean>();
	private ArrayList<MedicamentoPrescritoBean> listaMedicamentoP = new ArrayList<MedicamentoPrescritoBean>();
	private ArrayList<MedicamentoAnteriorBean> listaMedicamentoAnt = new ArrayList<MedicamentoAnteriorBean>();
	
	private ArrayList<ParametroClinico> listaParametrosConsulta;
	private ArrayList<MedicamentoNaoPrescrito> listaMedicamentoNPConsulta;
	private ArrayList<MedicamentoPrescrito> listaMedicamentoPConsulta;
	private ArrayList<MedicamentoAnterior> listaMedicamentoAntConsulta;
	private ArrayList<QueixaBean> listaQueixasIniciaisConsulta;
	private ArrayList<QueixaBean> listaQueixasEvolucaoConsulta;
	private ArrayList<Intervencao> listaIntervencoesIniciaisConsulta;
	private ArrayList<Intervencao> listaIntervencoesEvolucaoConsulta;
	private ArrayList<DiarioMedicamentosCaso> listaDiarioMedConsulta = new ArrayList<DiarioMedicamentosCaso>();
	
	private ArrayList<QueixaBean> queixasPRMPrimeiraEtapa = new ArrayList<QueixaBean>();	
	private ArrayList<QueixaBean> queixasPRMSegundaEtapa = new ArrayList<QueixaBean>();
	private ArrayList<QueixaBean> queixasDoencaAgravo = new ArrayList<QueixaBean>();
	private List<IntervencaoBean> intervencoesPrimeiraEtapa = new ArrayList<IntervencaoBean>();
	private List<IntervencaoBean> intervencoesSegundaEtapa = new ArrayList<IntervencaoBean>();

	private String descricao;
	private String unidade;
	private float valor;
	private String valorDeReferencia;
	
	
	private String valorString;
	
	private String NPDescricao;
	private String NPDosagem;
	private String NPPosologia;
	private boolean flItalicoNP;
	
	private String PDescricao;
	private String PDosagem;
	private String PPosologia;
	private String PnmMedico;
	private String PEspecializacaoMedico;
	private boolean flItalicoP;
	
	private String AntDescricao;
	private String AntIndicacao;
	private String AntResposta;
	private String AntPeriodo;

	
	//variáveis necessárias para o cadastro das queixas
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
	private String doencaOuPRMOutro1;
	private String doencaOuPRMOutro2;
	private String doencaOuPRMOutro3;
	private String doencaOuPRMOutro4;
	
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
	private Integer nPRMOutro1;
	private Integer nPRMOutro2;
	private Integer nPRMOutro3;
	private Integer nPRMOutro4;

		
	//descrição das queixas a serem cadastradas
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
	private String descricaoOutro1;
	private String descricaoOutro2;
	private String descricaoOutro3;
	private String descricaoOutro4;

	
	private String PRM;
	private Map<String, Object> PRMsItens;
	private LinkedHashMap<String, String> paramClinicosItens;
	private LinkedHashMap<String, String> situacaoItens;
	private LinkedHashMap<String, String> indicacaoItens;
	
	
	// Variáveis necessárias para o cadastro de intervenções - Primeira e segunda etapas
	private boolean ativoIntervencao1etapa1;
	private boolean ativoIntervencao2etapa1;
	private boolean ativoIntervencao3etapa1;
	private boolean ativoIntervencao4etapa1;
	private boolean ativoIntervencao5etapa1;
	private boolean ativoIntervencao6etapa1;
	private boolean ativoIntervencao7etapa1;
	private boolean ativoIntervencao8etapa1;
	private boolean ativoIntervencao9etapa1;
	private boolean ativoIntervencao10etapa1;
	private boolean ativoIntervencao11etapa1;
	private boolean ativoIntervencao12etapa1;
	private boolean ativoIntervencao13etapa1;
	private boolean ativoIntervencao14etapa1;
	
	private String indicacaoIntervencao1;	
	private String indicacaoIntervencao2;
	private String indicacaoIntervencao3;
	private String indicacaoIntervencao4;
	private String indicacaoIntervencao5;
	private String indicacaoIntervencao6;
	private String indicacaoIntervencao7;
	private String indicacaoIntervencao8;
	private String indicacaoIntervencao9;
	private String indicacaoIntervencao10;
	private String indicacaoIntervencao11;
	private String indicacaoIntervencao12;
	private String indicacaoIntervencao13;
	private String indicacaoIntervencao14;
	private String indicacaoIntervencaoOutro1;
	private String indicacaoIntervencaoOutro2;
	private String indicacaoIntervencaoOutro3;
	private String indicacaoIntervencaoOutro4;
	
	private String descricaoIntervencao1 = TraducaoBean.getTraducao("descricaoIntervencao1");
	private String descricaoIntervencao2 = TraducaoBean.getTraducao("descricaoIntervencao2");
	private String descricaoIntervencao3 = TraducaoBean.getTraducao("descricaoIntervencao3");
	private String descricaoIntervencao4 = TraducaoBean.getTraducao("descricaoIntervencao4");
	private String descricaoIntervencao5 = TraducaoBean.getTraducao("descricaoIntervencao5");
	private String descricaoIntervencao6 = TraducaoBean.getTraducao("descricaoIntervencao6");
	private String descricaoIntervencao7 = TraducaoBean.getTraducao("descricaoIntervencao7");
	private String descricaoIntervencao8 = TraducaoBean.getTraducao("descricaoIntervencao8");
	private String descricaoIntervencao9 = TraducaoBean.getTraducao("descricaoIntervencao9");
	private String descricaoIntervencao10 = TraducaoBean.getTraducao("descricaoIntervencao10");
	private String descricaoIntervencao11 = TraducaoBean.getTraducao("descricaoIntervencao11");
	private String descricaoIntervencao12 = TraducaoBean.getTraducao("descricaoIntervencao12");
	private String descricaoIntervencao13 = TraducaoBean.getTraducao("descricaoIntervencao13");
	private String descricaoIntervencao14 = TraducaoBean.getTraducao("descricaoIntervencao14");
	private String descricaoIntervencaoOutro1;
	private String descricaoIntervencaoOutro2;
	private String descricaoIntervencaoOutro3;
	private String descricaoIntervencaoOutro4;
	
	public CasoClinicoBean(){
		PRMsItens = new LinkedHashMap<String, Object>();
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens1"), 1);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens2"), 2);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens3"), 3);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens4"), 4);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens5"), 5);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens6"), 6);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens7"), 7);
		
		situacaoItens =  new LinkedHashMap<String, String>();
		situacaoItens.put(TraducaoBean.getTraducao("situacao1"),TraducaoBean.getTraducao("situacao1"));
		situacaoItens.put(TraducaoBean.getTraducao("situacao9"),TraducaoBean.getTraducao("situacao9"));
		situacaoItens.put(TraducaoBean.getTraducao("situacao2"),TraducaoBean.getTraducao("situacao2"));
		situacaoItens.put(TraducaoBean.getTraducao("situacao3"),TraducaoBean.getTraducao("situacao3"));
		situacaoItens.put(TraducaoBean.getTraducao("situacao4"),TraducaoBean.getTraducao("situacao4"));
		situacaoItens.put(TraducaoBean.getTraducao("situacao5"),TraducaoBean.getTraducao("situacao5"));
		situacaoItens.put(TraducaoBean.getTraducao("situacao6"),TraducaoBean.getTraducao("situacao6"));
		situacaoItens.put(TraducaoBean.getTraducao("situacao7"),TraducaoBean.getTraducao("situacao7"));
		situacaoItens.put(TraducaoBean.getTraducao("situacao8"),TraducaoBean.getTraducao("situacao8"));
		
		indicacaoItens = new LinkedHashMap<String, String>();
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao1"),TraducaoBean.getTraducao("indicacao1"));
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao2"),TraducaoBean.getTraducao("indicacao2"));
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao3"),TraducaoBean.getTraducao("indicacao3"));
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao4"),TraducaoBean.getTraducao("indicacao4"));
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao5"),TraducaoBean.getTraducao("indicacao5"));
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao6"),TraducaoBean.getTraducao("indicacao6"));
		
		paramClinicosItens =  new LinkedHashMap<String, String>();
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico1"), TraducaoBean.getTraducao("paramClinico1"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico2"), TraducaoBean.getTraducao("paramClinico2"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico3"), TraducaoBean.getTraducao("paramClinico3"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico4"), TraducaoBean.getTraducao("paramClinico4"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico5"), TraducaoBean.getTraducao("paramClinico5"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico6"), TraducaoBean.getTraducao("paramClinico6"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico7"), TraducaoBean.getTraducao("paramClinico7"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico8"), TraducaoBean.getTraducao("paramClinico8"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico9"), TraducaoBean.getTraducao("paramClinico9"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico10"), TraducaoBean.getTraducao("paramClinico10"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico11"), TraducaoBean.getTraducao("paramClinico11"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico12"), TraducaoBean.getTraducao("paramClinico12"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico13"), TraducaoBean.getTraducao("paramClinico13"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico14"), TraducaoBean.getTraducao("paramClinico14"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico15"), TraducaoBean.getTraducao("paramClinico15"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico16"), TraducaoBean.getTraducao("paramClinico16"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico17"), TraducaoBean.getTraducao("paramClinico17"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico18"), TraducaoBean.getTraducao("paramClinico18"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico19"), TraducaoBean.getTraducao("paramClinico19"));	
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico20"), TraducaoBean.getTraducao("paramClinico20"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico21"), TraducaoBean.getTraducao("paramClinico21"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico22"), TraducaoBean.getTraducao("paramClinico22"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico23"), TraducaoBean.getTraducao("paramClinico23"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico24"), TraducaoBean.getTraducao("paramClinico24"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico25"), TraducaoBean.getTraducao("paramClinico25"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico26"), TraducaoBean.getTraducao("paramClinico26"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico27"), TraducaoBean.getTraducao("paramClinico27"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico28"), TraducaoBean.getTraducao("paramClinico28"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico29"), TraducaoBean.getTraducao("paramClinico29"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico30"), TraducaoBean.getTraducao("paramClinico30"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico31"), TraducaoBean.getTraducao("paramClinico31"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico32"), TraducaoBean.getTraducao("paramClinico32"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico33"), TraducaoBean.getTraducao("paramClinico33"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico34"), TraducaoBean.getTraducao("paramClinico34"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico35"), TraducaoBean.getTraducao("paramClinico35"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico36"), TraducaoBean.getTraducao("paramClinico36"));
		
		periodoItens =  new LinkedHashMap<String, String>();
		periodoItens.put(TraducaoBean.getTraducao("manha"),TraducaoBean.getTraducao("manha"));
		periodoItens.put(TraducaoBean.getTraducao("tarde"),TraducaoBean.getTraducao("tarde"));
		periodoItens.put(TraducaoBean.getTraducao("noite"),TraducaoBean.getTraducao("noite"));
		
		tipoBebidaItens = new LinkedHashMap<String, String>();
		tipoBebidaItens.put(TraducaoBean.getTraducao("agua"),TraducaoBean.getTraducao("agua"));
		tipoBebidaItens.put(TraducaoBean.getTraducao("leite"),TraducaoBean.getTraducao("leite"));
		tipoBebidaItens.put(TraducaoBean.getTraducao("suco"),TraducaoBean.getTraducao("suco"));
		tipoBebidaItens.put(TraducaoBean.getTraducao("outro"),TraducaoBean.getTraducao("outro"));
	}

	//Método para pegar a tradução da escolaridade
	private String pegarTraducaoEscolaridade(String esco){
	
		if(esco.equals("fundamental incompleto")){
			return TraducaoBean.getTraducao("fundamentalIncompleto");
		}
		if(esco.equals("fundamental completo")){
			return TraducaoBean.getTraducao("fundamentalCompleto");
		}
		if(esco.equals("medio incompleto")){
			return TraducaoBean.getTraducao("medioIncompleto");
		}
		if(esco.equals("medio completo")){
			return TraducaoBean.getTraducao("medioCompleto");
		}
		if(esco.equals("superior incompleto")){
			return TraducaoBean.getTraducao("superiorIncompleto");
		}
		if(esco.equals("superior completo")){
			return TraducaoBean.getTraducao("superiorCompleto");
		}				
		return esco;		
	}
	private String escolaridadeTraduzida;
	
	public String getEscolaridadeTraduzida() {
		escolaridadeTraduzida = pegarTraducaoEscolaridade(escolaridade);
		return escolaridadeTraduzida;
	}
	
	private String escolaridadeTraduzidaById;
	
	public String getEscolaridadeTraduzidaById() {
		escolaridadeTraduzidaById = pegarTraducaoEscolaridade(casoConsultado.getEscolaridade());
		return escolaridadeTraduzidaById;
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
	
	Integer casoConsultadoAuxStr;
	
	public String Escolher(){
		
		CasoClinicoDAO daoCC = getCasoClinicoDAO();
						
		System.out.println(casoConsultadoAuxStr);
		
		casoConsultado = daoCC.getCasoClinico(casoConsultadoAuxStr);		
		
		return "consultado com sucesso";
	}
	
	//public CasoClinico getCasoClinicoById()

	//método para adicionar as queixas numa lista
	public void addQueixaNumaLista(boolean ativoQueixa, String descricaoQueixa, String doencaOuPRMQueixa, Integer nPRMQueixa){
		if(ativoQueixa){;			
			//Se for do tipo Doença ou Agravo
			if(doencaOuPRMQueixa.equals("D")){ 
				QueixaBean queixaAgrav = new QueixaBean();
				queixaAgrav.setDescricao(descricaoQueixa);
				queixaAgrav.setTipo(doencaOuPRMQueixa);			
				queixaAgrav.setConheceOuPreocupa("");
				queixaAgrav.setPrioridade(0);
				queixaAgrav.setNumeroPRM(-1);
				queixaAgrav.setNumeroEtapa(0);
				this.queixasDoencaAgravo.add(queixaAgrav);
			}
			//Se for do tipo PRM
			else if(doencaOuPRMQueixa.equals("P")) {
				QueixaBean queixa1 = new QueixaBean();
				queixa1.setDescricao(descricaoQueixa);
				queixa1.setTipo(doencaOuPRMQueixa);			
				queixa1.setConheceOuPreocupa("");
				queixa1.setPrioridade(0);
				queixa1.setNumeroEtapa(1);
				queixa1.setNumeroPRM(nPRMQueixa);
				this.queixasPRMPrimeiraEtapa.add(queixa1);

				QueixaBean queixa2 = new QueixaBean();
				queixa2.setDescricao(descricaoQueixa);
				queixa2.setTipo(doencaOuPRMQueixa);			
				queixa2.setConheceOuPreocupa("");
				queixa2.setPrioridade(0);
				queixa2.setNumeroEtapa(2);
				queixa2.setNumeroPRM(nPRMQueixa);
				this.queixasPRMSegundaEtapa.add(queixa2);
			}			
		}		
	}
	
	//método para adicionar as intervenções numa lista
	public void addIntervencaoNumaLista(boolean ativoIntervencao, String indicacao, String descricaoIntervencao, int numeroEtapaIntervencao){
		if(ativoIntervencao){
			IntervencaoBean intervencao = new IntervencaoBean();
			intervencao.setDescricao(descricaoIntervencao);
			intervencao.setIndicacao(indicacao);
						
			if(numeroEtapaIntervencao == 1){
				this.intervencoesPrimeiraEtapa.add(intervencao);
			}
			if(numeroEtapaIntervencao == 2){
				this.intervencoesSegundaEtapa.add(intervencao);
			}
		}
		
	}
	
	//método para adicionar parametro clínico a lista presente no caso clinico
	public String addParam(){
		ParametroClinicoBean newParametro = new ParametroClinicoBean();
		
		if ((descricao == "") || (unidade == "") || (valor == 0) || (valorDeReferencia == "")){
	
			JOptionPane.showMessageDialog(null, "Preencha todos os campos corretamente.");

		}else{
			newParametro.setDescricao(descricao);
			newParametro.setUnidade(unidade);
			newParametro.setValor(valor);
			newParametro.setValorDeReferencia(valorDeReferencia);
			
			
			listaParametros.add(newParametro);
				
			System.out.println(newParametro.getDescricao());
			System.out.println(newParametro.getValor());
			System.out.println(newParametro.getUnidade());
			System.out.println(newParametro.getValorDeReferencia());
			
			System.out.println(listaParametros.contains(newParametro));
			
			setDescricao("");
			setValor(0);
			setValorDeReferencia("");
			setUnidade("");
		}
		return "sucess";
	}
	
	public String removeParam(){
		ParametroClinicoBean newParametro = new ParametroClinicoBean();
		
		newParametro.setDescricao(descricao);
		newParametro.setUnidade(unidade);
		newParametro.setValor(valor);
		newParametro.setValorDeReferencia(valorDeReferencia);
		
		listaParametros.remove(newParametro);
		return "sucess";
	}
	
	//Método para adicionar medicamento não prescrito a lista presente no caso clinico
	public String addMedicamentoNPre(){
		MedicamentoNaoPrescritoBean newMedicamentoNP = new MedicamentoNaoPrescritoBean();
		
		if ((NPDescricao == "") || (NPDosagem == "") || (NPPosologia == "")){
			JOptionPane.showMessageDialog(null, "Preencha todos os campos corretamente.");

		}else{
			newMedicamentoNP.setDescricao(NPDescricao);
			newMedicamentoNP.setDosagem(NPDosagem);
			newMedicamentoNP.setPosologia(NPPosologia);
			newMedicamentoNP.setFlItalico(flItalicoNP);
						
			listaMedicamentoNP.add(newMedicamentoNP);
				
			System.out.println(newMedicamentoNP.getDescricao());
			System.out.println(newMedicamentoNP.getDosagem());
			System.out.println(newMedicamentoNP.getPosologia());
			
			System.out.println(listaMedicamentoNP.contains(newMedicamentoNP));
			
			setNPDescricao("");
			setNPDosagem("");
			setNPPosologia("");
		}
		return "sucess";
	}
	
	//Método para adicionar medicamento anterior a lista presente no caso clinico
	public String addMedicamentoAnterior(){
		MedicamentoAnteriorBean newMedicamentoAnt = new MedicamentoAnteriorBean();
		
		if ((AntDescricao == "") || (AntIndicacao == "") || (AntPeriodo == "") || (AntResposta == "")){
			JOptionPane.showMessageDialog(null, "Preencha todos os campos corretamente.");

		}else{
			newMedicamentoAnt.setDescricao(AntDescricao);
			newMedicamentoAnt.setIndicacao(AntIndicacao);
			newMedicamentoAnt.setPeriodo(AntPeriodo);
			newMedicamentoAnt.setResposta(AntResposta);
						
			getListaMedicamentoAnt().add(newMedicamentoAnt);
				
			System.out.println(newMedicamentoAnt.getDescricao());
			System.out.println(newMedicamentoAnt.getIndicacao());
			System.out.println(newMedicamentoAnt.getResposta());
			System.out.println(newMedicamentoAnt.getPeriodo());
			
			System.out.println(getListaMedicamentoAnt().contains(newMedicamentoAnt));
			
			setAntDescricao("");
			setAntIndicacao("");
			setAntPeriodo("");
			setAntResposta("");
		}
		return "sucess";
	}
	
	/*public String removeMedicamento(){
		ParametroClinicoBean newParametro = new ParametroClinicoBean();
		
		newParametro.setDescricao(descricao);
		newParametro.setUnidade(unidade);
		newParametro.setValor(valor);
		newParametro.setValorDeReferencia(valorDeReferencia);
		
		listaParametros.remove(newParametro);
		return "sucess";
	}*/
	
	//Método para adicionar medicamento prescrito a lista presente no caso clinico
	public String addMedicamentoPre(){
		MedicamentoPrescritoBean newMedicamentoP = new MedicamentoPrescritoBean();
		
		if ((PDescricao == "") || (PDosagem == "") || (PPosologia == "") || (PEspecializacaoMedico == "") || (PnmMedico == "")){
			JOptionPane.showMessageDialog(null, "Preencha todos os campos corretamente.");

		}else{
			newMedicamentoP.setDescricao(PDescricao);
			newMedicamentoP.setDosagem(PDosagem);
			newMedicamentoP.setPosologia(PPosologia);
			newMedicamentoP.setNmmedico(PnmMedico);
			newMedicamentoP.setEspecialidademedico(PEspecializacaoMedico);
			newMedicamentoP.setFlItalico(flItalicoP);
						
			listaMedicamentoP.add(newMedicamentoP);
				
			System.out.println(newMedicamentoP.getDescricao());
			System.out.println(newMedicamentoP.getDosagem());
			System.out.println(newMedicamentoP.getPosologia());
			System.out.println(newMedicamentoP.getNmmedico());
			System.out.println(newMedicamentoP.getEspecialidademedico());
			
			System.out.println(listaMedicamentoP.contains(newMedicamentoP));
			
			setPDescricao("");
			setPDosagem("");
			setPPosologia("");
			setPnmMedico("");
			setPEspecializacaoMedico("");
		}
		return "sucess";
	}
	
	/*public String removeMedicamento(){
		ParametroClinicoBean newParametro = new ParametroClinicoBean();
		
		newParametro.setDescricao(descricao);
		newParametro.setUnidade(unidade);
		newParametro.setValor(valor);
		newParametro.setValorDeReferencia(valorDeReferencia);
		
		listaParametros.remove(newParametro);
		return "sucess";
	}*/

		
	// Métodos de navegação - direciona para a próxima página do cadastro
	public String pagina2() {
		
		FacesContext facesContext = FacesContext.getCurrentInstance();
		
		HttpServletRequest request = (HttpServletRequest) facesContext.getCurrentInstance().getExternalContext().getRequest();
		
		HttpSession session = request.getSession();		
		
		fotoFileName = "";
		
		if(session.getAttribute("fotoFileName") != null && session.getAttribute("fotoFileName") != ""){			
			fotoFileName = (String) session.getAttribute("fotoFileName");
		}
		
		return "pagina2";
	}
	
	public String pagina1() {
		return "pagina1";
	}
	
	public String pagina3() {
		
		queixasDoencaAgravo = new ArrayList<QueixaBean>();	
		queixasPRMPrimeiraEtapa = new ArrayList<QueixaBean>();	
		queixasPRMSegundaEtapa = new ArrayList<QueixaBean>();	
		
		// Adiciona as queixas iniciais numa lista
		addQueixaNumaLista(ativoSGeral1, descricaoSGeral1, doencaOuPRMSGeral1, nPRMSGeral1);
		addQueixaNumaLista(ativoSGeral2, descricaoSGeral2, doencaOuPRMSGeral2, nPRMSGeral2);
		addQueixaNumaLista(ativoSGeral3, descricaoSGeral3, doencaOuPRMSGeral3, nPRMSGeral3);
		addQueixaNumaLista(ativoSGeral4, descricaoSGeral4, doencaOuPRMSGeral4, nPRMSGeral4);
		addQueixaNumaLista(ativoSGeral5, descricaoSGeral5, doencaOuPRMSGeral5, nPRMSGeral5);
		addQueixaNumaLista(ativoOONB1, descricaoOONB1, doencaOuPRMOONB1, nPRMOONB1);
		addQueixaNumaLista(ativoOONB2, descricaoOONB2, doencaOuPRMOONB2, nPRMOONB2);
		addQueixaNumaLista(ativoOONB3, descricaoOONB3, doencaOuPRMOONB3, nPRMOONB3);
		addQueixaNumaLista(ativoOONB4, descricaoOONB4, doencaOuPRMOONB4, nPRMOONB4);
		addQueixaNumaLista(ativoOONB5, descricaoOONB5, doencaOuPRMOONB5, nPRMOONB5);
		addQueixaNumaLista(ativoOONB6, descricaoOONB6, doencaOuPRMOONB6, nPRMOONB6);
		addQueixaNumaLista(ativoOONB7, descricaoOONB7, doencaOuPRMOONB7, nPRMOONB7);
		addQueixaNumaLista(ativoCardio1, descricaoCardio1, doencaOuPRMCardio1, nPRMCardio1);
		addQueixaNumaLista(ativoCardio2, descricaoCardio2, doencaOuPRMCardio2, nPRMCardio2);
		addQueixaNumaLista(ativoCardio3, descricaoCardio3, doencaOuPRMCardio3, nPRMCardio3);
		addQueixaNumaLista(ativoCardio4, descricaoCardio4, doencaOuPRMCardio4, nPRMCardio4);
		addQueixaNumaLista(ativoPulm1, descricaoPulm1, doencaOuPRMPulm1, nPRMPulm1);
		addQueixaNumaLista(ativoPulm2, descricaoPulm2, doencaOuPRMPulm2, nPRMPulm2);
		addQueixaNumaLista(ativoPulm3, descricaoPulm3, doencaOuPRMPulm3, nPRMPulm3);
		addQueixaNumaLista(ativoTGI1, descricaoTGI1, doencaOuPRMTGI1, nPRMTGI1);
		addQueixaNumaLista(ativoTGI2, descricaoTGI2, doencaOuPRMTGI2, nPRMTGI2);
		addQueixaNumaLista(ativoTGI3, descricaoTGI3, doencaOuPRMTGI3, nPRMTGI3);
		addQueixaNumaLista(ativoTGI4, descricaoTGI4, doencaOuPRMTGI4, nPRMTGI4);
		addQueixaNumaLista(ativoTGI5, descricaoTGI5, doencaOuPRMTGI5, nPRMTGI5);
		addQueixaNumaLista(ativoSEndoc1, descricaoSEndoc1, doencaOuPRMSEndoc1, nPRMSEndoc1);
		addQueixaNumaLista(ativoSEndoc2, descricaoSEndoc2, doencaOuPRMSEndoc2, nPRMSEndoc2);
		addQueixaNumaLista(ativoSEndoc3, descricaoSEndoc3, doencaOuPRMSEndoc3, nPRMSEndoc3);
		addQueixaNumaLista(ativoSUrin1, descricaoSUrin1, doencaOuPRMSUrin1, nPRMSUrin1);
		addQueixaNumaLista(ativoSGenitRepr1, descricaoSGenitRepr1, doencaOuPRMSGenitRepr1, nPRMSGenitRepr1);
		addQueixaNumaLista(ativoSGenitRepr2, descricaoSGenitRepr2, doencaOuPRMSGenitRepr2, nPRMSGenitRepr2);
		addQueixaNumaLista(ativoSGenitRepr3, descricaoSGenitRepr3, doencaOuPRMSGenitRepr3, nPRMSGenitRepr3);
		addQueixaNumaLista(ativoSGenitRepr4, descricaoSGenitRepr4, doencaOuPRMSGenitRepr4, nPRMSGenitRepr4);
		addQueixaNumaLista(ativoSGenitRepr5, descricaoSGenitRepr5, doencaOuPRMSGenitRepr5, nPRMSGenitRepr5);
		addQueixaNumaLista(ativoSHematop1, descricaoSHematop1, doencaOuPRMSHematop1, nPRMSHematop1);
		addQueixaNumaLista(ativoSHematop2, descricaoSHematop2, doencaOuPRMSHematop2, nPRMSHematop2);
		addQueixaNumaLista(ativoSHematop3, descricaoSHematop3, doencaOuPRMSHematop3, nPRMSHematop3);
		addQueixaNumaLista(ativoMuscEsq1, descricaoMuscEsq1, doencaOuPRMMuscEsq1, nPRMMuscEsq1);
		addQueixaNumaLista(ativoMuscEsq2, descricaoMuscEsq2, doencaOuPRMMuscEsq2, nPRMMuscEsq2);
		addQueixaNumaLista(ativoMuscEsq3, descricaoMuscEsq3, doencaOuPRMMuscEsq3, nPRMMuscEsq3);
		addQueixaNumaLista(ativoMuscEsq4, descricaoMuscEsq4, doencaOuPRMMuscEsq4, nPRMMuscEsq4);
		addQueixaNumaLista(ativoSNervoso1, descricaoSNervoso1, doencaOuPRMSNervoso1, nPRMSNervoso1);
		addQueixaNumaLista(ativoSNervoso2, descricaoSNervoso2, doencaOuPRMSNervoso2, nPRMSNervoso2);
		addQueixaNumaLista(ativoSNervoso3, descricaoSNervoso3, doencaOuPRMSNervoso3, nPRMSNervoso3);
		addQueixaNumaLista(ativoSNervoso4, descricaoSNervoso4, doencaOuPRMSNervoso4, nPRMSNervoso4);
		addQueixaNumaLista(ativoSNervoso5, descricaoSNervoso5, doencaOuPRMSNervoso5, nPRMSNervoso5);
		addQueixaNumaLista(ativoSNervoso6, descricaoSNervoso6, doencaOuPRMSNervoso6, nPRMSNervoso6);
		addQueixaNumaLista(ativoSNervoso7, descricaoSNervoso7, doencaOuPRMSNervoso7, nPRMSNervoso7);
		addQueixaNumaLista(ativoPele1, descricaoPele1, doencaOuPRMPele1, nPRMPele1);
		addQueixaNumaLista(ativoPele2, descricaoPele2, doencaOuPRMPele2, nPRMPele2);
		addQueixaNumaLista(ativoPele3, descricaoPele3, doencaOuPRMPele3, nPRMPele3);
		addQueixaNumaLista(ativoDoencInfec1, descricaoDoencInfec1, doencaOuPRMDoencInfec1, nPRMDoencInfec1);
		addQueixaNumaLista(ativoDoencInfec2, descricaoDoencInfec2, doencaOuPRMDoencInfec2, nPRMDoencInfec2);
		addQueixaNumaLista(ativoDoencInfec3, descricaoDoencInfec3, doencaOuPRMDoencInfec3, nPRMDoencInfec3);
		addQueixaNumaLista(ativoDoencInfec4, descricaoDoencInfec4, doencaOuPRMDoencInfec4, nPRMDoencInfec4);
		addQueixaNumaLista(ativoDoencInfec5, descricaoDoencInfec5, doencaOuPRMDoencInfec5, nPRMDoencInfec5);
		
		if(descricaoOutro1 != "")
		{
			addQueixaNumaLista(true, descricaoOutro1, doencaOuPRMOutro1, nPRMOutro1);
		}
		if(descricaoOutro2 != "")
		{
			addQueixaNumaLista(true, descricaoOutro2, doencaOuPRMOutro2, nPRMOutro2);
		}
		if(descricaoOutro3 != "")
		{
			addQueixaNumaLista(true, descricaoOutro3, doencaOuPRMOutro3, nPRMOutro3);
		}
		if(descricaoOutro4 != "")
		{
			addQueixaNumaLista(true, descricaoOutro4, doencaOuPRMOutro4, nPRMOutro4);
		}		
		return "pagina3";
	}
	
	public String pagina4() {
		return "pagina4";
	}
	
	public String paginaRefMed(){
		
		intervencoesPrimeiraEtapa = new ArrayList<IntervencaoBean>();

		//Adiciona as intervencões iniciais numa lista
		addIntervencaoNumaLista(ativoIntervencao1etapa1, indicacaoIntervencao1 , descricaoIntervencao1, 1);
		addIntervencaoNumaLista(ativoIntervencao2etapa1, indicacaoIntervencao2 ,  descricaoIntervencao2, 1);
		addIntervencaoNumaLista(ativoIntervencao3etapa1, indicacaoIntervencao3 ,  descricaoIntervencao3, 1);
		addIntervencaoNumaLista(ativoIntervencao4etapa1, indicacaoIntervencao4 ,  descricaoIntervencao4, 1);
		addIntervencaoNumaLista(ativoIntervencao5etapa1, indicacaoIntervencao5 ,  descricaoIntervencao5, 1);
		addIntervencaoNumaLista(ativoIntervencao6etapa1, indicacaoIntervencao6 ,  descricaoIntervencao6, 1);
		addIntervencaoNumaLista(ativoIntervencao7etapa1, indicacaoIntervencao7 ,  descricaoIntervencao7, 1);
		addIntervencaoNumaLista(ativoIntervencao8etapa1, indicacaoIntervencao8 ,  descricaoIntervencao8, 1);
		addIntervencaoNumaLista(ativoIntervencao9etapa1, indicacaoIntervencao9 ,  descricaoIntervencao9, 1);
		addIntervencaoNumaLista(ativoIntervencao10etapa1, indicacaoIntervencao10 ,  descricaoIntervencao10, 1);
		addIntervencaoNumaLista(ativoIntervencao11etapa1, indicacaoIntervencao11 ,  descricaoIntervencao11, 1);
		addIntervencaoNumaLista(ativoIntervencao12etapa1, indicacaoIntervencao12 ,  descricaoIntervencao12, 1);
		addIntervencaoNumaLista(ativoIntervencao13etapa1, indicacaoIntervencao13 ,  descricaoIntervencao13, 1);
		addIntervencaoNumaLista(ativoIntervencao14etapa1, indicacaoIntervencao14 ,  descricaoIntervencao14, 1);
		if(descricaoIntervencaoOutro1 != "")
		{
			addIntervencaoNumaLista(true, indicacaoIntervencaoOutro1 , descricaoIntervencaoOutro1, 1);
		}
		if(descricaoIntervencaoOutro2 != "")
		{
			addIntervencaoNumaLista(true,indicacaoIntervencaoOutro2 ,  descricaoIntervencaoOutro2, 1);
		}
		if(descricaoIntervencaoOutro3 != "")
		{
			addIntervencaoNumaLista(true,indicacaoIntervencaoOutro3 ,  descricaoIntervencaoOutro3, 1);
		}
		if(descricaoIntervencaoOutro4 != "")
		{
			addIntervencaoNumaLista(true,indicacaoIntervencaoOutro4 ,  descricaoIntervencaoOutro4, 1);
		}
		
		return "paginaRefMed";
	}
	
	public String pagina5(){		
		
		return "pagina5";
	}
	
	public String tabelas() {
		
//		for(Iterator<QueixaBean> i = queixasPRMPrimeiraEtapa.iterator(); i.hasNext();){			
//				QueixaBean queixa1 = i.next();
//				QueixaBean queixa2 = new QueixaBean();
//				
//				queixa2.setDescricao(queixa1.getDescricao());
//				queixa2.setTipo(queixa1.getTipo());		
//				queixa2.setPrioridade(queixa1.getPrioridade());
//				queixa2.setNumeroEtapa(2);
//				queixa2.setNumeroPRM(queixa1.getNumeroPRM());
//				
//				ArrayList<MedicamentoQueixaBean> listaMed1 = queixa1.getListaMedicamentos();
//				ArrayList<MedicamentoQueixaBean> listaMed2 = new ArrayList<MedicamentoQueixaBean>();
//				
//				for(Iterator<MedicamentoQueixaBean> j = listaMed1.iterator(); i.hasNext();){	
//					MedicamentoQueixaBean med1 = j.next();
//					MedicamentoQueixaBean med2 = new MedicamentoQueixaBean();
//					
//					med2.setCumprimento(med1.getCumprimento());
//					med2.setDescrição(med1.getDescrição());
//					med2.setDose(med1.getDose());
//					med2.setEfetivo(med1.getEfetivo());
//					med2.setNecessario(med1.getNecessario());
//					med2.setNumeroPRM(med1.getNumeroPRM());
//					med2.setPeriodo(med1.getPeriodo());
//					med2.setSeguro(med1.getSeguro());		
//					
//					listaMed2.add(med2);
//				}
//				
//				this.queixasPRMSegundaEtapa.add(queixa2);	
//		}
		
		return "tabelas";
	}	
	
	//Método para adicionar o caso clínico completo no banco de dados
	public String add(){
		
		CasoClinicoDAO daoC = getCasoClinicoDAO();
		CasoClinico newCasoClinico = new CasoClinico();
		
		MedicamentoQueixaDAO daoMQ = getMedicamentoQueixaDAO();
		
		ParametroClinicoDAO daoP = getParametroClinicoDAO();
		QueixaDAO daoQ = getQueixaDAO();
		MedicamentoNaoPrescritoDAO daoMNP = getMedicamentoNaoPrescritoDAO();
		MedicamentoPrescritoDAO daoMP = getMedicamentoPrescritoDAO();
		MedicamentoAnteriorDAO daoAnt = getMedicamentoAnteriorDAO();
		IntervencaoDAO daoIntervencao = getIntervencaoDAO();
		
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		
		Usuario auxiliar = (Usuario) session.getAttribute("TutorLogado");
		TutorBean tutBean = new TutorBean();
		TutorDAO daoT = tutBean.getTutorDAO();
		
		Tutor tutorLogado = daoT.getTutor(auxiliar.getLogin());
		
		try {
			SimpleDateFormat fmt = new SimpleDateFormat("dd/MM/yyyy");		
			java.util.Date dataaux = fmt.parse(dataNascimentoAuxiliar);
			dataNascimento = new java.sql.Date(dataaux.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		newCasoClinico.setTutor(tutorLogado);
		
		newCasoClinico.setNome(nome);
		newCasoClinico.setGenero(genero);
		newCasoClinico.setAltura(altura);
		newCasoClinico.setAlergias(alergias);
		newCasoClinico.setDataNascimento(dataNascimento);
		newCasoClinico.setDisponibilidade("V");			
		newCasoClinico.setEscolaridade(escolaridade);
		newCasoClinico.setHistoriaMedicaPregressa(historiaMedicaPregressa);
		newCasoClinico.setHistoriafamiliar(historiafamiliar);	
		newCasoClinico.setIdioma(TraducaoBean.getIdiomaAtual());
		newCasoClinico.setFlBebeAlcool(flBebeAlcool);
		if(flBebeAlcool.equals("V")){
			newCasoClinico.setTipoBebidaAlcoolica(tipoBebidaAlcoolica);
			newCasoClinico.setHistoriaAlcoolAtual(historiaAlcoolAtual);
		}
		newCasoClinico.setHistoriaAlcoolAnterior(historiaAlcoolAnterior);
		newCasoClinico.setFlBebeCafe(flBebeCafe);
		if(flBebeCafe.equals("V")){
			newCasoClinico.setHistoriaCafeAtual(historiaCafeAtual);
		}
		newCasoClinico.setHistoriaCafeAnterior(historiaCafeAnterior);
		newCasoClinico.setFlFuma(flFuma);
		if(flFuma.equals("V")){
			newCasoClinico.setHistoriaTabacoAtual(historiaTabacoAtual);
		}
		newCasoClinico.setHistoriaTabacoAnterior(historiaTabacoAnterior);
		newCasoClinico.setMedicosQueAtendem(medicosQueAtendem);
		newCasoClinico.setMoradiaFamilia(moradiaFamilia);
		newCasoClinico.setOcupacao(ocupacao);
		newCasoClinico.setPlanoDeSaude(planoDeSaude);
		newCasoClinico.setPeso(peso);
		newCasoClinico.setPressaoDiastolica(pressaoDiastolica);
		newCasoClinico.setPressaoSistolica(pressaoSistolica);
		newCasoClinico.setRelatoDeCasoPrimeiraConsulta(relatoDeCasoPrimeiraConsulta);
		newCasoClinico.setRelatoDeCasoSegundaConsulta(relatoDeCasoSegundaConsulta);
		newCasoClinico.setRelatoDeCasoTerceiraConsulta(relatoDeCasoTerceiraConsulta);
		newCasoClinico.setRelatoDeCasoQuartaConsulta(relatoDeCasoQuartaConsulta);
		newCasoClinico.setProxEncontro(proxEncontro);
		newCasoClinico.setNecessidadeAtencao1(necessidadeAtencao1);
		newCasoClinico.setNecessidadeAtencao2(necessidadeAtencao2);
		newCasoClinico.setNecessidadeAtencao3(necessidadeAtencao3);
		newCasoClinico.setNecessidadeAtencao4(necessidadeAtencao4);
		newCasoClinico.setNecessidadeAtencao5(necessidadeAtencao5);
		newCasoClinico.setTemperatura(temperatura);
		newCasoClinico.setPeso2(peso2);
		newCasoClinico.setPressaoDiastolica2(pressaoDiastolica2);
		newCasoClinico.setPressaoSistolica2(pressaoSistolica2);
		newCasoClinico.setTemperatura2(temperatura2);
		newCasoClinico.setNomeDr(nomeDr);
		newCasoClinico.setTelefone(telefone);
		newCasoClinico.setMotivosRefMedica(motivosRefMedica);
		newCasoClinico.setAlternativaRefMed1(alternativaRefMed1);
		newCasoClinico.setAlternativaRefMed2(alternativaRefMed2);
		newCasoClinico.setReferencias(referencias);
		newCasoClinico.setFotoFileName(fotoFileName);		
		
		//daoC.addCasoClinico(newCasoClinico);
		newCasoClinico.setId(daoC.addCasoClinico(newCasoClinico));
		
		System.out.println("Minha PK = " + newCasoClinico.getId());
		
		
		RazaoEncontroCaso newRazao = new RazaoEncontroCaso();
		newRazao.setCasoclinico(newCasoClinico);
		newRazao.setDescricao(razaoEncontro);
		getRazaoEncontroCasoDAO().addRazaoEncontroCaso(newRazao);
		
		ExperienciaMedicamentos1Caso newExp1 = new ExperienciaMedicamentos1Caso();
		newExp1.setCasoclinico(newCasoClinico);
		newExp1.setDescricao(experienciaMedicamentos1);
		getExperienciaMedicamentos1CasoDAO().addExperienciaMedicamentos1Caso(newExp1);
		
		ExperienciaMedicamentos2Caso newExp2 = new ExperienciaMedicamentos2Caso();
		newExp2.setCasoclinico(newCasoClinico);
		newExp2.setDescricao(experienciaMedicamentos2);
		getExperienciaMedicamentos2CasoDAO().addExperienciaMedicamentos2Caso(newExp2);
		
		ExperienciaMedicamentos3Caso newExp3 = new ExperienciaMedicamentos3Caso();
		newExp3.setCasoclinico(newCasoClinico);
		newExp3.setDescricao(experienciaMedicamentos3);
		getExperienciaMedicamentos3CasoDAO().addExperienciaMedicamentos3Caso(newExp3);
		
		ExperienciaMedicamentos4Caso newExp4 = new ExperienciaMedicamentos4Caso();
		newExp4.setCasoclinico(newCasoClinico);
		newExp4.setDescricao(experienciaMedicamentos4);
		getExperienciaMedicamentos4CasoDAO().addExperienciaMedicamentos4Caso(newExp4);
		
		ExperienciaMedicamentos5Caso newExp5 = new ExperienciaMedicamentos5Caso();
		newExp5.setCasoclinico(newCasoClinico);
		newExp5.setDescricao(experienciaMedicamentos5);
		getExperienciaMedicamentos5CasoDAO().addExperienciaMedicamentos5Caso(newExp5);
		
		ExperienciaMedicamentosConcCaso newExpConc = new ExperienciaMedicamentosConcCaso();
		newExpConc.setCasoclinico(newCasoClinico);
		newExpConc.setDescricao(experienciaMedicamentosConc);
		getExperienciaMedicamentosConcCasoDAO().addExperienciaMedicamentosConcCaso(newExpConc);
		
		
		for(Iterator<IntervencaoBean> i = intervencoesPrimeiraEtapa.iterator(); i.hasNext();){
			
			IntervencaoBean intervencaoAux = new IntervencaoBean();
			intervencaoAux = i.next();
			Intervencao newIntervencao= new Intervencao();
			
			newIntervencao.setDescricao(intervencaoAux.getDescricao());
			newIntervencao.setCasoclinico(newCasoClinico);
			newIntervencao.setIndicacao(intervencaoAux.getIndicacao());
			newIntervencao.setNumeroEtapa(1);		
			
			daoIntervencao.addIntervencoes(newIntervencao);
		}	
		
		for(Iterator<ParametroClinicoBean> i = listaParametros.iterator(); i.hasNext();){
			
			ParametroClinicoBean parametroAux = new ParametroClinicoBean();
			parametroAux = i.next();
			ParametroClinico newParam = new ParametroClinico();

			newParam.setDescricao(parametroAux.getDescricao());
			newParam.setCasoclinico(newCasoClinico);
			newParam.setUnidade(parametroAux.getUnidade());
			newParam.setValor(parametroAux.getValor());
			newParam.setValorDeReferencia(parametroAux.getValorDeReferencia());
			newParam.setCasoclinico(newCasoClinico);
			
			daoP.addParametroClinico(newParam);
		}
		
		
		for(Iterator<MedicamentoAnteriorBean> i = getListaMedicamentoAnt().iterator(); i.hasNext();){
			
			MedicamentoAnteriorBean medicamentoAntAux = new MedicamentoAnteriorBean();
			medicamentoAntAux = i.next();
			MedicamentoAnterior newMedicamentoAnterior = new MedicamentoAnterior();
			
			newMedicamentoAnterior.setDescricao(medicamentoAntAux.getDescricao());
			newMedicamentoAnterior.setIndicacao(medicamentoAntAux.getIndicacao());
			newMedicamentoAnterior.setResposta(medicamentoAntAux.getResposta());
			newMedicamentoAnterior.setPeriodo(medicamentoAntAux.getPeriodo());
			newMedicamentoAnterior.setCasoclinico(newCasoClinico);			
						
			daoAnt.addMedicamentoAnterior(newMedicamentoAnterior);
		}

		
		for(Iterator<MedicamentoNaoPrescritoBean> i = listaMedicamentoNP.iterator(); i.hasNext();){
			
			MedicamentoNaoPrescritoBean medicamentoNaoAux = new MedicamentoNaoPrescritoBean();
			medicamentoNaoAux = i.next();
			MedicamentoNaoPrescrito newMedicamentoNaoPrescrito = new MedicamentoNaoPrescrito();
			
			newMedicamentoNaoPrescrito.setDescricao(medicamentoNaoAux.getDescricao());
			newMedicamentoNaoPrescrito.setDosagem(medicamentoNaoAux.getDosagem());
			newMedicamentoNaoPrescrito.setPosologia(medicamentoNaoAux.getPosologia());
			newMedicamentoNaoPrescrito.setCasoclinico(newCasoClinico);
			if (medicamentoNaoAux.isFlItalico()){
				newMedicamentoNaoPrescrito.setFlItalico("V");
			}else{
				newMedicamentoNaoPrescrito.setFlItalico("F");
			}
			
			
			daoMNP.addMedicamentoNaoPrescrito(newMedicamentoNaoPrescrito);
		}
		
		for(Iterator<MedicamentoPrescritoBean> i = listaMedicamentoP.iterator(); i.hasNext();){
			
			MedicamentoPrescritoBean medicamentoAux = new MedicamentoPrescritoBean();
			medicamentoAux = i.next();
			MedicamentoPrescrito newMedicamentoPrescrito = new MedicamentoPrescrito();
			
			newMedicamentoPrescrito.setDescricao(medicamentoAux.getDescricao());
			newMedicamentoPrescrito.setDosagem(medicamentoAux.getDosagem());
			newMedicamentoPrescrito.setPosologia(medicamentoAux.getPosologia());
			newMedicamentoPrescrito.setNmMedico(medicamentoAux.getNmmedico());
			newMedicamentoPrescrito.setEspecialidadeMedico(medicamentoAux.getEspecialidademedico());
			newMedicamentoPrescrito.setCasoclinico(newCasoClinico);
			if (medicamentoAux.isFlItalico()){
				newMedicamentoPrescrito.setFlItalico("V");
			}else{
				newMedicamentoPrescrito.setFlItalico("F");
			}
			
			daoMP.addMedicamentoPrescrito(newMedicamentoPrescrito);
		}
		
		DiarioMedicamentosCasoDAO daoDiarioCaso = getDiarioMedicamentosCasoDAO();
		
		for(Iterator<DiarioMedicamentosCasoBean> i = getListaDiarioMed().iterator(); i.hasNext();){
			
			DiarioMedicamentosCasoBean diarioMedAux = new DiarioMedicamentosCasoBean();
			diarioMedAux = i.next();
			DiarioMedicamentosCaso newDiarioMed = new DiarioMedicamentosCaso();
			
			newDiarioMed.setMedicamento(diarioMedAux.getMedicamento());
			newDiarioMed.setHorario(diarioMedAux.getHorario());
			newDiarioMed.setQuantidade(diarioMedAux.getQuantidade());
			newDiarioMed.setPeriodo(diarioMedAux.getPeriodo());		
			newDiarioMed.setTipoBebida(diarioMedAux.getTipoBebida());	
			newDiarioMed.setCasoclinico(newCasoClinico);
						
			daoDiarioCaso.addDiarioMedicamentosCaso(newDiarioMed);
		}
		
		for(Iterator<QueixaBean> i = queixasDoencaAgravo.iterator(); i.hasNext();){
		
			QueixaBean queixaAux = new QueixaBean();
			queixaAux = i.next();
			Queixa newQueixa = new Queixa();
			
			newQueixa.setCasoclinico(newCasoClinico);
			newQueixa.setDescricao(queixaAux.getDescricao());
			newQueixa.setNumeroEtapa(0);
			newQueixa.setNumeroPRM(-1);
			newQueixa.setTipo(queixaAux.getTipo());
			
			newQueixa.setId(daoQ.addQueixas(newQueixa));
		}
		
		for(Iterator<QueixaBean> i = queixasPRMPrimeiraEtapa.iterator(); i.hasNext();){
			
			QueixaBean queixaAux = new QueixaBean();
			queixaAux = i.next();
			Queixa newQueixa = new Queixa();

			newQueixa.setCasoclinico(newCasoClinico);
			newQueixa.setConheceOuPreocupa(queixaAux.getConheceOuPreocupa());
			newQueixa.setDescricao(queixaAux.getDescricao());
			newQueixa.setNumeroEtapa(1);
			newQueixa.setNumeroPRM(queixaAux.getNumeroPRM());
			newQueixa.setPeriodoSurgimento(queixaAux.getPeriodoSurgimento());
			newQueixa.setPrioridade(queixaAux.getPrioridade());
			newQueixa.setTipo(queixaAux.getTipo());
			
			newQueixa.setId(daoQ.addQueixas(newQueixa));
			
			for(Iterator<MedicamentoQueixaBean> j = queixaAux.getListaMedicamentos().iterator(); j.hasNext();){
				
				MedicamentoQueixaBean temp = j.next();
				MedicamentoQueixa newMedQ = new MedicamentoQueixa();
				
				newMedQ.setConheceCumpre(temp.getConheceCumpre());
				newMedQ.setCumprimento(temp.getCumprimento());
				newMedQ.setDescricao(temp.getDescrição());
				newMedQ.setDose(temp.getDose());
				newMedQ.setEfetivo(temp.getEfetivo());
				newMedQ.setNecessario(temp.getNecessario());
				newMedQ.setPeriodo(temp.getPeriodo());
				newMedQ.setQueixa(newQueixa);
				newMedQ.setSeguro(temp.getSeguro());
				newMedQ.setNumeroPRM(temp.getNumeroPRM());
				newMedQ.setAlternativa1(temp.getAlternativa1());
				newMedQ.setAlternativa2(temp.getAlternativa2());
				
				daoMQ.addMedicamentoQueixa(newMedQ);
			}
		}		
		
		for(Iterator<QueixaBean> i = queixasPRMSegundaEtapa.iterator(); i.hasNext();){
			
			QueixaBean queixaAux = new QueixaBean();
			queixaAux = i.next();
			Queixa newQueixa = new Queixa();

			newQueixa.setCasoclinico(newCasoClinico);
			newQueixa.setConheceOuPreocupa(queixaAux.getConheceOuPreocupa());
			newQueixa.setDescricao(queixaAux.getDescricao());
			newQueixa.setNumeroEtapa(2);
			newQueixa.setNumeroPRM(queixaAux.getNumeroPRM());
			newQueixa.setPeriodoSurgimento(queixaAux.getPeriodoSurgimento());
			newQueixa.setPrioridade(queixaAux.getPrioridade());
			newQueixa.setTipo(queixaAux.getTipo());
			
			newQueixa.setId(daoQ.addQueixas(newQueixa));
			
			for(Iterator<MedicamentoQueixaBean> j = queixaAux.getListaMedicamentos().iterator(); j.hasNext();){
				
				MedicamentoQueixaBean temp = j.next();
				MedicamentoQueixa newMedQ = new MedicamentoQueixa();
				
				newMedQ.setConheceCumpre(temp.getConheceCumpre());
				newMedQ.setCumprimento(temp.getCumprimento());
				newMedQ.setDescricao(temp.getDescrição());
				newMedQ.setDose(temp.getDose());
				newMedQ.setEfetivo(temp.getEfetivo());
				newMedQ.setNecessario(temp.getNecessario());
				newMedQ.setPeriodo(temp.getPeriodo());
				newMedQ.setQueixa(newQueixa);
				newMedQ.setSeguro(temp.getSeguro());
				newMedQ.setNumeroPRM(temp.getNumeroPRM());
				newMedQ.setSituacao(temp.getSituacao());
				newMedQ.setAlternativa1(temp.getAlternativa1());
				newMedQ.setAlternativa2(temp.getAlternativa2());
				
				daoMQ.addMedicamentoQueixa(newMedQ);
			}
		}		
		
		return "success";
	}
	
	//Método para adicionar o diario de medicamento numa lista
	public String addDiarioMedicamento()
	{
		DiarioMedicamentosCasoBean newDiarioMed = new DiarioMedicamentosCasoBean();
		
		if ((diarioMedPeriodo == "") || (diarioMedHorario == "") || (diarioMedQuantidade == "") || (diarioMedDesc == "") || (diarioMedBebida == "")){
			JOptionPane.showMessageDialog(null, "Preencha todos os campos corretamente.");
	
		}else{
			newDiarioMed.setPeriodo(diarioMedPeriodo);
			newDiarioMed.setHorario(diarioMedHorario);
			newDiarioMed.setQuantidade(diarioMedQuantidade);
			newDiarioMed.setMedicamento(diarioMedDesc);
			newDiarioMed.setTipoBebida(diarioMedBebida);
						
			getListaDiarioMed().add(newDiarioMed);
			
			setDiarioMedBebida("");
			setDiarioMedDesc("");
			setDiarioMedHorario("");
			setDiarioMedPeriodo("");
			setDiarioMedQuantidade("");		
		}
		
		return "sucess";
	}
	
	//Método para remover o diario de medicamento da lista
	public void removeDiarioMed(ActionEvent event){
		UIParameter val = (UIParameter) event.getComponent().findComponent("removeDiarioMed");
		DiarioMedicamentosCasoBean id = (DiarioMedicamentosCasoBean) val.getValue();
		getListaDiarioMed().remove(id);
	}
	
	// método para persistir as queixas
	public void addQueixa(boolean ativoQueixa, String descricaoQueixa, String doencaOuPRMQueixa, Integer nPRMQueixa, int numeroEtapaQueixa, CasoClinico newCasoClinico){
		if (ativoQueixa) {
			QueixaDAO daoQueixa = getQueixaDAO();
			Queixa newQueixa = new Queixa();
			newQueixa.setDescricao(descricaoQueixa);
			if(doencaOuPRMQueixa.equals("prm")){
				newQueixa.setNumeroPRM(nPRMQueixa);
			}
			else {
				newQueixa.setNumeroPRM(-1);
			}
			newQueixa.setNumeroEtapa(numeroEtapaQueixa);
			newQueixa.setCasoclinico(newCasoClinico);
			
			daoQueixa.addQueixas(newQueixa);
		}
		
	}
	
	public CasoClinicoDAO getCasoClinicoDAO(){
		
		CasoClinicoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (CasoClinicoDAO) ctx.lookup("pacienteVirtualEAR/CasoClinicoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	public MedicamentoQueixaDAO getMedicamentoQueixaDAO(){
		
		MedicamentoQueixaDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (MedicamentoQueixaDAO) ctx.lookup("pacienteVirtualEAR/MedicamentoQueixaDAOBean/remote");
			
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
	
	private ParametroClinicoDAO getParametroClinicoDAO(){
		
		ParametroClinicoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ParametroClinicoDAO) ctx.lookup("pacienteVirtualEAR/ParametroClinicoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	private MedicamentoNaoPrescritoDAO getMedicamentoNaoPrescritoDAO(){
		
		MedicamentoNaoPrescritoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (MedicamentoNaoPrescritoDAO) ctx.lookup("pacienteVirtualEAR/MedicamentoNaoPrescritoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	private MedicamentoPrescritoDAO getMedicamentoPrescritoDAO(){
		
		MedicamentoPrescritoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (MedicamentoPrescritoDAO) ctx.lookup("pacienteVirtualEAR/MedicamentoPrescritoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	private MedicamentoAnteriorDAO getMedicamentoAnteriorDAO() {
		
		MedicamentoAnteriorDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (MedicamentoAnteriorDAO) ctx.lookup("pacienteVirtualEAR/MedicamentoAnteriorDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}

	private QueixaDAO getQueixaDAO(){
			
			QueixaDAO dao = null;
			try {
				InitialContext ctx = getInitialContext();
				dao = (QueixaDAO) ctx.lookup("pacienteVirtualEAR/QueixaDAOBean/remote");
				
			} catch (Exception e) {
				// TODO handle errors
			}
			
			return dao;
		}
	
	private IntervencaoDAO getIntervencaoDAO(){
		
		IntervencaoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (IntervencaoDAO) ctx.lookup("pacienteVirtualEAR/IntervencaoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}

	public CasoClinico getCasoConsultado() {
		return casoConsultado;
	}

	public void setCasoConsultado(CasoClinico casoConsultado) {
		this.casoConsultado = casoConsultado;
	}

	public Integer getCasoConsultadoAuxStr() {
		return casoConsultadoAuxStr;
	}

	public void setCasoConsultadoAuxStr(Integer casoConsultadoAuxStr) {
		this.casoConsultadoAuxStr = casoConsultadoAuxStr;
	}
	
	public ArrayList<MedicamentoPrescrito> getListaMedicamentoPConsulta() {
		
		CasoClinicoBean ccBean = new CasoClinicoBean();
		
		CasoClinicoDAO daoCC = ccBean.getCasoClinicoDAO();
		
		listaMedicamentoPConsulta = daoCC.getAllMedicamentosPrescritos(casoConsultado.getId());
		
		return listaMedicamentoPConsulta;
	}
	
	public ArrayList<MedicamentoNaoPrescrito> getListaMedicamentoNPConsulta() {
		
		CasoClinicoBean ccBean = new CasoClinicoBean();
		
		CasoClinicoDAO daoCC = ccBean.getCasoClinicoDAO();
		
		listaMedicamentoNPConsulta = daoCC.getAllMedicamentosNaoPrescritos(casoConsultado.getId());
		
		return listaMedicamentoNPConsulta;
	}
	
	public ArrayList<QueixaBean> getListaQueixasIniciaisConsulta() {
			
			QueixaDAO daoQ = getQueixaDAO();
			
			ArrayList<Queixa> listaTemp = new ArrayList<Queixa>();
			
			listaTemp = daoQ.getAllOrder(casoConsultado, 1);
					
			MedicamentoQueixaDAO daoMQ = getMedicamentoQueixaDAO();
			
			listaQueixasIniciaisConsulta = new ArrayList<QueixaBean>();
			
			for(Iterator<Queixa> i = listaTemp.iterator(); i.hasNext();){
				Queixa queixaTemp = i.next();
				
				QueixaBean queixaBean = new QueixaBean();
				
				queixaBean.setDescricao(queixaTemp.getDescricao());
				queixaBean.setPeriodoSurgimento(queixaTemp.getPeriodoSurgimento());
				queixaBean.setNumeroPRM(queixaTemp.getNumeroPRM());
				queixaBean.setPrioridade(queixaTemp.getPrioridade());				
				
				//Se for do tipo Doença ou Agravo
				if(queixaTemp.getNumeroPRM() == -1)
				{
					queixaBean.setTipo("D");
				}
				//Se for do tipo PRM
				else
				{
					queixaBean.setTipo("P");
				}	
				
				ArrayList<MedicamentoQueixa> listaMedQAux = new ArrayList<MedicamentoQueixa>();
				
				listaMedQAux = daoMQ.getMedicamentosByQueixa(queixaTemp);
				
				for(Iterator<MedicamentoQueixa> j = listaMedQAux.iterator(); j.hasNext();){
					MedicamentoQueixa medTemp = j.next();
					MedicamentoQueixaBean medBean = new MedicamentoQueixaBean();
					
					medBean.setNumeroPRM(medTemp.getNumeroPRM());
					medBean.setCumprimento(medTemp.getCumprimento());
					medBean.setDescrição(medTemp.getDescricao());
					medBean.setDose(medTemp.getDose());
					medBean.setEfetivo(medTemp.getEfetivo());
					medBean.setNecessario(medTemp.getNecessario());
					medBean.setPeriodo(medTemp.getPeriodo());
					medBean.setSeguro(medTemp.getSeguro());
					medBean.setAlternativa1(medTemp.getAlternativa1());
					medBean.setAlternativa2(medTemp.getAlternativa2());
					
					queixaBean.getListaMedicamentos().add(medBean);
				}
				
				listaQueixasIniciaisConsulta.add(queixaBean);
				
			}
			
			return listaQueixasIniciaisConsulta;		
	}
	
	public ArrayList<QueixaBean> getListaQueixasEvolucaoConsulta() {
		
		QueixaDAO daoQ = getQueixaDAO();
		
		ArrayList<Queixa> listaTemp = new ArrayList<Queixa>();
		
		listaTemp = daoQ.getAllOrder(casoConsultado, 2);
				
		MedicamentoQueixaDAO daoMQ = getMedicamentoQueixaDAO();
		
		listaQueixasEvolucaoConsulta = new ArrayList<QueixaBean>();
		
		for(Iterator<Queixa> i = listaTemp.iterator(); i.hasNext();){
			Queixa queixaTemp = i.next();
			
			QueixaBean queixaBean = new QueixaBean();
			
			queixaBean.setDescricao(queixaTemp.getDescricao());
			queixaBean.setPeriodoSurgimento(queixaTemp.getPeriodoSurgimento());
			queixaBean.setNumeroPRM(queixaTemp.getNumeroPRM());
			queixaBean.setPrioridade(queixaTemp.getPrioridade());
			
			//Se for do tipo Doença ou Agravo
			if(queixaTemp.getNumeroPRM() == -1)
			{
				queixaBean.setTipo("D");
			}
			//Se for do tipo PRM
			else
			{
				queixaBean.setTipo("P");				
			}					
			
			ArrayList<MedicamentoQueixa> listaMedQAux = new ArrayList<MedicamentoQueixa>();
			
			listaMedQAux = daoMQ.getMedicamentosByQueixa(queixaTemp);
			
			for(Iterator<MedicamentoQueixa> j = listaMedQAux.iterator(); j.hasNext();){
				MedicamentoQueixa medTemp = j.next();
				MedicamentoQueixaBean medBean = new MedicamentoQueixaBean();
				
				medBean.setNumeroPRM(medTemp.getNumeroPRM());
				medBean.setCumprimento(medTemp.getCumprimento());
				medBean.setDescrição(medTemp.getDescricao());
				medBean.setDose(medTemp.getDose());
				medBean.setEfetivo(medTemp.getEfetivo());
				medBean.setNecessario(medTemp.getNecessario());
				medBean.setPeriodo(medTemp.getPeriodo());
				medBean.setSeguro(medTemp.getSeguro());
				medBean.setSituacao(medTemp.getSituacao());
				medBean.setAlternativa1(medTemp.getAlternativa1());
				medBean.setAlternativa2(medTemp.getAlternativa2());
				
				queixaBean.getListaMedicamentos().add(medBean);
			}
			
			listaQueixasEvolucaoConsulta.add(queixaBean);
			
		}
		
		return listaQueixasEvolucaoConsulta;		
	}
	
	private DiarioMedicamentosCasoDAO getDiarioMedicamentosCasoDAO() {
		DiarioMedicamentosCasoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (DiarioMedicamentosCasoDAO) ctx.lookup("pacienteVirtualEAR/DiarioMedicamentosCasoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}		
		return dao;
	}
	
	private RazaoEncontroCasoDAO getRazaoEncontroCasoDAO() {
		RazaoEncontroCasoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (RazaoEncontroCasoDAO) ctx.lookup("pacienteVirtualEAR/RazaoEncontroCasoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}		
		return dao;
	}
	
	private ExperienciaMedicamentos1CasoDAO getExperienciaMedicamentos1CasoDAO() {
		ExperienciaMedicamentos1CasoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentos1CasoDAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentos1CasoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}		
		return dao;
	}
	
	private ExperienciaMedicamentos2CasoDAO getExperienciaMedicamentos2CasoDAO() {
		ExperienciaMedicamentos2CasoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentos2CasoDAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentos2CasoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}		
		return dao;
	}
	
	private ExperienciaMedicamentos3CasoDAO getExperienciaMedicamentos3CasoDAO() {
		ExperienciaMedicamentos3CasoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentos3CasoDAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentos3CasoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}		
		return dao;
	}
	
	private ExperienciaMedicamentos4CasoDAO getExperienciaMedicamentos4CasoDAO() {
		ExperienciaMedicamentos4CasoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentos4CasoDAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentos4CasoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}		
		return dao;
	}
	
	private ExperienciaMedicamentos5CasoDAO getExperienciaMedicamentos5CasoDAO() {
		ExperienciaMedicamentos5CasoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentos5CasoDAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentos5CasoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}		
		return dao;
	}
	
	private ExperienciaMedicamentosConcCasoDAO getExperienciaMedicamentosConcCasoDAO() {
		ExperienciaMedicamentosConcCasoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentosConcCasoDAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentosConcCasoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}		
		return dao;
	}
	
	
	public ArrayList<Intervencao> getListaIntervencoesIniciaisConsulta()
	{
		IntervencaoDAO daoI = getIntervencaoDAO();
		
		listaIntervencoesIniciaisConsulta = daoI.getIntervencesByCasoClinico(casoConsultado, 1);
		
		return listaIntervencoesIniciaisConsulta;
	}
	
	public ArrayList<Intervencao> getListaIntervencoesEvolucaoConsulta()
	{
		IntervencaoDAO daoI = getIntervencaoDAO();
		
		listaIntervencoesEvolucaoConsulta = daoI.getIntervencesByCasoClinico(casoConsultado, 2);
		
		return listaIntervencoesEvolucaoConsulta;
	}
	
	public ArrayList<ParametroClinico> getListaParametrosConsulta() {
		
		CasoClinicoBean ccBean = new CasoClinicoBean();
		
		CasoClinicoDAO daoCC = ccBean.getCasoClinicoDAO();
		
		listaParametrosConsulta = daoCC.getAllParametrosClinicos(casoConsultado.getId());
		
		return listaParametrosConsulta;
	}
		
	
	public void setAlergias(String alergias) {
		this.alergias = alergias;
	}


	public String getAlergias() {
		return alergias;
	}


	public float getAltura() {
		return altura;
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

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getDisponibilidade() {
		return disponibilidade;
	}

	public void setDisponibilidade(String disponibilidade) {
		this.disponibilidade = disponibilidade;
	}

	public String getEscolaridade() {
		return escolaridade;
	}

	public void setEscolaridade(String escolaridade) {
		this.escolaridade =escolaridade;
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

	public String getFlFuma() {
		return flFuma;
	}

	public void setFlFuma(String flFuma) {
		this.flFuma = flFuma;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public void setMedicosQueAtendem(String medicosQueAtendem) {
		this.medicosQueAtendem = medicosQueAtendem;
	}


	public String getMedicosQueAtendem() {
		return medicosQueAtendem;
	}


	public void setMoradiaFamilia(String moradiaFamilia) {
		this.moradiaFamilia = moradiaFamilia;
	}


	public String getMoradiaFamilia() {
		return moradiaFamilia;
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
	
	public void setPeso() {
		this.peso = Float.parseFloat(pesoString);
	}

	public void setPesoString(String pesoString) {
		if (!(pesoString.equals(""))) {
			pesoString = pesoString.replace(",", ".");
			this.pesoString = pesoString;
			setPeso();
		}
	}

	public String getPesoString() {
		return pesoString;
	}

	public void setPlanoDeSaude(String planoDeSaude) {
		this.planoDeSaude = planoDeSaude;
	}


	public String getPlanoDeSaude() {
		return planoDeSaude;
	}


	public int getPressaoDiastolica() {
		return pressaoDiastolica;
	}

	public void setPressaoDiastolica() {
		this.pressaoDiastolica = Integer.parseInt(pressaoDiastolicaString);
	}

	public void setPressaoDiastolicaString(String pressaoDiastolicaString) {
		this.pressaoDiastolicaString = pressaoDiastolicaString;
		setPressaoDiastolica();
	}

	public String getPressaoDiastolicaString() {
		return pressaoDiastolicaString;
	}

	public int getPressaoSistolica() {
		return pressaoSistolica;
	}

	public void setPressaoSistolica() {
		this.pressaoSistolica = Integer.parseInt(pressaoSistolicaString);
	}
	

	public void setPressaoSistolicaString(String pressaoSistolicaString) {
		this.pressaoSistolicaString = pressaoSistolicaString;
		setPressaoSistolica();
	}

	public String getPressaoSistolicaString() {
		return pressaoSistolicaString;
	}	


	public String getRelatoDeCasoPrimeiraConsulta() {
		return relatoDeCasoPrimeiraConsulta;
	}

	public void setRelatoDeCasoPrimeiraConsulta(String relatoDeCasoPrimeiraConsulta) {
		this.relatoDeCasoPrimeiraConsulta = relatoDeCasoPrimeiraConsulta;
	}

	public void setRelatoDeCasoTerceiraConsulta(String relatoDeCasoTerceiraConsulta) {
		this.relatoDeCasoTerceiraConsulta = relatoDeCasoTerceiraConsulta;
	}


	public String getRelatoDeCasoTerceiraConsulta() {
		return relatoDeCasoTerceiraConsulta;
	}


	public float getTemperatura() {
		return temperatura;
	}

	public void setTemperatura() {
		this.temperatura = Float.parseFloat(temperaturaString);
	}
	
	public void setTemperaturaString(String temperaturaString) {
		if (!(temperaturaString.equals(""))) {
			temperaturaString = temperaturaString.replace(",", ".");
			this.temperaturaString = temperaturaString;
			setTemperatura();
		}
	}

	public String getTemperaturaString() {
		return temperaturaString;
	}

	public String getDataNascimentoAuxiliar() {
		return dataNascimentoAuxiliar;
	}

	public void setDataNascimentoAuxiliar(String dataNascimentoAuxiliar) {
		this.dataNascimentoAuxiliar = dataNascimentoAuxiliar;
	}
	
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getUnidade() {
		return unidade;
	}
	public void setUnidade(String unidade) {
		this.unidade = unidade;
	}
	
	public String getValorDeReferencia() {
		return valorDeReferencia;
	}
	public void setValorDeReferencia(String valorDeReferencia) {
		this.valorDeReferencia = valorDeReferencia;
	}


	public ArrayList<MedicamentoNaoPrescritoBean> getListaMedicamentoNP() {
		return listaMedicamentoNP;
	}

	public void setListaMedicamentoNP(
			ArrayList<MedicamentoNaoPrescritoBean> listaMedicamentoNP) {
		this.listaMedicamentoNP = listaMedicamentoNP;
	}

	public ArrayList<MedicamentoPrescritoBean> getListaMedicamentoP() {
		return listaMedicamentoP;
	}

	public void setListaMedicamentoP(
			ArrayList<MedicamentoPrescritoBean> listaMedicamentoP) {
		this.listaMedicamentoP = listaMedicamentoP;
	}

	public ArrayList<ParametroClinicoBean> getListaParametros() {
		return listaParametros;
	}
	public void setListaParametros(ArrayList<ParametroClinicoBean> listaParametros) {
		this.listaParametros = listaParametros;
	}	
	
	public void setIntervencoesPrimeiraEtapa(
			ArrayList<IntervencaoBean> intervencoesPrimeiraEtapa) {
		this.intervencoesPrimeiraEtapa = intervencoesPrimeiraEtapa;
	}


	public List<IntervencaoBean> getIntervencoesPrimeiraEtapa() {
		return intervencoesPrimeiraEtapa;
	}


	public void setIntervencoesSegundaEtapa(List<IntervencaoBean> intervencoesSegundaEtapa) {
		this.intervencoesSegundaEtapa = intervencoesSegundaEtapa;
	}


	public List<IntervencaoBean> getIntervencoesSegundaEtapa() {
		return intervencoesSegundaEtapa;
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

	
	
	//getters and setters para as intervenções farmacêuticas
	public boolean isAtivoIntervencao1etapa1() {
		return ativoIntervencao1etapa1;
	}


	public void setAtivoIntervencao1etapa1(boolean ativoIntervencao1etapa1) {
		this.ativoIntervencao1etapa1 = ativoIntervencao1etapa1;
	}


	public boolean isAtivoIntervencao2etapa1() {
		return ativoIntervencao2etapa1;
	}


	public void setAtivoIntervencao2etapa1(boolean ativoIntervencao2etapa1) {
		this.ativoIntervencao2etapa1 = ativoIntervencao2etapa1;
	}


	public boolean isAtivoIntervencao3etapa1() {
		return ativoIntervencao3etapa1;
	}


	public void setAtivoIntervencao3etapa1(boolean ativoIntervencao3etapa1) {
		this.ativoIntervencao3etapa1 = ativoIntervencao3etapa1;
	}


	public boolean isAtivoIntervencao4etapa1() {
		return ativoIntervencao4etapa1;
	}


	public void setAtivoIntervencao4etapa1(boolean ativoIntervencao4etapa1) {
		this.ativoIntervencao4etapa1 = ativoIntervencao4etapa1;
	}


	public boolean isAtivoIntervencao5etapa1() {
		return ativoIntervencao5etapa1;
	}


	public void setAtivoIntervencao5etapa1(boolean ativoIntervencao5etapa1) {
		this.ativoIntervencao5etapa1 = ativoIntervencao5etapa1;
	}


	public boolean isAtivoIntervencao6etapa1() {
		return ativoIntervencao6etapa1;
	}


	public void setAtivoIntervencao6etapa1(boolean ativoIntervencao6etapa1) {
		this.ativoIntervencao6etapa1 = ativoIntervencao6etapa1;
	}


	public boolean isAtivoIntervencao7etapa1() {
		return ativoIntervencao7etapa1;
	}


	public void setAtivoIntervencao7etapa1(boolean ativoIntervencao7etapa1) {
		this.ativoIntervencao7etapa1 = ativoIntervencao7etapa1;
	}


	public boolean isAtivoIntervencao8etapa1() {
		return ativoIntervencao8etapa1;
	}


	public void setAtivoIntervencao8etapa1(boolean ativoIntervencao8etapa1) {
		this.ativoIntervencao8etapa1 = ativoIntervencao8etapa1;
	}


	public boolean isAtivoIntervencao9etapa1() {
		return ativoIntervencao9etapa1;
	}


	public void setAtivoIntervencao9etapa1(boolean ativoIntervencao9etapa1) {
		this.ativoIntervencao9etapa1 = ativoIntervencao9etapa1;
	}


	public boolean isAtivoIntervencao10etapa1() {
		return ativoIntervencao10etapa1;
	}


	public void setAtivoIntervencao10etapa1(boolean ativoIntervencao10etapa1) {
		this.ativoIntervencao10etapa1 = ativoIntervencao10etapa1;
	}


	public boolean isAtivoIntervencao11etapa1() {
		return ativoIntervencao11etapa1;
	}


	public void setAtivoIntervencao11etapa1(boolean ativoIntervencao11etapa1) {
		this.ativoIntervencao11etapa1 = ativoIntervencao11etapa1;
	}

	public String getDescricaoIntervencao1() {
		return descricaoIntervencao1;
	}


	public String getDescricaoIntervencao2() {
		return descricaoIntervencao2;
	}


	public String getDescricaoIntervencao3() {
		return descricaoIntervencao3;
	}


	public String getDescricaoIntervencao4() {
		return descricaoIntervencao4;
	}


	public String getDescricaoIntervencao5() {
		return descricaoIntervencao5;
	}


	public String getDescricaoIntervencao6() {
		return descricaoIntervencao6;
	}


	public String getDescricaoIntervencao7() {
		return descricaoIntervencao7;
	}


	public String getDescricaoIntervencao8() {
		return descricaoIntervencao8;
	}


	public String getDescricaoIntervencao9() {
		return descricaoIntervencao9;
	}


	public String getDescricaoIntervencao10() {
		return descricaoIntervencao10;
	}


	public String getDescricaoIntervencao11() {
		return descricaoIntervencao11;
	}

	public String getNPDescricao() {
		return NPDescricao;
	}

	public void setNPDescricao(String nPDescricao) {
		NPDescricao = nPDescricao;
	}

	public String getNPDosagem() {
		return NPDosagem;
	}

	public void setNPDosagem(String nPDosagem) {
		NPDosagem = nPDosagem;
	}

	public String getNPPosologia() {
		return NPPosologia;
	}

	public void setNPPosologia(String nPPosologia) {
		NPPosologia = nPPosologia;
	}

	public String getPDescricao() {
		return PDescricao;
	}

	public void setPDescricao(String pDescricao) {
		PDescricao = pDescricao;
	}

	public String getPDosagem() {
		return PDosagem;
	}

	public void setPDosagem(String pDosagem) {
		PDosagem = pDosagem;
	}

	public String getPPosologia() {
		return PPosologia;
	}

	public void setPPosologia(String pPosologia) {
		PPosologia = pPosologia;
	}

	public String getPnmMedico() {
		return PnmMedico;
	}

	public void setPnmMedico(String pnmMedico) {
		PnmMedico = pnmMedico;
	}

	public String getPEspecializacaoMedico() {
		return PEspecializacaoMedico;
	}

	public void setPEspecializacaoMedico(String pEspecializacaoMedico) {
		PEspecializacaoMedico = pEspecializacaoMedico;
	}

	public void removeMedicamentoP(ActionEvent event){
		UIParameter val = (UIParameter) event.getComponent().findComponent("removeMP");
		MedicamentoPrescritoBean id = (MedicamentoPrescritoBean) val.getValue();
		listaMedicamentoP.remove(id);
	}

	public void removeMedicamentoNP(ActionEvent event){
		UIParameter val = (UIParameter) event.getComponent().findComponent("removeMNP");
		MedicamentoNaoPrescritoBean id = (MedicamentoNaoPrescritoBean) val.getValue();
		listaMedicamentoNP.remove(id);
	}
	
	public void removeMedicamentoAnt(ActionEvent event){
		UIParameter val = (UIParameter) event.getComponent().findComponent("removeAnt");
		MedicamentoAnteriorBean id = (MedicamentoAnteriorBean) val.getValue();
		getListaMedicamentoAnt().remove(id);
	}
	
	public void removeParametro(ActionEvent event){
		UIParameter val = (UIParameter) event.getComponent().findComponent("removePa");
		ParametroClinicoBean id = (ParametroClinicoBean) val.getValue();
		listaParametros.remove(id);
	}
	
	public void removeMedicamentoQueixa(ActionEvent event){
		UIParameter val = (UIParameter) event.getComponent().findComponent("removeMQ");
		UIParameter val2 = (UIParameter) event.getComponent().findComponent("queixaParam");
		MedicamentoQueixaBean id = (MedicamentoQueixaBean) val.getValue();
		QueixaBean queixa = (QueixaBean) val2.getValue();
		queixa.getListaMedicamentos().remove(id);
		//listaMedicamentos.remove(id);
	}
	
	public float getPeso2() {
		return peso2;
	}
	
	public void setPeso2() {
		this.peso2 = Float.parseFloat(peso2String);
	}

	public void setPeso2String(String peso2String) {
		if (!(peso2String.equals(""))) {
			peso2String = peso2String.replace(",", ".");
			this.peso2String = peso2String;
			setPeso2();
		}
	}

	public String getPeso2String() {
		return peso2String;
	}
	
	public float getTemperatura2() {
		return temperatura2;
	}

	public void setTemperatura2() {
		this.temperatura2 = Float.parseFloat(temperatura2String);
	}
	
	public void setTemperatura2String(String temperatura2String) {
		if (!(temperatura2String.equals(""))) {
			temperatura2String = temperatura2String.replace(",", ".");
			this.temperatura2String = temperatura2String;
			setTemperatura2();
		}
	}

	public String getTemperatura2String() {
		return temperatura2String;
	}

	public void setPressaoSistolica2String(String pressaoSistolica2String) {
		this.pressaoSistolica2String = pressaoSistolica2String;
		setPressaoSistolica2();
	}

	public String getPressaoSistolica2String() {
		return pressaoSistolica2String;
	}

	public void setPressaoSistolica2() {
		this.pressaoSistolica2 = Integer.parseInt(pressaoSistolica2String);
	}

	public int getPressaoSistolica2() {
		return pressaoSistolica2;
	}
	
	public void setPressaoDiastolica2() {
		this.pressaoDiastolica2 = Integer.parseInt(pressaoDiastolica2String);
	}

	public void setPressaoDiastolica2String(String pressaoDiastolica2String) {
		this.pressaoDiastolica2String = pressaoDiastolica2String;
		setPressaoDiastolica2();
	}

	public String getPressaoDiastolica2String() {
		return pressaoDiastolica2String;
	}

	public int getPressaoDiastolica2() {
		return pressaoDiastolica2;
	}
	
	public void setValorString(String valorString) {
		if (!(valorString.equals(""))) {
			valorString = valorString.replace(",", ".");
			this.valorString = valorString;
			setValor();
		}
	}

	public String getValorString() {
		return valorString;
	}
	
	public void setValor() {
		this.valor = Float.parseFloat(valorString);
	}

	
	public float getValor() {
		return valor;
	}
	public void setValor(float valor) {
		this.valor = valor;
	}

	public void setFlItalicoNP(boolean flItalicoNP) {
		this.flItalicoNP = flItalicoNP;
	}

	public boolean isFlItalicoNP() {
		return flItalicoNP;
	}

	public void setFlItalicoP(boolean flItalicoP) {
		this.flItalicoP = flItalicoP;
	}

	public boolean isFlItalicoP() {
		return flItalicoP;
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

	public void setTipoBebidaAlcoolica(String tipoBebidaAlcoolica) {
		this.tipoBebidaAlcoolica = tipoBebidaAlcoolica;
	}

	public String getTipoBebidaAlcoolica() {
		return tipoBebidaAlcoolica;
	}

	public void setAltura(float altura) {
		this.altura = altura;
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

	public void setAntDescricao(String antDescricao) {
		AntDescricao = antDescricao;
	}

	public String getAntDescricao() {
		return AntDescricao;
	}

	public void setAntIndicacao(String antIndicacao) {
		AntIndicacao = antIndicacao;
	}

	public String getAntIndicacao() {
		return AntIndicacao;
	}

	public void setAntResposta(String antResposta) {
		AntResposta = antResposta;
	}

	public String getAntResposta() {
		return AntResposta;
	}

	public void setAntPeriodo(String antPeriodo) {
		AntPeriodo = antPeriodo;
	}

	public String getAntPeriodo() {
		return AntPeriodo;
	}

	public void setListaMedicamentoAnt(ArrayList<MedicamentoAnteriorBean> listaMedicamentoAnt) {
		this.listaMedicamentoAnt = listaMedicamentoAnt;
	}

	public ArrayList<MedicamentoAnteriorBean> getListaMedicamentoAnt() {
		return listaMedicamentoAnt;
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
	
	public Map<String, String> getParamClinicosItens() {
		
		paramClinicosItens =  new LinkedHashMap<String, String>();
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico1"), TraducaoBean.getTraducao("paramClinico1"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico2"), TraducaoBean.getTraducao("paramClinico2"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico3"), TraducaoBean.getTraducao("paramClinico3"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico4"), TraducaoBean.getTraducao("paramClinico4"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico5"), TraducaoBean.getTraducao("paramClinico5"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico6"), TraducaoBean.getTraducao("paramClinico6"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico7"), TraducaoBean.getTraducao("paramClinico7"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico8"), TraducaoBean.getTraducao("paramClinico8"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico9"), TraducaoBean.getTraducao("paramClinico9"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico10"), TraducaoBean.getTraducao("paramClinico10"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico11"), TraducaoBean.getTraducao("paramClinico11"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico12"), TraducaoBean.getTraducao("paramClinico12"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico13"), TraducaoBean.getTraducao("paramClinico13"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico14"), TraducaoBean.getTraducao("paramClinico14"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico15"), TraducaoBean.getTraducao("paramClinico15"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico16"), TraducaoBean.getTraducao("paramClinico16"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico17"), TraducaoBean.getTraducao("paramClinico17"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico18"), TraducaoBean.getTraducao("paramClinico18"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico19"), TraducaoBean.getTraducao("paramClinico19"));	
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico20"), TraducaoBean.getTraducao("paramClinico20"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico21"), TraducaoBean.getTraducao("paramClinico21"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico22"), TraducaoBean.getTraducao("paramClinico22"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico23"), TraducaoBean.getTraducao("paramClinico23"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico24"), TraducaoBean.getTraducao("paramClinico24"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico25"), TraducaoBean.getTraducao("paramClinico25"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico26"), TraducaoBean.getTraducao("paramClinico26"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico27"), TraducaoBean.getTraducao("paramClinico27"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico28"), TraducaoBean.getTraducao("paramClinico28"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico29"), TraducaoBean.getTraducao("paramClinico29"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico30"), TraducaoBean.getTraducao("paramClinico30"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico31"), TraducaoBean.getTraducao("paramClinico31"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico32"), TraducaoBean.getTraducao("paramClinico32"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico33"), TraducaoBean.getTraducao("paramClinico33"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico34"), TraducaoBean.getTraducao("paramClinico34"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico35"), TraducaoBean.getTraducao("paramClinico35"));
		paramClinicosItens.put(TraducaoBean.getTraducao("paramClinico36"), TraducaoBean.getTraducao("paramClinico36"));
		
		return paramClinicosItens;
	}

	public void setParamClinicosItens(LinkedHashMap<String, String> paramClinicosItens) {
		this.paramClinicosItens = paramClinicosItens;
	}

	public void setDoencaOuPRMOutro1(String doencaOuPRMOutro1) {
		this.doencaOuPRMOutro1 = doencaOuPRMOutro1;
	}

	public String getDoencaOuPRMOutro1() {
		return doencaOuPRMOutro1;
	}

	public void setDoencaOuPRMOutro2(String doencaOuPRMOutro2) {
		this.doencaOuPRMOutro2 = doencaOuPRMOutro2;
	}

	public String getDoencaOuPRMOutro2() {
		return doencaOuPRMOutro2;
	}

	public void setDoencaOuPRMOutro3(String doencaOuPRMOutro3) {
		this.doencaOuPRMOutro3 = doencaOuPRMOutro3;
	}

	public String getDoencaOuPRMOutro3() {
		return doencaOuPRMOutro3;
	}

	public void setDoencaOuPRMOutro4(String doencaOuPRMOutro4) {
		this.doencaOuPRMOutro4 = doencaOuPRMOutro4;
	}

	public String getDoencaOuPRMOutro4() {
		return doencaOuPRMOutro4;
	}

	public void setnPRMOutro1(Integer nPRMOutro1) {
		this.nPRMOutro1 = nPRMOutro1;
	}

	public Integer getnPRMOutro1() {
		return nPRMOutro1;
	}

	public void setnPRMOutro2(Integer nPRMOutro2) {
		this.nPRMOutro2 = nPRMOutro2;
	}

	public Integer getnPRMOutro2() {
		return nPRMOutro2;
	}

	public void setnPRMOutro3(Integer nPRMOutro3) {
		this.nPRMOutro3 = nPRMOutro3;
	}

	public Integer getnPRMOutro3() {
		return nPRMOutro3;
	}

	public void setnPRMOutro4(Integer nPRMOutro4) {
		this.nPRMOutro4 = nPRMOutro4;
	}

	public Integer getnPRMOutro4() {
		return nPRMOutro4;
	}

	public void setDescricaoOutro1(String descricaoOutro1) {
		this.descricaoOutro1 = descricaoOutro1;
	}

	public String getDescricaoOutro1() {
		return descricaoOutro1;
	}

	public void setDescricaoOutro2(String descricaoOutro2) {
		this.descricaoOutro2 = descricaoOutro2;
	}

	public String getDescricaoOutro2() {
		return descricaoOutro2;
	}

	public void setDescricaoOutro3(String descricaoOutro3) {
		this.descricaoOutro3 = descricaoOutro3;
	}

	public String getDescricaoOutro3() {
		return descricaoOutro3;
	}

	public void setDescricaoOutro4(String descricaoOutro4) {
		this.descricaoOutro4 = descricaoOutro4;
	}

	public String getDescricaoOutro4() {
		return descricaoOutro4;
	}

	public void setDescricaoIntervencao12(String descricaoIntervencao12) {
		this.descricaoIntervencao12 = descricaoIntervencao12;
	}

	public String getDescricaoIntervencao12() {
		return descricaoIntervencao12;
	}

	public void setDescricaoIntervencao13(String descricaoIntervencao13) {
		this.descricaoIntervencao13 = descricaoIntervencao13;
	}

	public String getDescricaoIntervencao13() {
		return descricaoIntervencao13;
	}

	public void setDescricaoIntervencao14(String descricaoIntervencao14) {
		this.descricaoIntervencao14 = descricaoIntervencao14;
	}

	public String getDescricaoIntervencao14() {
		return descricaoIntervencao14;
	}

	public void setDescricaoIntervencaoOutro1(String descricaoIntervencaoOutro1) {
		this.descricaoIntervencaoOutro1 = descricaoIntervencaoOutro1;
	}

	public String getDescricaoIntervencaoOutro1() {
		return descricaoIntervencaoOutro1;
	}

	public void setDescricaoIntervencaoOutro2(String descricaoIntervencaoOutro2) {
		this.descricaoIntervencaoOutro2 = descricaoIntervencaoOutro2;
	}

	public String getDescricaoIntervencaoOutro2() {
		return descricaoIntervencaoOutro2;
	}

	public void setAtivoIntervencao12etapa1(boolean ativoIntervencao12etapa1) {
		this.ativoIntervencao12etapa1 = ativoIntervencao12etapa1;
	}

	public boolean isAtivoIntervencao12etapa1() {
		return ativoIntervencao12etapa1;
	}

	public void setAtivoIntervencao13etapa1(boolean ativoIntervencao13etapa1) {
		this.ativoIntervencao13etapa1 = ativoIntervencao13etapa1;
	}

	public boolean isAtivoIntervencao13etapa1() {
		return ativoIntervencao13etapa1;
	}

	public void setAtivoIntervencao14etapa1(boolean ativoIntervencao14etapa1) {
		this.ativoIntervencao14etapa1 = ativoIntervencao14etapa1;
	}

	public boolean isAtivoIntervencao14etapa1() {
		return ativoIntervencao14etapa1;
	}

	public void setIndicacaoIntervencao1(String indicacaoIntervencao1) {
		this.indicacaoIntervencao1 = indicacaoIntervencao1;
	}

	public String getIndicacaoIntervencao1() {
		return indicacaoIntervencao1;
	}

	public void setIndicacaoIntervencao2(String indicacaoIntervencao2) {
		this.indicacaoIntervencao2 = indicacaoIntervencao2;
	}

	public String getIndicacaoIntervencao2() {
		return indicacaoIntervencao2;
	}

	public void setIndicacaoIntervencao3(String indicacaoIntervencao3) {
		this.indicacaoIntervencao3 = indicacaoIntervencao3;
	}

	public String getIndicacaoIntervencao3() {
		return indicacaoIntervencao3;
	}

	public void setIndicacaoIntervencao4(String indicacaoIntervencao4) {
		this.indicacaoIntervencao4 = indicacaoIntervencao4;
	}

	public String getIndicacaoIntervencao4() {
		return indicacaoIntervencao4;
	}

	public void setIndicacaoIntervencao5(String indicacaoIntervencao5) {
		this.indicacaoIntervencao5 = indicacaoIntervencao5;
	}

	public String getIndicacaoIntervencao5() {
		return indicacaoIntervencao5;
	}

	public void setIndicacaoIntervencao6(String indicacaoIntervencao6) {
		this.indicacaoIntervencao6 = indicacaoIntervencao6;
	}

	public String getIndicacaoIntervencao6() {
		return indicacaoIntervencao6;
	}

	public void setIndicacaoIntervencao7(String indicacaoIntervencao7) {
		this.indicacaoIntervencao7 = indicacaoIntervencao7;
	}

	public String getIndicacaoIntervencao7() {
		return indicacaoIntervencao7;
	}

	public void setIndicacaoIntervencao8(String indicacaoIntervencao8) {
		this.indicacaoIntervencao8 = indicacaoIntervencao8;
	}

	public String getIndicacaoIntervencao8() {
		return indicacaoIntervencao8;
	}

	public void setIndicacaoIntervencao9(String indicacaoIntervencao9) {
		this.indicacaoIntervencao9 = indicacaoIntervencao9;
	}

	public String getIndicacaoIntervencao9() {
		return indicacaoIntervencao9;
	}

	public void setIndicacaoIntervencao10(String indicacaoIntervencao10) {
		this.indicacaoIntervencao10 = indicacaoIntervencao10;
	}

	public String getIndicacaoIntervencao10() {
		return indicacaoIntervencao10;
	}

	public void setIndicacaoIntervencao11(String indicacaoIntervencao11) {
		this.indicacaoIntervencao11 = indicacaoIntervencao11;
	}

	public String getIndicacaoIntervencao11() {
		return indicacaoIntervencao11;
	}

	public void setIndicacaoIntervencao12(String indicacaoIntervencao12) {
		this.indicacaoIntervencao12 = indicacaoIntervencao12;
	}

	public String getIndicacaoIntervencao12() {
		return indicacaoIntervencao12;
	}

	public void setIndicacaoIntervencao13(String indicacaoIntervencao13) {
		this.indicacaoIntervencao13 = indicacaoIntervencao13;
	}

	public String getIndicacaoIntervencao13() {
		return indicacaoIntervencao13;
	}

	public void setIndicacaoIntervencao14(String indicacaoIntervencao14) {
		this.indicacaoIntervencao14 = indicacaoIntervencao14;
	}

	public String getIndicacaoIntervencao14() {
		return indicacaoIntervencao14;
	}

	public void setIndicacaoIntervencaoOutro1(String indicacaoIntervencaoOutro1) {
		this.indicacaoIntervencaoOutro1 = indicacaoIntervencaoOutro1;
	}

	public String getIndicacaoIntervencaoOutro1() {
		return indicacaoIntervencaoOutro1;
	}

	public void setIndicacaoIntervencaoOutro2(String indicacaoIntervencaoOutro2) {
		this.indicacaoIntervencaoOutro2 = indicacaoIntervencaoOutro2;
	}

	public String getIndicacaoIntervencaoOutro2() {
		return indicacaoIntervencaoOutro2;
	}

	public ArrayList<QueixaBean> getQueixasDoencaAgravo() {
		return queixasDoencaAgravo;
	}

	public void setQueixasDoencaAgravo(ArrayList<QueixaBean> queixasDoencaAgravo) {
		this.queixasDoencaAgravo = queixasDoencaAgravo;
	}

	public void setQueixasPRMPrimeiraEtapa(ArrayList<QueixaBean> queixasPRMPrimeiraEtapa) {
		this.queixasPRMPrimeiraEtapa = queixasPRMPrimeiraEtapa;
	}

	public ArrayList<QueixaBean> getQueixasPRMPrimeiraEtapa() {
		return queixasPRMPrimeiraEtapa;
	}

	public void setQueixasPRMSegundaEtapa(ArrayList<QueixaBean> queixasPRMSegundaEtapa) {
		this.queixasPRMSegundaEtapa = queixasPRMSegundaEtapa;
	}

	public ArrayList<QueixaBean> getQueixasPRMSegundaEtapa() {
		return queixasPRMSegundaEtapa;
	}

	public void setSituacaoItens(LinkedHashMap<String, String> situacaoItens) {
		this.situacaoItens = situacaoItens;
	}

	public LinkedHashMap<String, String> getSituacaoItens() {
		
		situacaoItens =  new LinkedHashMap<String, String>();
		situacaoItens.put(TraducaoBean.getTraducao("situacao1"),TraducaoBean.getTraducao("situacao1"));
		situacaoItens.put(TraducaoBean.getTraducao("situacao9"),TraducaoBean.getTraducao("situacao9"));
		situacaoItens.put(TraducaoBean.getTraducao("situacao2"),TraducaoBean.getTraducao("situacao2"));
		situacaoItens.put(TraducaoBean.getTraducao("situacao3"),TraducaoBean.getTraducao("situacao3"));
		situacaoItens.put(TraducaoBean.getTraducao("situacao4"),TraducaoBean.getTraducao("situacao4"));
		situacaoItens.put(TraducaoBean.getTraducao("situacao5"),TraducaoBean.getTraducao("situacao5"));
		situacaoItens.put(TraducaoBean.getTraducao("situacao6"),TraducaoBean.getTraducao("situacao6"));
		situacaoItens.put(TraducaoBean.getTraducao("situacao7"),TraducaoBean.getTraducao("situacao7"));
		situacaoItens.put(TraducaoBean.getTraducao("situacao8"),TraducaoBean.getTraducao("situacao8"));
		
		return situacaoItens;
	}

	public void setIndicacaoItens(LinkedHashMap<String, String> indicacaoItens) {
		this.indicacaoItens = indicacaoItens;
	}

	public LinkedHashMap<String, String> getIndicacaoItens() {
		
		indicacaoItens = new LinkedHashMap<String, String>();
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao1"),TraducaoBean.getTraducao("indicacao1"));
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao2"),TraducaoBean.getTraducao("indicacao2"));
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao3"),TraducaoBean.getTraducao("indicacao3"));
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao4"),TraducaoBean.getTraducao("indicacao4"));
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao5"),TraducaoBean.getTraducao("indicacao5"));
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao6"),TraducaoBean.getTraducao("indicacao6"));
		
		return indicacaoItens;
	}

	public void setDescricaoIntervencaoOutro3(String descricaoIntervencaoOutro3) {
		this.descricaoIntervencaoOutro3 = descricaoIntervencaoOutro3;
	}

	public String getDescricaoIntervencaoOutro3() {
		return descricaoIntervencaoOutro3;
	}

	public void setDescricaoIntervencaoOutro4(String descricaoIntervencaoOutro4) {
		this.descricaoIntervencaoOutro4 = descricaoIntervencaoOutro4;
	}

	public String getDescricaoIntervencaoOutro4() {
		return descricaoIntervencaoOutro4;
	}
	
	public String getIndicacaoIntervencaoOutro3() {
		return indicacaoIntervencaoOutro3;
	}

	public void setIndicacaoIntervencaoOutro3(String indicacaoIntervencaoOutro3) {
		this.indicacaoIntervencaoOutro3 = indicacaoIntervencaoOutro3;
	}

	public String getIndicacaoIntervencaoOutro4() {
		return indicacaoIntervencaoOutro4;
	}

	public void setIndicacaoIntervencaoOutro4(String indicacaoIntervencaoOutro4) {
		this.indicacaoIntervencaoOutro4 = indicacaoIntervencaoOutro4;
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

	public void setListaDiarioMed(ArrayList<DiarioMedicamentosCasoBean> listaDiarioMed) {
		this.listaDiarioMed = listaDiarioMed;
	}

	public ArrayList<DiarioMedicamentosCasoBean> getListaDiarioMed() {
		return listaDiarioMed;
	}

	public void setPeriodoItens(LinkedHashMap<String, String> periodoItens) {
		this.periodoItens = periodoItens;
	}

	public LinkedHashMap<String, String> getPeriodoItens() {		
		periodoItens =  new LinkedHashMap<String, String>();
		periodoItens.put(TraducaoBean.getTraducao("manha"),TraducaoBean.getTraducao("manha"));
		periodoItens.put(TraducaoBean.getTraducao("tarde"),TraducaoBean.getTraducao("tarde"));
		periodoItens.put(TraducaoBean.getTraducao("noite"),TraducaoBean.getTraducao("noite"));
		
		return periodoItens;
	}

	public void setTipoBebidaItens(LinkedHashMap<String, String> tipoBebidaItens) {
		this.tipoBebidaItens = tipoBebidaItens;
	}

	public LinkedHashMap<String, String> getTipoBebidaItens() {
		tipoBebidaItens = new LinkedHashMap<String, String>();
		tipoBebidaItens.put(TraducaoBean.getTraducao("agua"),TraducaoBean.getTraducao("agua"));
		tipoBebidaItens.put(TraducaoBean.getTraducao("leite"),TraducaoBean.getTraducao("leite"));
		tipoBebidaItens.put(TraducaoBean.getTraducao("suco"),TraducaoBean.getTraducao("suco"));
		tipoBebidaItens.put(TraducaoBean.getTraducao("outro"),TraducaoBean.getTraducao("outro"));
		return tipoBebidaItens;
	}

	public void setDiarioMedPeriodo(String diarioMedPeriodo) {
		this.diarioMedPeriodo = diarioMedPeriodo;
	}

	public String getDiarioMedPeriodo() {
		return diarioMedPeriodo;
	}

	public void setDiarioMedHorario(String diarioMedHorario) {
		this.diarioMedHorario = diarioMedHorario;
	}

	public String getDiarioMedHorario() {
		return diarioMedHorario;
	}

	public void setDiarioMedQuantidade(String diarioMedQuantidade) {
		this.diarioMedQuantidade = diarioMedQuantidade;
	}

	public String getDiarioMedQuantidade() {
		return diarioMedQuantidade;
	}

	public void setDiarioMedDesc(String diarioMedDesc) {
		this.diarioMedDesc = diarioMedDesc;
	}

	public String getDiarioMedDesc() {
		return diarioMedDesc;
	}

	public void setDiarioMedBebida(String diarioMedBebida) {
		this.diarioMedBebida = diarioMedBebida;
	}

	public String getDiarioMedBebida() {
		return diarioMedBebida;
	}

	public void setListaMedicamentoAntConsulta(
			ArrayList<MedicamentoAnterior> listaMedicamentoAntConsulta) {
		this.listaMedicamentoAntConsulta = listaMedicamentoAntConsulta;
	}

	public ArrayList<MedicamentoAnterior> getListaMedicamentoAntConsulta() {
		
		CasoClinicoBean ccBean = new CasoClinicoBean();
		
		CasoClinicoDAO daoCC = ccBean.getCasoClinicoDAO();
		
		listaMedicamentoAntConsulta = daoCC.getAllMedicamentosAnteriores(casoConsultado.getId());
				
		return listaMedicamentoAntConsulta;
	}

	public void setListaDiarioMedConsulta(ArrayList<DiarioMedicamentosCaso> listaDiarioMedConsulta) {
		this.listaDiarioMedConsulta = listaDiarioMedConsulta;
	}

	public ArrayList<DiarioMedicamentosCaso> getListaDiarioMedConsulta() {
		
		CasoClinicoBean ccBean = new CasoClinicoBean();
		
		CasoClinicoDAO daoCC = ccBean.getCasoClinicoDAO();
		
		listaDiarioMedConsulta = daoCC.getAllDiarioMed(casoConsultado.getId());
				
		return listaDiarioMedConsulta;
	}

	public void setNomeDr(String nomeDr) {
		this.nomeDr = nomeDr;
	}

	public String getNomeDr() {
		return nomeDr;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setMotivosRefMedica(String motivosRefMedica) {
		this.motivosRefMedica = motivosRefMedica;
	}

	public String getMotivosRefMedica() {
		return motivosRefMedica;
	}

	public void setAlternativaRefMed1(String alternativaRefMed1) {
		this.alternativaRefMed1 = alternativaRefMed1;
	}

	public String getAlternativaRefMed1() {
		return alternativaRefMed1;
	}

	public void setAlternativaRefMed2(String alternativaRefMed2) {
		this.alternativaRefMed2 = alternativaRefMed2;
	}

	public String getAlternativaRefMed2() {
		return alternativaRefMed2;
	}

	public void setReferencias(String referencias) {
		this.referencias = referencias;
	}

	public String getReferencias() {
		return referencias;
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

	public void setFotoVisualizada(String fotoVisualizada) {
		this.fotoVisualizada = fotoVisualizada;
	}

	public String getFotoVisualizada() {
		
		FacesContext facesContext = FacesContext.getCurrentInstance();
		
		HttpServletRequest request = (HttpServletRequest) facesContext.getCurrentInstance().getExternalContext().getRequest();
		
		HttpSession session = request.getSession();		
		
		fotoVisualizada = "";
		
		if(session.getAttribute("fotoFileName") != null && session.getAttribute("fotoFileName") != ""){			
			fotoVisualizada = (String) session.getAttribute("fotoFileName");
		}
		
		return fotoVisualizada;
	}

	public void setExperienciaMedicamentosConc(
			String experienciaMedicamentosConc) {
		this.experienciaMedicamentosConc = experienciaMedicamentosConc;
	}

	public String getExperienciaMedicamentosConc() {
		return experienciaMedicamentosConc;
	}

}
