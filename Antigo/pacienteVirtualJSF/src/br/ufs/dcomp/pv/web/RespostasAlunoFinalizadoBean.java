package br.ufs.dcomp.pv.web;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;

import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import br.ufs.dcomp.pv.JPA.Aluno;
import br.ufs.dcomp.pv.JPA.AlunoDAO;
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
import br.ufs.dcomp.pv.JPA.Queixa;
import br.ufs.dcomp.pv.JPA.QueixaDAO;
import br.ufs.dcomp.pv.JPA.QueixaRespostaPrimeira;
import br.ufs.dcomp.pv.JPA.QueixaRespostaPrimeiraDAO;
import br.ufs.dcomp.pv.JPA.RazaoEncontroCaso;
import br.ufs.dcomp.pv.JPA.RazaoEncontroCasoDAO;
import br.ufs.dcomp.pv.JPA.RespostaPrimeira;
import br.ufs.dcomp.pv.JPA.RespostaPrimeiraDAO;
import br.ufs.dcomp.pv.JPA.RespostaQuarta;
import br.ufs.dcomp.pv.JPA.RespostaQuartaDAO;
import br.ufs.dcomp.pv.JPA.RespostaSegunda;
import br.ufs.dcomp.pv.JPA.RespostaSegundaDAO;
import br.ufs.dcomp.pv.JPA.RespostaTerceira;
import br.ufs.dcomp.pv.JPA.RespostaTerceiraDAO;
import br.ufs.dcomp.pv.JPA.UsuarioDAO;
import br.ufs.dcomp.pv.JPA.Usuario;
import br.ufs.dcomp.pv.web.AlunoBean;


public class RespostasAlunoFinalizadoBean {
	
	private Aluno alunoEscolhido;
	
	public void setAlunoEscolhido(Aluno alunoEscolhido) {
		this.alunoEscolhido = alunoEscolhido;
	}

	public Aluno getAlunoEscolhido() {
		return alunoEscolhido;
	}
	
	private String alunoEscolhidoAux;
	
	public void setAlunoEscolhidoAux(String alunoEscolhidoAux) {
		this.alunoEscolhidoAux = alunoEscolhidoAux;
	}

	public String getAlunoEscolhidoAux() {
		return alunoEscolhidoAux;
	}
	
	private ArrayList<SelectItem> opcoesAlunosFinalizados;

	public void setOpcoesAlunoFinalizados(ArrayList<SelectItem> opcoesAlunosFinalizados) {
		this.opcoesAlunosFinalizados = opcoesAlunosFinalizados;
	}

	public ArrayList<SelectItem> getOpcoesAlunosFinalizados() {
		
		opcoesAlunosFinalizados = new ArrayList<SelectItem>();
		
		AlunoBean alu = new AlunoBean();
		AlunoDAO daoA = alu.getAlunoDAO();
		ArrayList<Aluno> listaAluno = daoA.getAlunosFinalizados();
		for(Iterator<Aluno> i = listaAluno.iterator(); i.hasNext();){
			Aluno alunoTemp = i.next();
			SelectItem temp = new SelectItem(alunoTemp.getLogin(), alunoTemp.getMatricula()+" - "+alunoTemp.getNome());
			opcoesAlunosFinalizados.add(temp);
		}		
		return opcoesAlunosFinalizados;
	}
	
	private RespostaPrimeira respostaPrimeira;
	private RespostaSegunda respostaSegunda;
	private RespostaTerceira respostaTerceira;
	private RespostaQuarta respostaQuarta;
	
	public String escolherAluno(){		

		AlunoBean alu = new AlunoBean();
		AlunoDAO daoA = alu.getAlunoDAO();
		
		alunoEscolhido = daoA.getAluno(alunoEscolhidoAux);
		
		RespostaPrimeiraDAO daoRespostaPrimeira = getRespostaAlunoPrimeiraDAO();		
		setRespostaPrimeira(daoRespostaPrimeira.getRespostaPrimeiraByConsulta(alunoEscolhido.getConsultaAtual()));
		
		RespostaSegundaDAO daoRespostaSegunda = getRespostaAlunoSegundaDAO();
		setRespostaSegunda(daoRespostaSegunda.getAnteriorByConsulta(alunoEscolhido.getConsultaAtual()));
			
		RespostaTerceiraDAO daoRespostaTerceira = getRespostaAlunoTerceiraDAO();
		setRespostaTerceira(daoRespostaTerceira.getAnteriorByConsulta(alunoEscolhido.getConsultaAtual())); 
		
		RespostaQuartaDAO daoRespostaQuarta = getRespostaAlunoQuartaDAO();
		setRespostaQuarta(daoRespostaQuarta.getAnteriorByConsulta(alunoEscolhido.getConsultaAtual()));
		
		return "alunoFinalizado";
	}
		
	private String escolaridadeTraduzida;
	private String escolaridadeTraduzidaAluno;
	
	private float imcCorreto;
	public void setImcCorreto(float imcCorreto) {
		this.imcCorreto = imcCorreto;
	}

	public float getImcCorreto() {
		
		imcCorreto = (float) (respostaPrimeira.getPeso() / Math.pow(respostaPrimeira.getAltura(), 2)) ;
		
		return imcCorreto;
	}
	
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
	
	private ArrayList<QueixaRespostaPrimeira> listaQueixaResposta1;
	private ArrayList<Queixa> listaQueixa1;
	
	public ArrayList<QueixaRespostaPrimeira> getListaQueixaResposta1() {
		
		RespostaPrimeiraDAO daoR1 = getRespostaAlunoPrimeiraDAO();
		QueixaRespostaPrimeiraDAO daoQR1 = getQueixaRespostaPrimeiraDAO();
		
		listaQueixaResposta1 = daoQR1.getQueixasByResposta(daoR1.getAnteriorByConsulta(alunoEscolhido.getConsultaAtual()));
		
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
	
	private RespostaQuartaDAO getRespostaAlunoQuartaDAO(){
		
		RespostaQuartaDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (RespostaQuartaDAO) ctx.lookup("pacienteVirtualEAR/RespostaQuartaDAOBean/remote");
			
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

	public void setRespostaPrimeira(RespostaPrimeira respostaPrimeira) {
		this.respostaPrimeira = respostaPrimeira;
	}

	public RespostaPrimeira getRespostaPrimeira() {
		return respostaPrimeira;
	}

	public void setRespostaSegunda(RespostaSegunda respostaSegunda) {
		this.respostaSegunda = respostaSegunda;
	}

	public RespostaSegunda getRespostaSegunda() {
		return respostaSegunda;
	}

	public void setRespostaTerceira(RespostaTerceira respostaTerceira) {
		this.respostaTerceira = respostaTerceira;
	}

	public RespostaTerceira getRespostaTerceira() {
		return respostaTerceira;
	}

	public void setRespostaQuarta(RespostaQuarta respostaQuarta) {
		this.respostaQuarta = respostaQuarta;
	}

	public RespostaQuarta getRespostaQuarta() {
		return respostaQuarta;
	}	
}
