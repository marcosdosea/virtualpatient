package br.ufs.dcomp.pv.web;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.faces.context.FacesContext;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import br.ufs.dcomp.pv.JPA.Aluno;
import br.ufs.dcomp.pv.JPA.AlunoDAO;
import br.ufs.dcomp.pv.JPA.CasoClinicoDAO;
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
import br.ufs.dcomp.pv.JPA.IntervencaoRespostaSegunda;
import br.ufs.dcomp.pv.JPA.IntervencaoRespostaSegundaDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoAnterior;
import br.ufs.dcomp.pv.JPA.MedicamentoNaoPrescrito;
import br.ufs.dcomp.pv.JPA.MedicamentoPrescrito;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaSegunda;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaSegundaDAO;
import br.ufs.dcomp.pv.JPA.ParametroClinico;
import br.ufs.dcomp.pv.JPA.Queixa;
import br.ufs.dcomp.pv.JPA.QueixaDAO;
import br.ufs.dcomp.pv.JPA.QueixaRespostaPrimeira;
import br.ufs.dcomp.pv.JPA.QueixaRespostaPrimeiraDAO;
import br.ufs.dcomp.pv.JPA.QueixaRespostaSegunda;
import br.ufs.dcomp.pv.JPA.QueixaRespostaSegundaDAO;
import br.ufs.dcomp.pv.JPA.RazaoEncontroCaso;
import br.ufs.dcomp.pv.JPA.RazaoEncontroCasoDAO;
import br.ufs.dcomp.pv.JPA.RespostaPrimeira;
import br.ufs.dcomp.pv.JPA.RespostaPrimeiraDAO;
import br.ufs.dcomp.pv.JPA.RespostaSegunda;
import br.ufs.dcomp.pv.JPA.RespostaSegundaDAO;

public class RespostaDoAluno2Bean {

	private ArrayList<Queixa> listaQueixas;
	
	private ArrayList<QueixaBean> listaAux;
	
	private RespostaPrimeira respostaPrimeira;
	private RespostaSegunda newRespostaSegunda;
	
	private RespostaSegunda respostaAnterior;
	
	Aluno alunoLogado;
	
	private String carta;
	
	private Date dataRealizacao;
	
	// Variáveis necessárias para o cadastro de intervenções
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
	
	private String justificativaIntervencao1;
	private String justificativaIntervencao2;
	private String justificativaIntervencao3;
	private String justificativaIntervencao4;
	private String justificativaIntervencao5;
	private String justificativaIntervencao6;
	private String justificativaIntervencao7;
	private String justificativaIntervencao8;
	private String justificativaIntervencao9;
	private String justificativaIntervencao10;
	private String justificativaIntervencao11;
	private String justificativaIntervencao12;
	private String justificativaIntervencao13;
	private String justificativaIntervencao14;
	private String justificativaIntervencaoOutro1;
	private String justificativaIntervencaoOutro2;
	private String justificativaIntervencaoOutro3;
	private String justificativaIntervencaoOutro4;
	
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

	
	//private String PRM;
	private Map<String, Object> PRMsItens;
	
