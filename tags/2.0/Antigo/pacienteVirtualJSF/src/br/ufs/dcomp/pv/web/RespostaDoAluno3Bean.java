package br.ufs.dcomp.pv.web;

import java.util.Date;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.faces.component.UIParameter;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.jboss.deployers.plugins.sort.SetDots;

import br.ufs.dcomp.pv.JPA.Aluno;
import br.ufs.dcomp.pv.JPA.AlunoDAO;
import br.ufs.dcomp.pv.JPA.CasoClinicoDAO;
import br.ufs.dcomp.pv.JPA.DiarioMedicamentos;
import br.ufs.dcomp.pv.JPA.DiarioMedicamentosCaso;
import br.ufs.dcomp.pv.JPA.DiarioMedicamentosCasoDAO;
import br.ufs.dcomp.pv.JPA.DiarioMedicamentosDAO;
import br.ufs.dcomp.pv.JPA.Intervencao;
import br.ufs.dcomp.pv.JPA.IntervencaoDAO;
import br.ufs.dcomp.pv.JPA.IntervencaoRespostaSegunda;
import br.ufs.dcomp.pv.JPA.IntervencaoRespostaSegundaDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoAnterior;
import br.ufs.dcomp.pv.JPA.MedicamentoAnteriorDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoNaoPrescrito;
import br.ufs.dcomp.pv.JPA.MedicamentoPrescrito;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixa;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaSegunda;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaSegundaDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaTerceira;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaTerceiraDAO;
import br.ufs.dcomp.pv.JPA.ParametroClinico;
import br.ufs.dcomp.pv.JPA.Queixa;
import br.ufs.dcomp.pv.JPA.QueixaDAO;
import br.ufs.dcomp.pv.JPA.QueixaRespostaSegunda;
import br.ufs.dcomp.pv.JPA.QueixaRespostaSegundaDAO;
import br.ufs.dcomp.pv.JPA.QueixaRespostaTerceira;
import br.ufs.dcomp.pv.JPA.QueixaRespostaTerceiraDAO;
import br.ufs.dcomp.pv.JPA.RespostaPrimeira;
import br.ufs.dcomp.pv.JPA.RespostaPrimeiraDAO;
import br.ufs.dcomp.pv.JPA.RespostaSegunda;
import br.ufs.dcomp.pv.JPA.RespostaSegundaDAO;
import br.ufs.dcomp.pv.JPA.RespostaTerceira;
import br.ufs.dcomp.pv.JPA.RespostaTerceiraDAO;

public class RespostaDoAluno3Bean {

	RespostaTerceira respostaTerceira;
	RespostaPrimeira respostaPrimeira;
	RespostaSegunda respostaSegunda;
	
	Date dataRealizacao;
	
	RespostaTerceira respostaAnterior;
	
	private Aluno alunoLogado;
	
	public ArrayList<Queixa> getListaQueixas() {
		return listaQueixas;
	}

