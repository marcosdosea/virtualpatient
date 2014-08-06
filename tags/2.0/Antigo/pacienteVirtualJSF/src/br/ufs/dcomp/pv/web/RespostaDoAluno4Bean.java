package br.ufs.dcomp.pv.web;

import br.ufs.dcomp.pv.JPA.Aluno;
import br.ufs.dcomp.pv.JPA.AlunoDAO;
import br.ufs.dcomp.pv.JPA.CasoClinicoDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoNaoPrescrito;
import br.ufs.dcomp.pv.JPA.MedicamentoPrescrito;
import br.ufs.dcomp.pv.JPA.ParametroClinico;
import br.ufs.dcomp.pv.JPA.RespostaQuarta;
import br.ufs.dcomp.pv.JPA.RespostaQuartaDAO;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.faces.context.FacesContext;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.sql.Date;

public class RespostaDoAluno4Bean {
	
	private RespostaQuarta respostaAnterior;
		
	private RespostaQuarta newResposta;
	
	Aluno alunoLogado;
		
	private Date dataRealizacao;
	
	private String nomeDr;
	
	private String telefone;
	
	private String motivosRefMedica;
	
	private String alternativaRefMed1;
	
	private String alternativaRefMed2;
	
	private String referencias;
	
	private String farmacNome;
	
	private String farmacCrf;

	private String farmacTel;
	
	
	public RespostaDoAluno4Bean(){
		
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		
		alunoLogado = (Aluno) session.getAttribute("AlunoLogado");				
	}
	
	public String teste(){
		
		RespostaQuartaDAO daoRA = getRespostaQuartaDAO();
		
		newResposta = new RespostaQuarta();
		
		newResposta.setConsulta(alunoLogado.getConsultaAtual());
		newResposta.setDataRealizacao(new Date(new java.util.Date().getTime()));		
		newResposta.setNota(-1);
		newResposta.setNomeDr(nomeDr);
		newResposta.setTelefone(telefone);
		newResposta.setMotivosRefMedica(motivosRefMedica);
		newResposta.setAlternativaRefMed1(alternativaRefMed1);
		newResposta.setAlternativaRefMed2(alternativaRefMed2);
		newResposta.setReferencias(referencias);
		newResposta.setFarmacNome(farmacNome);
		newResposta.setFarmacCrf(farmacCrf);
		newResposta.setFarmacTel(farmacTel);
		
		newResposta.setId(daoRA.addRespostaQuarta(newResposta));	
		
		AlunoDAO daoA = getAlunoDAO();
		
		alunoLogado.setLiberado('N');
		
		daoA.progredirConsulta(alunoLogado);
		
		return "Quarta consulta concluida";		
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
	
	private RespostaQuartaDAO getRespostaQuartaDAO(){
		
		RespostaQuartaDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (RespostaQuartaDAO) ctx.lookup("pacienteVirtualEAR/RespostaQuartaDAOBean/remote");
			
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


	public Aluno getAlunoLogado() {
		return alunoLogado;
	}

	public void setAlunoLogado(Aluno alunoLogado) {
		this.alunoLogado = alunoLogado;
	}
	
	public void setDataRealizacao(Date dataRealizacao) {
		this.dataRealizacao = dataRealizacao;
	}

	public Date getDataRealizacao() {
		return dataRealizacao;
	}
	
	public RespostaQuarta getNewResposta() {
		return newResposta;
	}

	public void setNewResposta(RespostaQuarta newResposta) {
		this.newResposta = newResposta;
	}

	public RespostaQuarta getRespostaAnterior() {
		
		RespostaQuartaDAO daoR4 = getRespostaQuartaDAO();
		
		respostaAnterior = daoR4.getAnteriorByConsulta(alunoLogado.getConsultaAtual());
		
		return respostaAnterior;
	}

	public void setRespostaAnterior(RespostaQuarta respostaAnterior) {
		this.respostaAnterior = respostaAnterior;
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
}