	private LinkedHashMap<String, String> indicacaoItens;

	
	public RespostaDoAluno2Bean(){
		PRMsItens = new LinkedHashMap<String, Object>();
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens1"), 1);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens2"), 2);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens3"), 3);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens4"), 4);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens5"), 5);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens6"), 6);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens7"), 7);
		
		indicacaoItens = new LinkedHashMap<String, String>();
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao1"),TraducaoBean.getTraducao("indicacao1"));
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao2"),TraducaoBean.getTraducao("indicacao2"));
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao3"),TraducaoBean.getTraducao("indicacao3"));
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao4"),TraducaoBean.getTraducao("indicacao4"));
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao5"),TraducaoBean.getTraducao("indicacao5"));
		indicacaoItens.put(TraducaoBean.getTraducao("indicacao6"),TraducaoBean.getTraducao("indicacao6"));
		
		//FacesContext facesContext = FacesContext.getCurrentInstance();		
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();

		dataRealizacao = new Date(new java.util.Date().getTime());
		
		alunoLogado = (Aluno) session.getAttribute("AlunoLogado");
		
		listaAux = new ArrayList<QueixaBean>();
		
		RespostaPrimeiraDAO daoRespostaPrimeira = getRespostaAlunoPrimeiraDAO();
		
		respostaPrimeira = daoRespostaPrimeira.getRespostaPrimeiraByConsulta(alunoLogado.getConsultaAtual());
		
		QueixaDAO daoQ = getQueixaDAO();
		
		listaQueixas =  daoQ.getAll(alunoLogado.getConsultaAtual().getFkCasoClinico(), 1);
		for(Iterator<Queixa> i = listaQueixas.iterator(); i.hasNext(); ){
			Queixa newQueixa = i.next();
			QueixaBean aux = new QueixaBean();
			
			aux.setDescricao(newQueixa.getDescricao());
			aux.setNumeroPRM(0);
			aux.setTipo("");
			listaAux.add(aux);
		}
		
	}
	
	public String teste(){
		
		QueixaRespostaSegundaDAO daoQR2 = getQueixaRespostaSegundaDAO();
		RespostaSegundaDAO daoRA2 = getRespostaAlunoSegundaDAO();
		MedicamentoQueixaSegundaDAO daoMQ2 = getMedicamentoQueixa2DAO();
		
		newRespostaSegunda = new RespostaSegunda();
		
		newRespostaSegunda.setDataRealizacao(new Date(new java.util.Date().getTime()));
		newRespostaSegunda.setConsulta(alunoLogado.getConsultaAtual());
		newRespostaSegunda.setNumeroTentativa(alunoLogado.getNrTentativa());
		newRespostaSegunda.setNota(-1);

		
		int a = daoRA2.addRespostaSegunda(newRespostaSegunda);
		
		newRespostaSegunda.setId(a);
		
		for(Iterator<QueixaBean> i = listaAux.iterator(); i.hasNext(); ){
			QueixaBean aux = i.next();
			QueixaRespostaSegunda newQueixa = new QueixaRespostaSegunda();
			//newQueixa.setId(aux.getId());
			if (aux.getTipo().equals("P")){
				newQueixa.setNumeroPRM(aux.getNumeroPRM());
			}
			if (aux.getTipo().equals("D")){
				newQueixa.setNumeroPRM(-1);
			}
			newQueixa.setFlConheceOuPreocupa(aux.getConheceOuPreocupa());
			newQueixa.setPrioridade(aux.getPrioridade());
			newQueixa.setRespostasegunda(newRespostaSegunda);
			newQueixa.setDescricao(aux.getDescricao());
			newQueixa.setPeriodoSurgimento(aux.getPeriodoSurgimento());	
			newQueixa.setTipo(aux.getTipo());
			
			newQueixa.setId(daoQR2.addQueixaRespostaSegunda(newQueixa));
			
			for(Iterator<MedicamentoQueixaBean> j = aux.getListaMedicamentos().iterator(); j.hasNext();){
				
				MedicamentoQueixaBean temp = j.next();
				MedicamentoQueixaSegunda newMedQ = new MedicamentoQueixaSegunda();
				
				newMedQ.setConheceCumpre(temp.getConheceCumpre());
				newMedQ.setCumprimento(temp.getCumprimento());
				newMedQ.setDescricao(temp.getDescrição());
				newMedQ.setDose(temp.getDose());
				newMedQ.setEfetivo(temp.getEfetivo());
				newMedQ.setNecessario(temp.getNecessario());
				newMedQ.setPeriodo(temp.getPeriodo());
				newMedQ.setQueixarespostasegunda(newQueixa);
				newMedQ.setSeguro(temp.getSeguro());
				newMedQ.setAlternativa1(temp.getAlternativa1());
				newMedQ.setAlternativa2(temp.getAlternativa2());
				newMedQ.setNumeroPRM(temp.getNumeroPRM());
				
				daoMQ2.addMedicamentoQueixaSegunda(newMedQ);
				
			}
			
		}
		
		addIntervencaoEtapa1Resposta(ativoIntervencao1etapa1, indicacaoIntervencao1, descricaoIntervencao1, newRespostaSegunda, justificativaIntervencao1);
		addIntervencaoEtapa1Resposta(ativoIntervencao2etapa1, indicacaoIntervencao2, descricaoIntervencao2, newRespostaSegunda, justificativaIntervencao2);
		addIntervencaoEtapa1Resposta(ativoIntervencao3etapa1, indicacaoIntervencao3, descricaoIntervencao3, newRespostaSegunda, justificativaIntervencao3);
		addIntervencaoEtapa1Resposta(ativoIntervencao4etapa1, indicacaoIntervencao4, descricaoIntervencao4, newRespostaSegunda, justificativaIntervencao4);
		addIntervencaoEtapa1Resposta(ativoIntervencao5etapa1, indicacaoIntervencao5, descricaoIntervencao5, newRespostaSegunda, justificativaIntervencao5);
		addIntervencaoEtapa1Resposta(ativoIntervencao6etapa1, indicacaoIntervencao6, descricaoIntervencao6, newRespostaSegunda, justificativaIntervencao6);
		addIntervencaoEtapa1Resposta(ativoIntervencao7etapa1, indicacaoIntervencao7, descricaoIntervencao7, newRespostaSegunda, justificativaIntervencao7);
		addIntervencaoEtapa1Resposta(ativoIntervencao8etapa1, indicacaoIntervencao8, descricaoIntervencao8, newRespostaSegunda, justificativaIntervencao8);
		addIntervencaoEtapa1Resposta(ativoIntervencao9etapa1, indicacaoIntervencao9, descricaoIntervencao9, newRespostaSegunda, justificativaIntervencao9);
		addIntervencaoEtapa1Resposta(ativoIntervencao10etapa1, indicacaoIntervencao10,  descricaoIntervencao10, newRespostaSegunda, justificativaIntervencao10);
		addIntervencaoEtapa1Resposta(ativoIntervencao11etapa1, indicacaoIntervencao11, descricaoIntervencao11, newRespostaSegunda, justificativaIntervencao11);
		addIntervencaoEtapa1Resposta(ativoIntervencao12etapa1, indicacaoIntervencao12,  descricaoIntervencao12, newRespostaSegunda, justificativaIntervencao12);
		addIntervencaoEtapa1Resposta(ativoIntervencao13etapa1, indicacaoIntervencao13,  descricaoIntervencao13, newRespostaSegunda, justificativaIntervencao13);
		addIntervencaoEtapa1Resposta(ativoIntervencao14etapa1, indicacaoIntervencao14,  descricaoIntervencao14, newRespostaSegunda, justificativaIntervencao14);
		if(descricaoIntervencaoOutro1 != "")
		{
			addIntervencaoEtapa1Resposta(true, indicacaoIntervencaoOutro1 , descricaoIntervencaoOutro1, newRespostaSegunda, justificativaIntervencaoOutro1);
		}
		if(descricaoIntervencaoOutro2 != "")
		{
			addIntervencaoEtapa1Resposta(true,indicacaoIntervencaoOutro2 ,  descricaoIntervencaoOutro2, newRespostaSegunda, justificativaIntervencaoOutro2);
		}
		if(descricaoIntervencaoOutro3 != "")
		{
			addIntervencaoEtapa1Resposta(true,indicacaoIntervencaoOutro3 ,  descricaoIntervencaoOutro3, newRespostaSegunda, justificativaIntervencaoOutro3);
		}
		if(descricaoIntervencaoOutro4 != "")
		{
			addIntervencaoEtapa1Resposta(true,indicacaoIntervencaoOutro4 ,  descricaoIntervencaoOutro4, newRespostaSegunda, justificativaIntervencaoOutro4);
		}

		AlunoDAO daoA = getAlunoDAO();
		
		//alunoLogado.setOcupado(2);
		alunoLogado.setLiberado('N');
		
		daoA.progredirConsulta(alunoLogado);
		
		//daoRA.setDataRealizacao2(alunoLogado.getRespostaAtual(), dataRealizacao);
		
		if (ativoIntervencao10etapa1){
			return "carta";
		}else{
			return "Segunda consulta concluida";

		}
		
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
	private String escolaridadeTraduzidaAluno;
	
	public String getEscolaridadeTraduzida() {
		String escolaridade = respostaPrimeira.getConsulta().getFkCasoClinico().getEscolaridade();
		escolaridadeTraduzida = pegarTraducaoEscolaridade(escolaridade);
		return escolaridadeTraduzida;
	}
	
	public String getEscolaridadeTraduzidaAluno() {
		String escolaridade = respostaPrimeira.getEscolaridade();
		escolaridadeTraduzidaAluno = pegarTraducaoEscolaridade(escolaridade);
		return escolaridadeTraduzidaAluno;
	}
	
	private float imcCorreto;
	public void setImcCorreto(float imcCorreto) {
		this.imcCorreto = imcCorreto;
	}

	public float getImcCorreto() {
		
		RespostaPrimeiraDAO daoR1 = getRespostaAlunoPrimeiraDAO();
		
		imcCorreto = (float) (daoR1.getAnteriorByConsulta(alunoLogado.getConsultaAtual()).getPeso() / Math.pow(daoR1.getAnteriorByConsulta(alunoLogado.getConsultaAtual()).getAltura(), 2)) ;
		
		return imcCorreto;
	}
	
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
	
	private ArrayList<QueixaRespostaPrimeira> listaQueixaResposta1;
	private ArrayList<Queixa> listaQueixa1;
	
	public ArrayList<QueixaRespostaPrimeira> getListaQueixaResposta1() {
		
		RespostaPrimeiraDAO daoR1 = getRespostaAlunoPrimeiraDAO();
		QueixaRespostaPrimeiraDAO daoQR1 = getQueixaRespostaPrimeiraDAO();
		
		listaQueixaResposta1 = daoQR1.getQueixasByResposta(daoR1.getAnteriorByConsulta(alunoLogado.getConsultaAtual()));
		
		return listaQueixaResposta1;
	}

	public void setListaQueixaResposta1(ArrayList<QueixaRespostaPrimeira> listaQueixaResposta1) {
		this.listaQueixaResposta1 = listaQueixaResposta1;
	}
	
	public void setListaQueixa1(ArrayList<Queixa> listaQueixa1) {
		this.listaQueixa1 = listaQueixa1;
	}

	public ArrayList<Queixa> getListaQueixa1() {
		
		QueixaDAO daoQ = getQueixaDAO();
		
		listaQueixa1 = daoQ.getAll(respostaPrimeira.getConsulta().getFkCasoClinico(), 1);
		
		return listaQueixa1;
	}
	
	public ArrayList<MedicamentoAnterior> getListaMedicamentoAnt(){
		CasoClinicoDAO daoCC = getCasoClinicoDAO();
		
		return daoCC.getAllMedicamentosAnteriores(respostaPrimeira.getConsulta().getFkCasoClinico().getId());
	}
	
	public ArrayList<ParametroClinico> getParametrosClinicos(){
		CasoClinicoDAO daoCC = getCasoClinicoDAO();
		
		return daoCC.getAllParametrosClinicos(respostaPrimeira.getConsulta().getFkCasoClinico().getId());
	}
	
	public ArrayList<MedicamentoNaoPrescrito> getMedicamentosNaoPrescritos(){
		CasoClinicoDAO daoCC = getCasoClinicoDAO();
		
		return daoCC.getAllMedicamentosNaoPrescritos(respostaPrimeira.getConsulta().getFkCasoClinico().getId());
	}

	public ArrayList<MedicamentoPrescrito> getMedicamentosPrescritos(){
		CasoClinicoDAO daoCC = getCasoClinicoDAO();
		
		return daoCC.getAllMedicamentosPrescritos(respostaPrimeira.getConsulta().getFkCasoClinico().getId());
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

	private QueixaRespostaSegundaDAO getQueixaRespostaSegundaDAO(){
		
		QueixaRespostaSegundaDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (QueixaRespostaSegundaDAO) ctx.lookup("pacienteVirtualEAR/QueixaRespostaSegundaDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}

	
	// métodos para persistir as intervenções farmacêuticas
	public void addIntervencaoEtapa1Resposta(boolean ativoIntervencao, String indicacao, String descricaoIntervencao, RespostaSegunda resposta, String justificativa){
		if (ativoIntervencao) {
			IntervencaoRespostaSegundaDAO daoIntervencao = getIntervencaoRespostaSegundaDAO();
			IntervencaoRespostaSegunda newIntervencao = new IntervencaoRespostaSegunda();
			newIntervencao.setDescricao(descricaoIntervencao);
			newIntervencao.setRespostasegunda(resposta);
			newIntervencao.setJustificativa(justificativa);
			newIntervencao.setIndicacao(indicacao);
			
			daoIntervencao.addIntervencaoRespostaSegunda(newIntervencao);
		}
		
	}
	
	public IntervencaoRespostaSegundaDAO getIntervencaoRespostaSegundaDAO(){
		
		IntervencaoRespostaSegundaDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (IntervencaoRespostaSegundaDAO) ctx.lookup("pacienteVirtualEAR/IntervencaoRespostaSegundaDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	public AlunoDAO getAlunoDAO() {
		
		AlunoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (AlunoDAO) ctx.lookup("pacienteVirtualEAR/AlunoDAOBean/remote");
			
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

	
	public String getDescricaoIntervencao1() {
		return descricaoIntervencao1;
	}

	public void setDescricaoIntervencao1(String descricaoIntervencao1) {
		this.descricaoIntervencao1 = descricaoIntervencao1;
	}

	public String getDescricaoIntervencao2() {
		return descricaoIntervencao2;
	}

	public void setDescricaoIntervencao2(String descricaoIntervencao2) {
		this.descricaoIntervencao2 = descricaoIntervencao2;
	}

	public String getDescricaoIntervencao3() {
		return descricaoIntervencao3;
	}

	public void setDescricaoIntervencao3(String descricaoIntervencao3) {
		this.descricaoIntervencao3 = descricaoIntervencao3;
	}

	public String getDescricaoIntervencao4() {
		return descricaoIntervencao4;
	}

	public void setDescricaoIntervencao4(String descricaoIntervencao4) {
		this.descricaoIntervencao4 = descricaoIntervencao4;
	}

	public String getDescricaoIntervencao5() {
		return descricaoIntervencao5;
	}

	public void setDescricaoIntervencao5(String descricaoIntervencao5) {
		this.descricaoIntervencao5 = descricaoIntervencao5;
	}

	public String getDescricaoIntervencao6() {
		return descricaoIntervencao6;
	}

	public void setDescricaoIntervencao6(String descricaoIntervencao6) {
		this.descricaoIntervencao6 = descricaoIntervencao6;
	}

	public String getDescricaoIntervencao7() {
		return descricaoIntervencao7;
	}

	public void setDescricaoIntervencao7(String descricaoIntervencao7) {
		this.descricaoIntervencao7 = descricaoIntervencao7;
	}

	public String getDescricaoIntervencao8() {
		return descricaoIntervencao8;
	}

	public void setDescricaoIntervencao8(String descricaoIntervencao8) {
		this.descricaoIntervencao8 = descricaoIntervencao8;
	}

	public String getDescricaoIntervencao9() {
		return descricaoIntervencao9;
	}

	public void setDescricaoIntervencao9(String descricaoIntervencao9) {
		this.descricaoIntervencao9 = descricaoIntervencao9;
	}

	public String getDescricaoIntervencao10() {
		return descricaoIntervencao10;
	}

	public void setDescricaoIntervencao10(String descricaoIntervencao10) {
		this.descricaoIntervencao10 = descricaoIntervencao10;
	}

	public String getDescricaoIntervencao11() {
		return descricaoIntervencao11;
	}

	public void setDescricaoIntervencao11(String descricaoIntervencao11) {
		this.descricaoIntervencao11 = descricaoIntervencao11;
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


	public ArrayList<QueixaBean> getListaAux() {
		return listaAux;
	}


	public void setListaAux(ArrayList<QueixaBean> listaAux) {
		this.listaAux = listaAux;
	}

	public Aluno getAlunoLogado() {
		return alunoLogado;
	}

	public void setAlunoLogado(Aluno alunoLogado) {
		this.alunoLogado = alunoLogado;
	}

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

	public String getJustificativaIntervencao1() {
		return justificativaIntervencao1;
	}

	public void setJustificativaIntervencao1(String justificativaIntervencao1) {
		this.justificativaIntervencao1 = justificativaIntervencao1;
	}

	public String getJustificativaIntervencao2() {
		return justificativaIntervencao2;
	}

	public void setJustificativaIntervencao2(String justificativaIntervencao2) {
		this.justificativaIntervencao2 = justificativaIntervencao2;
	}

	public String getJustificativaIntervencao3() {
		return justificativaIntervencao3;
	}

	public void setJustificativaIntervencao3(String justificativaIntervencao3) {
		this.justificativaIntervencao3 = justificativaIntervencao3;
	}

	public String getJustificativaIntervencao4() {
		return justificativaIntervencao4;
	}

	public void setJustificativaIntervencao4(String justificativaIntervencao4) {
		this.justificativaIntervencao4 = justificativaIntervencao4;
	}

	public String getJustificativaIntervencao5() {
		return justificativaIntervencao5;
	}

	public void setJustificativaIntervencao5(String justificativaIntervencao5) {
		this.justificativaIntervencao5 = justificativaIntervencao5;
	}

	public String getJustificativaIntervencao6() {
		return justificativaIntervencao6;
	}

	public void setJustificativaIntervencao6(String justificativaIntervencao6) {
		this.justificativaIntervencao6 = justificativaIntervencao6;
	}

	public String getJustificativaIntervencao7() {
		return justificativaIntervencao7;
	}

	public void setJustificativaIntervencao7(String justificativaIntervencao7) {
		this.justificativaIntervencao7 = justificativaIntervencao7;
	}

	public String getJustificativaIntervencao8() {
		return justificativaIntervencao8;
	}

	public void setJustificativaIntervencao8(String justificativaIntervencao8) {
		this.justificativaIntervencao8 = justificativaIntervencao8;
	}

	public String getJustificativaIntervencao9() {
		return justificativaIntervencao9;
	}

	public void setJustificativaIntervencao9(String justificativaIntervencao9) {
		this.justificativaIntervencao9 = justificativaIntervencao9;
	}

	public String getJustificativaIntervencao10() {
		return justificativaIntervencao10;
	}

	public void setJustificativaIntervencao10(String justificativaIntervencao10) {
		this.justificativaIntervencao10 = justificativaIntervencao10;
	}

	public String getJustificativaIntervencao11() {
		return justificativaIntervencao11;
	}

	public void setJustificativaIntervencao11(String justificativaIntervencao11) {
		this.justificativaIntervencao11 = justificativaIntervencao11;
	}

	public void setDataRealizacao(Date dataRealizacao) {
		this.dataRealizacao = dataRealizacao;
	}

	public Date getDataRealizacao() {
		return dataRealizacao;
	}

	private RespostaSegundaDAO getRespostaAlunoSegundaDAO(){
		
		RespostaSegundaDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (RespostaSegundaDAO) ctx.lookup("pacienteVirtualEAR/RespostaSegundaDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
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

	public ArrayList<Queixa> getListaQueixas() {
		return listaQueixas;
	}

	public void setListaQueixas(ArrayList<Queixa> listaQueixas) {
		this.listaQueixas = listaQueixas;
	}

	public void setRespostaPrimeira(RespostaPrimeira respostaPrimeira) {
		this.respostaPrimeira = respostaPrimeira;
	}

	public RespostaPrimeira getRespostaPrimeira() {
		return respostaPrimeira;
	}

	public void setCarta(String carta) {
		this.carta = carta;
	}

	public String getCarta() {
		return carta;
	}
	
	public String salvandoCarta(){
		RespostaSegundaDAO daoR2 = getRespostaAlunoSegundaDAO();
		
		newRespostaSegunda.setCarta(carta);
		
		daoR2.addCarta(newRespostaSegunda);
		
		return "Segunda consulta concluida";
	}

	public RespostaSegunda getNewRespostaSegunda() {
		return newRespostaSegunda;
	}

	public void setNewRespostaSegunda(RespostaSegunda newRespostaSegunda) {
		this.newRespostaSegunda = newRespostaSegunda;
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
	
	private MedicamentoQueixaSegundaDAO getMedicamentoQueixa2DAO(){
		
		MedicamentoQueixaSegundaDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (MedicamentoQueixaSegundaDAO) ctx.lookup("pacienteVirtualEAR/MedicamentoQueixaSegundaDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}

	public void setRespostaAnterior(RespostaSegunda respostaAnterior) {
		this.respostaAnterior = respostaAnterior;
	}

	public RespostaSegunda getRespostaAnterior() {
		
		RespostaSegundaDAO daoR2 = getRespostaAlunoSegundaDAO();
		
		respostaAnterior = daoR2.getAnteriorByConsulta(alunoLogado.getConsultaAtual());
		
		return respostaAnterior;
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

	public void setJustificativaIntervencao12(String justificativaIntervencao12) {
		this.justificativaIntervencao12 = justificativaIntervencao12;
	}

	public String getJustificativaIntervencao12() {
		return justificativaIntervencao12;
	}

	public void setJustificativaIntervencao13(String justificativaIntervencao13) {
		this.justificativaIntervencao13 = justificativaIntervencao13;
	}

	public String getJustificativaIntervencao13() {
		return justificativaIntervencao13;
	}

	public void setJustificativaIntervencao14(String justificativaIntervencao14) {
		this.justificativaIntervencao14 = justificativaIntervencao14;
	}

	public String getJustificativaIntervencao14() {
		return justificativaIntervencao14;
	}

	public void setJustificativaIntervencaoOutro1(
			String justificativaIntervencaoOutro1) {
		this.justificativaIntervencaoOutro1 = justificativaIntervencaoOutro1;
	}

	public String getJustificativaIntervencaoOutro1() {
		return justificativaIntervencaoOutro1;
	}

	public void setJustificativaIntervencaoOutro2(
			String justificativaIntervencaoOutro2) {
		this.justificativaIntervencaoOutro2 = justificativaIntervencaoOutro2;
	}

	public String getJustificativaIntervencaoOutro2() {
		return justificativaIntervencaoOutro2;
	}

	public void setJustificativaIntervencaoOutro3(
			String justificativaIntervencaoOutro3) {
		this.justificativaIntervencaoOutro3 = justificativaIntervencaoOutro3;
	}

	public String getJustificativaIntervencaoOutro3() {
		return justificativaIntervencaoOutro3;
	}

	public void setJustificativaIntervencaoOutro4(
			String justificativaIntervencaoOutro4) {
		this.justificativaIntervencaoOutro4 = justificativaIntervencaoOutro4;
	}

	public String getJustificativaIntervencaoOutro4() {
		return justificativaIntervencaoOutro4;
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

	public void setIndicacaoIntervencaoOutro3(String indicacaoIntervencaoOutro3) {
		this.indicacaoIntervencaoOutro3 = indicacaoIntervencaoOutro3;
	}

	public String getIndicacaoIntervencaoOutro3() {
		return indicacaoIntervencaoOutro3;
	}

	public void setIndicacaoIntervencaoOutro4(String indicacaoIntervencaoOutro4) {
		this.indicacaoIntervencaoOutro4 = indicacaoIntervencaoOutro4;
	}

	public String getIndicacaoIntervencaoOutro4() {
		return indicacaoIntervencaoOutro4;
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
	
	public ArrayList<RazaoEncontroCaso> getListaRazaoEncontroCaso(){
		
		return getRazaoEncontroCasoDAO().getAllByCasoClinico(respostaPrimeira.getConsulta().getFkCasoClinico().getId());
	}
	
	public ArrayList<ExperienciaMedicamentos1Caso> getListaExperienciaMedicamentos1Caso(){
		
		return getExperienciaMedicamentos1CasoDAO().getAllByCasoClinico(respostaPrimeira.getConsulta().getFkCasoClinico().getId());
	}
	
	public ArrayList<ExperienciaMedicamentos2Caso> getListaExperienciaMedicamentos2Caso(){
		
		return getExperienciaMedicamentos2CasoDAO().getAllByCasoClinico(respostaPrimeira.getConsulta().getFkCasoClinico().getId());
	}
	
	public ArrayList<ExperienciaMedicamentos3Caso> getListaExperienciaMedicamentos3Caso(){
		
		return getExperienciaMedicamentos3CasoDAO().getAllByCasoClinico(respostaPrimeira.getConsulta().getFkCasoClinico().getId());
	}
	
	public ArrayList<ExperienciaMedicamentos4Caso> getListaExperienciaMedicamentos4Caso(){
		
		return getExperienciaMedicamentos4CasoDAO().getAllByCasoClinico(respostaPrimeira.getConsulta().getFkCasoClinico().getId());
	}
	
	public ArrayList<ExperienciaMedicamentos5Caso> getListaExperienciaMedicamentos5Caso(){
		
		return getExperienciaMedicamentos5CasoDAO().getAllByCasoClinico(respostaPrimeira.getConsulta().getFkCasoClinico().getId());
	}
	
	public ArrayList<ExperienciaMedicamentosConcCaso> getListaExperienciaMedicamentosConcCaso(){
		
		return getExperienciaMedicamentosConcCasoDAO().getAllByCasoClinico(respostaPrimeira.getConsulta().getFkCasoClinico().getId());
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
}