	public void setListaQueixas(ArrayList<Queixa> listaQueixas) {
		this.listaQueixas = listaQueixas;
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
	
	private ArrayList<QueixaBean> listaAluno;
	private ArrayList<QueixaBean> listaGabarito;
	private ArrayList<QueixaBean> listaAluno3;
	private ArrayList<QueixaBean> listaGabarito3;
	
	
	private ArrayList<Intervencao> listaIntervencaoGabarito;
	private ArrayList<IntervencaoRespostaSegunda> listaIntervencaoAluno;
	private ArrayList<DiarioMedicamentosBean> listaDiarioMed = new ArrayList<DiarioMedicamentosBean>();

	private LinkedHashMap<String, String> periodoItens;
	private LinkedHashMap<String, String> tipoBebidaItens;
	
	private ArrayList<Queixa> listaQueixas;
	private ArrayList<QueixaBean> listaAux;
	private float peso2;
	private float imc;
	private float temperatura2;
	private int pressaoSistolica2;
	private int pressaoDiastolica2;
	
	private String peso2String;
	private String imc2String;
	private String temperatura2String;
	private String pressaoSistolica2String;
	private String pressaoDiastolica2String;
	
	private String proxEncontro;
	
	private String diarioMedPeriodo;
	private String diarioMedHorario;
	private String diarioMedQuantidade;
	private String diarioMedDesc;
	private String diarioMedBebida;
	
	
	private String PRM;
	private Map<String, Object> PRMsItens;
		
	public RespostaDoAluno3Bean(){
		PRMsItens = new LinkedHashMap<String, Object>();
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens1"), 1);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens2"), 2);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens3"), 3);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens4"), 4);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens5"), 5);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens6"), 6);
		PRMsItens.put(TraducaoBean.getTraducao("PRMsItens7"), 7);
		
		periodoItens =  new LinkedHashMap<String, String>();
		periodoItens.put(TraducaoBean.getTraducao("manha"),TraducaoBean.getTraducao("manha"));
		periodoItens.put(TraducaoBean.getTraducao("tarde"),TraducaoBean.getTraducao("tarde"));
		periodoItens.put(TraducaoBean.getTraducao("noite"),TraducaoBean.getTraducao("noite"));
		
		tipoBebidaItens = new LinkedHashMap<String, String>();
		tipoBebidaItens.put(TraducaoBean.getTraducao("agua"),TraducaoBean.getTraducao("agua"));
		tipoBebidaItens.put(TraducaoBean.getTraducao("leite"),TraducaoBean.getTraducao("leite"));
		tipoBebidaItens.put(TraducaoBean.getTraducao("suco"),TraducaoBean.getTraducao("suco"));
		tipoBebidaItens.put(TraducaoBean.getTraducao("outro"),TraducaoBean.getTraducao("outro"));
		
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();

		RespostaPrimeiraDAO daoRespostaPrimeira = getRespostaAlunoPrimeiraDAO();
		
		alunoLogado = (Aluno) session.getAttribute("AlunoLogado");
		
		respostaPrimeira = daoRespostaPrimeira.getRespostaPrimeiraByConsulta(alunoLogado.getConsultaAtual());
			
		RespostaSegundaDAO daoR2 = getRespostaAlunoSegundaDAO();
		
		respostaSegunda = daoR2.getAnteriorByConsulta(alunoLogado.getConsultaAtual());
		
		RespostaTerceiraDAO daoR3 = getRespostaAlunoTerceiraDAO();
		
		if(alunoLogado.getNrConsulta() > 3)
		{
			respostaTerceira = daoR3.getAnteriorByConsulta(alunoLogado.getConsultaAtual());
		}
		
		listaAux = new ArrayList<QueixaBean>();
		
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
	
	public String addDiarioMedicamento()
	{
		DiarioMedicamentosBean newDiarioMed = new DiarioMedicamentosBean();
		
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
	

	private RespostaSegundaDAO getRespostaAlunoSegundaDAO() {

		RespostaSegundaDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (RespostaSegundaDAO) ctx
					.lookup("pacienteVirtualEAR/RespostaSegundaDAOBean/remote");

		} catch (Exception e) {
			// TODO handle errors
		}

		return dao;
	}
	
	public ArrayList<ParametroClinico> getParametrosClinicos(){
		CasoClinicoDAO daoCC = getCasoClinicoDAO();
		
		return daoCC.getAllParametrosClinicos(alunoLogado.getConsultaAtual().getFkCasoClinico().getId());
	}
	
	public ArrayList<MedicamentoNaoPrescrito> getMedicamentosNaoPrescritos(){
		CasoClinicoDAO daoCC = getCasoClinicoDAO();
		
		return daoCC.getAllMedicamentosNaoPrescritos(alunoLogado.getConsultaAtual().getFkCasoClinico().getId());
	}

	public ArrayList<MedicamentoPrescrito> getMedicamentosPrescritos(){
		CasoClinicoDAO daoCC = getCasoClinicoDAO();
		
		return daoCC.getAllMedicamentosPrescritos(alunoLogado.getConsultaAtual().getFkCasoClinico().getId());
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

	
	//getter e setters necessários para o cadastro de queixas


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
	
	public void addQueixaResposta(boolean ativoQueixa, String descricaoQueixa, RespostaTerceira newRespostaAluno){
		if (ativoQueixa) {
			QueixaRespostaTerceiraDAO daoQueixa = getQueixaRespostaTerceiraDAO();
			QueixaRespostaTerceira newQueixa = new QueixaRespostaTerceira();
			newQueixa.setDescricao(descricaoQueixa);
			newQueixa.setRespostaterceira(newRespostaAluno);

			
			daoQueixa.addQueixaRespostaTerceira(newQueixa);
		}
		
	}


	private QueixaRespostaTerceiraDAO getQueixaRespostaTerceiraDAO(){
		
		QueixaRespostaTerceiraDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (QueixaRespostaTerceiraDAO) ctx.lookup("pacienteVirtualEAR/QueixaRespostaTerceiraDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}	

	
	public String addRespostaTerceira(){
		
		AlunoBean alu = new AlunoBean();
		AlunoDAO daoA = alu.getAlunoDAO();
		
		dataRealizacao = new Date(new java.util.Date().getTime());

		RespostaTerceiraDAO daoR3 = getRespostaAlunoTerceiraDAO();
		QueixaRespostaTerceiraDAO daoQR3 = getQueixaRespostaTerceiraDAO();
		MedicamentoQueixaTerceiraDAO daoMQ3 = getMedicamentoQueixa3DAO();
								
		RespostaTerceira newRespostaTerceira = new RespostaTerceira();
		
		dataRealizacao = new Date();
		
		newRespostaTerceira.setDataRealizacao(new java.sql.Date(dataRealizacao.getTime()));
				
		newRespostaTerceira.setPeso(peso2);
		newRespostaTerceira.setImc(imc);
		newRespostaTerceira.setPressaodiastolica(pressaoDiastolica2);
		newRespostaTerceira.setPressaosistolica(pressaoSistolica2);
		newRespostaTerceira.setConsulta(alunoLogado.getConsultaAtual());
		newRespostaTerceira.setTemperatura(temperatura2);
		newRespostaTerceira.setNota(-1);
		newRespostaTerceira.setProxEncontro(proxEncontro);

		
		newRespostaTerceira.setId(daoR3.addRespostaTerceira(newRespostaTerceira));
		
		for(Iterator<QueixaBean> i = listaAux.iterator(); i.hasNext(); ){
			QueixaBean aux = i.next();
			QueixaRespostaTerceira newQueixa = new QueixaRespostaTerceira();
			
			if (aux.getTipo().equals("P")){
				newQueixa.setNumeroPRM(aux.getNumeroPRM());
			}
			if (aux.getTipo().equals("D")){
				newQueixa.setNumeroPRM(-1);
			}
			newQueixa.setPrioridade(aux.getPrioridade());
			newQueixa.setRespostaterceira(newRespostaTerceira);
			newQueixa.setDescricao(aux.getDescricao());
			newQueixa.setPeriodoSurgimento(aux.getPeriodoSurgimento());		
			
			newQueixa.setId(daoQR3.addQueixaRespostaTerceira(newQueixa));
			
			for(Iterator<MedicamentoQueixaBean> j = aux.getListaMedicamentos().iterator(); j.hasNext();){
				
				MedicamentoQueixaBean temp = j.next();
				MedicamentoQueixaTerceira newMedQ = new MedicamentoQueixaTerceira();
				
				newMedQ.setCumprimento(temp.getCumprimento());
				newMedQ.setDescricao(temp.getDescrição());
				newMedQ.setDose(temp.getDose());
				newMedQ.setEfetivo(temp.getEfetivo());
				newMedQ.setNecessario(temp.getNecessario());
				newMedQ.setPeriodo(temp.getPeriodo());
				newMedQ.setQueixarespostaTerceira(newQueixa);
				newMedQ.setSeguro(temp.getSeguro());
				newMedQ.setAlternativa1(temp.getAlternativa1());
				newMedQ.setAlternativa2(temp.getAlternativa2());
				newMedQ.setNumeroPRM(temp.getNumeroPRM());
				newMedQ.setSituacao(temp.getSituacao());
				
				daoMQ3.addMedicamentoQueixaTerceira(newMedQ);				
			}			
		}
		
		DiarioMedicamentosDAO daoDiario = getDiarioMedicamentosDAO();
		
		for(Iterator<DiarioMedicamentosBean> i = getListaDiarioMed().iterator(); i.hasNext();){
			
			DiarioMedicamentosBean diarioMedAux = new DiarioMedicamentosBean();
			diarioMedAux = i.next();
			DiarioMedicamentos newDiarioMed = new DiarioMedicamentos();
			
			newDiarioMed.setMedicamento(diarioMedAux.getMedicamento());
			newDiarioMed.setHorario(diarioMedAux.getHorario());
			newDiarioMed.setQuantidade(diarioMedAux.getQuantidade());
			newDiarioMed.setPeriodo(diarioMedAux.getPeriodo());		
			newDiarioMed.setTipoBebida(diarioMedAux.getTipoBebida());	
			newDiarioMed.setRespostaTerceira(newRespostaTerceira);
						
			daoDiario.addDiarioMedicamentos(newDiarioMed);
		}

		
		//alunoLogado.setOcupado(3);
		alunoLogado.setLiberado('N');
		//alunoLogado.setRespostaAtual(newRespostaPrimeira);
		
		daoA.progredirConsulta(alunoLogado);
		
		return "Terceira consulta concluida";
	}

	public void removeDiarioMed(ActionEvent event){
		UIParameter val = (UIParameter) event.getComponent().findComponent("removeDiarioMed");
		DiarioMedicamentosBean id = (DiarioMedicamentosBean) val.getValue();
		getListaDiarioMed().remove(id);
	}

	private DiarioMedicamentosDAO getDiarioMedicamentosDAO() {
		DiarioMedicamentosDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (DiarioMedicamentosDAO) ctx.lookup("pacienteVirtualEAR/DiarioMedicamentosDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}		
		return dao;
	}

	private MedicamentoQueixaTerceiraDAO getMedicamentoQueixa3DAO() {
		
		MedicamentoQueixaTerceiraDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (MedicamentoQueixaTerceiraDAO) ctx.lookup("pacienteVirtualEAR/MedicamentoQueixaTerceiraDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}

	public float getPeso2() {
		return peso2;
	}

	public void setPeso2(float peso2) {
		this.peso2 = peso2;
	}

	public float getTemperatura2() {
		return temperatura2;
	}

	public void setTemperatura2(float temperatura2) {
		this.temperatura2 = temperatura2;
	}

	public int getPressaoSistolica2() {
		return pressaoSistolica2;
	}

	public void setPressaoSistolica2(int pressaoSistolica2) {
		this.pressaoSistolica2 = pressaoSistolica2;
	}

	public int getPressaoDiastolica2() {
		return pressaoDiastolica2;
	}

	public void setPressaoDiastolica2(int pressaoDiastolica2) {
		this.pressaoDiastolica2 = pressaoDiastolica2;
	}

	public RespostaTerceira getRespostaTerceira() {
		return respostaTerceira;
	}

	public void setRespostaTerceira(RespostaTerceira respostaTerceira) {
		this.respostaTerceira = respostaTerceira;
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
	
	private RespostaTerceiraDAO getRespostaAlunoTerceiraDAO(){
		
		RespostaTerceiraDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (RespostaTerceiraDAO) ctx.lookup("pacienteVirtualEAR/RespostaTerceiraDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}

	public RespostaPrimeira getRespostaPrimeira() {
		return respostaPrimeira;
	}

	public void setRespostaPrimeira(RespostaPrimeira respostaPrimeira) {
		this.respostaPrimeira = respostaPrimeira;
	}

	public void setImc(float imc) {
		this.imc = imc;
	}

	public void setImc2() {
		this.imc = Float.parseFloat(imc2String);
	}
	
	public float getImc() {
		return imc;
	}

	public String getPeso2String() {
		return peso2String;
	}

	public void setPeso2String(String peso2String) {
		if (!(peso2String.equals(""))) {
			peso2String = peso2String.replace(",", ".");
			this.peso2String = peso2String;
			setPeso2();
		}
	}

	public String getImc2String() {
		return imc2String;
	}

	public void setImc2String(String imc2String) {
		if (!(imc2String.equals(""))) {
			imc2String = imc2String.replace(",", ".");
			this.imc2String = imc2String;
			setImc2();
		}
	}

	public String getTemperatura2String() {
		return temperatura2String;
	}

	public void setTemperatura2String(String temperatura2String) {
		if (!(temperatura2String.equals(""))) {
			temperatura2String = temperatura2String.replace(",", ".");
			this.temperatura2String = temperatura2String;
			setTemperatura2();
		}
	}

	public String getPressaoSistolica2String() {
		return pressaoSistolica2String;
	}

	public void setPressaoSistolica2String(String pressaoSistolica2String) {
		this.pressaoSistolica2String = pressaoSistolica2String;
		setPressaoSistolica2();
	}

	public String getPressaoDiastolica2String() {
		return pressaoDiastolica2String;
	}

	public void setPressaoDiastolica2String(String pressaoDiastolica2String) {
		this.pressaoDiastolica2String = pressaoDiastolica2String;
		setPressaoDiastolica2();
	}
	
	public void setTemperatura2() {
		this.temperatura2 = Float.parseFloat(temperatura2String);
	}
	
	public void setPressaoSistolica2() {
		this.pressaoSistolica2 = Integer.parseInt(pressaoSistolica2String);
	}
	
	public void setPressaoDiastolica2() {
		this.pressaoDiastolica2 = Integer.parseInt(pressaoDiastolica2String);
	}
	
	public void setPeso2() {
		this.peso2 = Float.parseFloat(peso2String);
	}

	public RespostaTerceira getRespostaAnterior() {
		
		RespostaTerceiraDAO daoR3 = getRespostaAlunoTerceiraDAO();
		
		respostaAnterior = daoR3.getAnteriorByConsulta(alunoLogado.getConsultaAtual());
		
		return respostaAnterior;
	}

	public void setRespostaAnterior(RespostaTerceira respostaAnterior) {
		this.respostaAnterior = respostaAnterior;
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
	
	public ArrayList<QueixaBean> getListaAluno() {
		
		QueixaRespostaSegundaDAO daoQR2 = getQueixaRespostaSegundaDAO();
		
		MedicamentoQueixaSegundaDAO daoMQR2 = getMedicamentoQueixa2DAO();

		ArrayList<QueixaRespostaSegunda> listaTemp = new ArrayList<QueixaRespostaSegunda>();
		listaTemp = daoQR2.getAllQueixasByResposta(respostaSegunda);
		
		listaAluno = new ArrayList<QueixaBean>();
		
		for(Iterator<QueixaRespostaSegunda> i = listaTemp.iterator(); i.hasNext();){
			QueixaRespostaSegunda queixaTemp = i.next();
			
			QueixaBean queixaBean = new QueixaBean();
			
			queixaBean.setConheceOuPreocupa(queixaTemp.getFlConheceOuPreocupa());
			queixaBean.setDescricao(queixaTemp.getDescricao());
			queixaBean.setPeriodoSurgimento(queixaTemp.getPeriodoSurgimento());
			queixaBean.setNumeroPRM(queixaTemp.getNumeroPRM());
			queixaBean.setPrioridade(queixaTemp.getPrioridade());
			if(queixaTemp.getTipo() != null)
			{
				queixaBean.setTipo(queixaTemp.getTipo().trim());
			}
			
			ArrayList<MedicamentoQueixaSegunda> listaMedQAux = new ArrayList<MedicamentoQueixaSegunda>();
			
			listaMedQAux = daoMQR2.getMedicamentosByQueixa(queixaTemp);
			
			for(Iterator<MedicamentoQueixaSegunda> j = listaMedQAux.iterator(); j.hasNext();){
				MedicamentoQueixaSegunda medTemp = j.next();
				MedicamentoQueixaBean medBean = new MedicamentoQueixaBean();
				
				medBean.setConheceCumpre(medTemp.getConheceCumpre());
				medBean.setCumprimento(medTemp.getCumprimento());
				medBean.setDescrição(medTemp.getDescricao());
				medBean.setDose(medTemp.getDose());
				medBean.setEfetivo(medTemp.getEfetivo());
				medBean.setNecessario(medTemp.getNecessario());
				medBean.setPeriodo(medTemp.getPeriodo());
				medBean.setSeguro(medTemp.getSeguro());
				medBean.setAlternativa1(medTemp.getAlternativa1());
				medBean.setAlternativa2(medTemp.getAlternativa2());
				medBean.setNumeroPRM(medTemp.getNumeroPRM());
				
				queixaBean.getListaMedicamentos().add(medBean);
			}
			
			listaAluno.add(queixaBean);
			
		}
		
		return listaAluno;
	}

	public void setListaAluno(ArrayList<QueixaBean> listaAluno) {
		this.listaAluno = listaAluno;
	}
	
	public ArrayList<QueixaBean> getListaGabarito() {
		
		QueixaDAO daoQ = getQueixaDAO();
		
		ArrayList<Queixa> listaTemp = new ArrayList<Queixa>();
		
		listaTemp = daoQ.getAll(alunoLogado.getConsultaAtual().getFkCasoClinico(), 1);
				
		MedicamentoQueixaDAO daoMQ = getMedicamentoQueixaDAO();
		
		listaGabarito = new ArrayList<QueixaBean>();
		
		for(Iterator<Queixa> i = listaTemp.iterator(); i.hasNext();){
			Queixa queixaTemp = i.next();
			
			QueixaBean queixaBean = new QueixaBean();
			
			queixaBean.setConheceOuPreocupa(queixaTemp.getConheceOuPreocupa());
			queixaBean.setDescricao(queixaTemp.getDescricao());
			queixaBean.setPeriodoSurgimento(queixaTemp.getPeriodoSurgimento());
			queixaBean.setNumeroPRM(queixaTemp.getNumeroPRM());
			queixaBean.setPrioridade(queixaTemp.getPrioridade());
			queixaBean.setTipo(queixaTemp.getTipo().trim());
			
			ArrayList<MedicamentoQueixa> listaMedQAux = new ArrayList<MedicamentoQueixa>();
			
			listaMedQAux = daoMQ.getMedicamentosByQueixa(queixaTemp);
			
			for(Iterator<MedicamentoQueixa> j = listaMedQAux.iterator(); j.hasNext();){
				MedicamentoQueixa medTemp = j.next();
				MedicamentoQueixaBean medBean = new MedicamentoQueixaBean();
				
				medBean.setConheceCumpre(medTemp.getConheceCumpre());
				medBean.setCumprimento(medTemp.getCumprimento());
				medBean.setDescrição(medTemp.getDescricao());
				medBean.setDose(medTemp.getDose());
				medBean.setEfetivo(medTemp.getEfetivo());
				medBean.setNecessario(medTemp.getNecessario());
				medBean.setPeriodo(medTemp.getPeriodo());
				medBean.setSeguro(medTemp.getSeguro());
				medBean.setNumeroPRM(medTemp.getNumeroPRM());
				medBean.setAlternativa1(medTemp.getAlternativa1());
				medBean.setAlternativa2(medTemp.getAlternativa2());
				
				queixaBean.getListaMedicamentos().add(medBean);
			}
			
			listaGabarito.add(queixaBean);
			
		}
		
		return listaGabarito;
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
	
	public ArrayList<Intervencao> getListaIntervencaoGabarito() {
		
		IntervencaoDAO daoI = getIntervencaoDAO();
				
		listaIntervencaoGabarito = daoI.getIntervencesByCasoClinico(alunoLogado.getConsultaAtual().getFkCasoClinico(), 1);
		
		return listaIntervencaoGabarito;
	}
	
	public ArrayList<IntervencaoRespostaSegunda> getListaIntervencaoAluno() {
		
		IntervencaoRespostaSegundaDAO daoIR2 = getIntervencaoRespostaSegundaDAO();
		
		listaIntervencaoAluno = daoIR2.getIntervencoesRSByRespostaSegunda(respostaSegunda);
		
		return listaIntervencaoAluno;
	}

	public RespostaSegunda getRespostaSegunda() {
		return respostaSegunda;
	}

	public void setRespostaSegunda(RespostaSegunda respostaSegunda) {
		this.respostaSegunda = respostaSegunda;
	}

	public void setListaIntervencaoAluno(
			ArrayList<IntervencaoRespostaSegunda> listaIntervencaoAluno) {
		this.listaIntervencaoAluno = listaIntervencaoAluno;
	}
	

	private IntervencaoRespostaSegundaDAO getIntervencaoRespostaSegundaDAO() {

		IntervencaoRespostaSegundaDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (IntervencaoRespostaSegundaDAO) ctx
					.lookup("pacienteVirtualEAR/IntervencaoRespostaSegundaDAOBean/remote");

		} catch (Exception e) {
			// TODO handle errors
		}

		return dao;
	}
	
	private IntervencaoDAO getIntervencaoDAO() {

		IntervencaoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (IntervencaoDAO) ctx
					.lookup("pacienteVirtualEAR/IntervencaoDAOBean/remote");

		} catch (Exception e) {
			// TODO handle errors
		}

		return dao;
	}

	public void setProxEncontro(String proxEncontro) {
		this.proxEncontro = proxEncontro;
	}

	public String getProxEncontro() {
		return proxEncontro;
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

	public void setListaDiarioMed(ArrayList<DiarioMedicamentosBean> listaDiarioMed) {
		this.listaDiarioMed = listaDiarioMed;
	}

	public ArrayList<DiarioMedicamentosBean> getListaDiarioMed() {
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

	public void setListaAluno3(ArrayList<QueixaBean> listaAluno3) {
		this.listaAluno3 = listaAluno3;
	}

	public ArrayList<QueixaBean> getListaAluno3() {
		
		QueixaRespostaTerceiraDAO daoQR3 = getQueixaRespostaTerceiraDAO();
		
		MedicamentoQueixaTerceiraDAO daoMQR3 = getMedicamentoQueixa3DAO();

		ArrayList<QueixaRespostaTerceira> listaTemp = new ArrayList<QueixaRespostaTerceira>();
		listaTemp = daoQR3.getAll(respostaTerceira);
		
		listaAluno3 = new ArrayList<QueixaBean>();
		
		for(Iterator<QueixaRespostaTerceira> i = listaTemp.iterator(); i.hasNext();){
			QueixaRespostaTerceira queixaTemp = i.next();
			
			QueixaBean queixaBean = new QueixaBean();
			
			queixaBean.setDescricao(queixaTemp.getDescricao());
			queixaBean.setPeriodoSurgimento(queixaTemp.getPeriodoSurgimento());
			queixaBean.setNumeroPRM(queixaTemp.getNumeroPRM());
			queixaBean.setPrioridade(queixaTemp.getPrioridade());
			if(queixaTemp.getTipo() != null)
			{
				queixaBean.setTipo(queixaTemp.getTipo().trim());
			}
			
			ArrayList<MedicamentoQueixaTerceira> listaMedQAux = new ArrayList<MedicamentoQueixaTerceira>();
			
			listaMedQAux = daoMQR3.getMedicamentosByQueixa(queixaTemp);
			
			for(Iterator<MedicamentoQueixaTerceira> j = listaMedQAux.iterator(); j.hasNext();){
				MedicamentoQueixaTerceira medTemp = j.next();
				MedicamentoQueixaBean medBean = new MedicamentoQueixaBean();
				
				medBean.setCumprimento(medTemp.getCumprimento());
				medBean.setDescrição(medTemp.getDescricao());
				medBean.setDose(medTemp.getDose());
				medBean.setEfetivo(medTemp.getEfetivo());
				medBean.setNecessario(medTemp.getNecessario());
				medBean.setPeriodo(medTemp.getPeriodo());
				medBean.setSeguro(medTemp.getSeguro());
				medBean.setAlternativa1(medTemp.getAlternativa1());
				medBean.setAlternativa2(medTemp.getAlternativa2());
				medBean.setNumeroPRM(medTemp.getNumeroPRM());
				medBean.setSituacao(medTemp.getSituacao());
				
				queixaBean.getListaMedicamentos().add(medBean);
			}
			
			listaAluno3.add(queixaBean);
			
		}
		
		return listaAluno3;
	}
	
	public void setListaGabarito3(ArrayList<QueixaBean> listaGabarito3) {
		this.listaGabarito3 = listaGabarito3;
	}

	public ArrayList<QueixaBean> getListaGabarito3() {
		
		QueixaDAO daoQ = getQueixaDAO();
		
		ArrayList<Queixa> listaTemp = new ArrayList<Queixa>();
		
		listaTemp = daoQ.getAll(alunoLogado.getConsultaAtual().getFkCasoClinico(), 2);
				
		MedicamentoQueixaDAO daoMQ = getMedicamentoQueixaDAO();
		
		listaGabarito3 = new ArrayList<QueixaBean>();
		
		for(Iterator<Queixa> i = listaTemp.iterator(); i.hasNext();){
			Queixa queixaTemp = i.next();
			
			QueixaBean queixaBean = new QueixaBean();
			
			queixaBean.setConheceOuPreocupa(queixaTemp.getConheceOuPreocupa());
			queixaBean.setDescricao(queixaTemp.getDescricao());
			queixaBean.setPeriodoSurgimento(queixaTemp.getPeriodoSurgimento());
			queixaBean.setNumeroPRM(queixaTemp.getNumeroPRM());
			queixaBean.setPrioridade(queixaTemp.getPrioridade());
			queixaBean.setTipo(queixaTemp.getTipo().trim());	
			
			ArrayList<MedicamentoQueixa> listaMedQAux = new ArrayList<MedicamentoQueixa>();
			
			listaMedQAux = daoMQ.getMedicamentosByQueixa(queixaTemp);
			
			for(Iterator<MedicamentoQueixa> j = listaMedQAux.iterator(); j.hasNext();){
				MedicamentoQueixa medTemp = j.next();
				MedicamentoQueixaBean medBean = new MedicamentoQueixaBean();
				
				medBean.setConheceCumpre(medTemp.getConheceCumpre());
				medBean.setCumprimento(medTemp.getCumprimento());
				medBean.setDescrição(medTemp.getDescricao());
				medBean.setDose(medTemp.getDose());
				medBean.setEfetivo(medTemp.getEfetivo());
				medBean.setNecessario(medTemp.getNecessario());
				medBean.setPeriodo(medTemp.getPeriodo());
				medBean.setSeguro(medTemp.getSeguro());
				medBean.setNumeroPRM(medTemp.getNumeroPRM());
				medBean.setSituacao(medTemp.getSituacao());
				medBean.setAlternativa1(medTemp.getAlternativa1());
				medBean.setAlternativa2(medTemp.getAlternativa2());
				
				queixaBean.getListaMedicamentos().add(medBean);
			}
			
			listaGabarito3.add(queixaBean);
			
		}
		
		return listaGabarito3;
	}
	
	public ArrayList<DiarioMedicamentos> getListaDiarioMedRespostaAlunoTerceira() {
		RespostaTerceiraDAO daoR3 = getRespostaAlunoTerceiraDAO();
		return daoR3.getDiarioMedicamentos(respostaTerceira.getId());		 
	}
	
	public ArrayList<DiarioMedicamentosCaso> getListaDiarioMedGabaritoTerceira() {
		DiarioMedicamentosCasoDAO daoQ = getDiarioMedCasoDAO();	
		return daoQ.getDiarioMedicamentos(respostaTerceira.getConsulta().getFkCasoClinico());		 
	}
	
	private DiarioMedicamentosCasoDAO getDiarioMedCasoDAO() {
		DiarioMedicamentosCasoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (DiarioMedicamentosCasoDAO) ctx.lookup("pacienteVirtualEAR/DiarioMedicamentosCasoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;		
	}
	
}
