package br.ufs.dcomp.pv.web;

import br.ufs.dcomp.pv.JPA.*;

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

public class RespostaQuestionarioBean {
	
	private String opcao1;
	private String justificativa1;
	
	private String opcao2;
	private String justificativa2;

	private String opcao3;
	private String justificativa3;

	private String opcao4;
	private String justificativa4;

	private String opcao5;
	private String justificativa5;

	private String opcao6;
	private String justificativa6;

	private String opcao7;
	private String justificativa7;

	private String opcao8;
	private String justificativa8;

	private String opcao9;
	private String justificativa9;

	private String opcao10;
	private String justificativa10;

	private String opcao11;
	private String justificativa11;

	private String opcao12;
	private String justificativa12;

	private String opcao13;
	private String justificativa13;

	private String opcao14;
	private String justificativa14;

	private String opcao15;
	private String justificativa15;

	private String opcao16;
	private String justificativa16;

	private String opcao17;
	private String justificativa17;

	private String opcao18;
	private String justificativa18;

	private String opcao19;
	private String justificativa19;

	private String opcao20;
	private String justificativa20;

	private String opcao21;
	private String justificativa21;

	private String opcao22;
	private String justificativa22;

	private String opcao23;
	private String justificativa23;

	private String opcao24;
	private String justificativa24;

	private String opcao25;
	private String justificativa25;

	private String opcao26;
	private String justificativa26;

	private String opcao27;
	private String justificativa27;

	private String opcao28;
	private String justificativa28;

	private String opcao29;
	private String justificativa29;

	private String opcao30;
	private String justificativa30;

	private String opcao31;
	private String justificativa31;

	private String opcao32;
	private String justificativa32;

	private String opcao33;
	private String justificativa33;

	private String opcao34;
	private String justificativa34;

	private String opcao35;
	private String justificativa35;

	private String opcao36;
	private String justificativa36;

	private String opcao37;
	private String justificativa37;
	
	private String opcao38;
	private String justificativa38;
	
	
	public RespostaQuestionarioBean(){
		
	}
		
	public Map<String, String> getListaOpcoesTipo1() {
		
		Map<String, String> opcoes = new LinkedHashMap<String, String>();
		opcoes.put(TraducaoBean.getTraducao("questoesTipo1Opcao1"), TraducaoBean.getTraducao("questoesTipo1Opcao1"));
		opcoes.put(TraducaoBean.getTraducao("questoesTipo1Opcao2"), TraducaoBean.getTraducao("questoesTipo1Opcao2"));
		opcoes.put(TraducaoBean.getTraducao("questoesTipo1Opcao3"), TraducaoBean.getTraducao("questoesTipo1Opcao3"));
		opcoes.put(TraducaoBean.getTraducao("questoesTipo1Opcao4"), TraducaoBean.getTraducao("questoesTipo1Opcao4"));
		opcoes.put(TraducaoBean.getTraducao("questoesTipo1Opcao5"), TraducaoBean.getTraducao("questoesTipo1Opcao5"));
		
		return opcoes;
	}
	
	public Map<String, String> getListaOpcoesTipo2() {
		
		Map<String, String> opcoes = new LinkedHashMap<String, String>();
		opcoes.put(TraducaoBean.getTraducao("questoesTipo2Opcao1"), TraducaoBean.getTraducao("questoesTipo2Opcao1"));
		opcoes.put(TraducaoBean.getTraducao("questoesTipo2Opcao2"), TraducaoBean.getTraducao("questoesTipo2Opcao2"));
		opcoes.put(TraducaoBean.getTraducao("questoesTipo2Opcao3"), TraducaoBean.getTraducao("questoesTipo2Opcao3"));
		opcoes.put(TraducaoBean.getTraducao("questoesTipo2Opcao4"), TraducaoBean.getTraducao("questoesTipo2Opcao4"));
		opcoes.put(TraducaoBean.getTraducao("questoesTipo2Opcao5"), TraducaoBean.getTraducao("questoesTipo2Opcao5"));
		
		return opcoes;
	}
	
	
	public String salvarQualidade()	{
		

		FacesContext facesContext = FacesContext.getCurrentInstance();		
		HttpServletRequest request = (HttpServletRequest) facesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		
		String tipo = (String) session.getAttribute("tipoU");		
		String login = "";
		
		if(tipo.equals("Aluno logado"))	{
			Aluno alu =  (Aluno) session.getAttribute("AlunoLogado");
			login = alu.getLogin(); 	
		}		
		Usuario usuario = getUsuarioDAO().getUsuario(login);
		
		
		RespostaQuestionario newResposta = new RespostaQuestionario();
		newResposta.setUsuario(usuario);
		
		newResposta.setNumeroQuestao(1);		
		newResposta.setJustificativa(justificativa1);
		newResposta.setOpcao(opcao1);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);
		
		newResposta.setNumeroQuestao(2);
		newResposta.setJustificativa(justificativa2);
		newResposta.setOpcao(opcao2);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(3);
		newResposta.setJustificativa(justificativa3);
		newResposta.setOpcao(opcao3);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(4);
		newResposta.setJustificativa(justificativa4);
		newResposta.setOpcao(opcao4);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(5);
		newResposta.setJustificativa(justificativa5);
		newResposta.setOpcao(opcao5);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(6);
		newResposta.setJustificativa(justificativa6);
		newResposta.setOpcao(opcao6);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(7);
		newResposta.setJustificativa(justificativa7);
		newResposta.setOpcao(opcao7);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(8);
		newResposta.setJustificativa(justificativa8);
		newResposta.setOpcao(opcao8);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(9);
		newResposta.setJustificativa(justificativa9);
		newResposta.setOpcao(opcao9);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(10);
		newResposta.setJustificativa(justificativa10);
		newResposta.setOpcao(opcao10);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(11);
		newResposta.setJustificativa(justificativa11);
		newResposta.setOpcao(opcao11);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(12);
		newResposta.setJustificativa(justificativa12);
		newResposta.setOpcao(opcao12);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(13);
		newResposta.setJustificativa(justificativa13);
		newResposta.setOpcao(opcao13);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);
		
		newResposta.setNumeroQuestao(38);
		newResposta.setJustificativa(justificativa38);
		newResposta.setOpcao(opcao38);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(14);
		newResposta.setJustificativa(justificativa14);
		newResposta.setOpcao(opcao14);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(15);
		newResposta.setJustificativa(justificativa15);
		newResposta.setOpcao(opcao15);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(16);
		newResposta.setJustificativa(justificativa16);
		newResposta.setOpcao(opcao16);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(17);
		newResposta.setJustificativa(justificativa17);
		newResposta.setOpcao(opcao17);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(18);
		newResposta.setJustificativa(justificativa18);
		newResposta.setOpcao(opcao18);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(19);
		newResposta.setJustificativa(justificativa19);
		newResposta.setOpcao(opcao19);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);
		
		return "sucessoQuestionario";
	}
	
	public String salvarSatisfacao(){
		
		FacesContext facesContext = FacesContext.getCurrentInstance();		
		HttpServletRequest request = (HttpServletRequest) facesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		
		String tipo = (String) session.getAttribute("tipoU");		
		String login = "";
		
		if(tipo.equals("Aluno logado"))	{
			Aluno alu =  (Aluno) session.getAttribute("AlunoLogado");
			login = alu.getLogin(); 	
		}		
		Usuario usuario = getUsuarioDAO().getUsuario(login);
		
		
		RespostaQuestionario newResposta = new RespostaQuestionario();
		newResposta.setUsuario(usuario);
		
		newResposta.setNumeroQuestao(20);		
		newResposta.setJustificativa(justificativa20);
		newResposta.setOpcao(opcao20);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);
		
		newResposta.setNumeroQuestao(21);
		newResposta.setJustificativa(justificativa21);
		newResposta.setOpcao(opcao21);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(22);
		newResposta.setJustificativa(justificativa22);
		newResposta.setOpcao(opcao22);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(23);
		newResposta.setJustificativa(justificativa23);
		newResposta.setOpcao(opcao23);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(24);
		newResposta.setJustificativa(justificativa24);
		newResposta.setOpcao(opcao24);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(25);
		newResposta.setJustificativa(justificativa25);
		newResposta.setOpcao(opcao25);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(26);
		newResposta.setJustificativa(justificativa26);
		newResposta.setOpcao(opcao26);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(27);
		newResposta.setJustificativa(justificativa27);
		newResposta.setOpcao(opcao27);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(28);
		newResposta.setJustificativa(justificativa28);
		newResposta.setOpcao(opcao28);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(29);
		newResposta.setJustificativa(justificativa29);
		newResposta.setOpcao(opcao29);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(30);
		newResposta.setJustificativa(justificativa30);
		newResposta.setOpcao(opcao30);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(31);
		newResposta.setJustificativa(justificativa31);
		newResposta.setOpcao(opcao31);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(32);
		newResposta.setJustificativa(justificativa32);
		newResposta.setOpcao(opcao32);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(33);
		newResposta.setJustificativa(justificativa33);
		newResposta.setOpcao(opcao33);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(34);
		newResposta.setJustificativa(justificativa34);
		newResposta.setOpcao(opcao34);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(35);
		newResposta.setJustificativa(justificativa35);
		newResposta.setOpcao(opcao35);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(36);
		newResposta.setJustificativa(justificativa36);
		newResposta.setOpcao(opcao36);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);

		newResposta.setNumeroQuestao(37);
		newResposta.setJustificativa(justificativa37);
		newResposta.setOpcao(opcao37);
		getRespostaQuestionarioDAO().addRespostaQuestionario(newResposta);
		
		return "sucessoQuestionario";
	}
	
	
	public RespostaQuestionarioDAO getRespostaQuestionarioDAO(){
		
		RespostaQuestionarioDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (RespostaQuestionarioDAO) ctx.lookup("pacienteVirtualEAR/RespostaQuestionarioDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	public UsuarioDAO getUsuarioDAO(){
		
		UsuarioDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (UsuarioDAO) ctx.lookup("pacienteVirtualEAR/UsuarioDAOBean/remote");
			
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
		
	public String getOpcao1() {
		return opcao1;
	}


	public void setOpcao1(String opcao1) {
		this.opcao1 = opcao1;
	}


	public String getJustificativa1() {
		return justificativa1;
	}


	public void setJustificativa1(String justificativa1) {
		this.justificativa1 = justificativa1;
	}


	public String getOpcao2() {
		return opcao2;
	}


	public void setOpcao2(String opcao2) {
		this.opcao2 = opcao2;
	}


	public String getJustificativa2() {
		return justificativa2;
	}


	public void setJustificativa2(String justificativa2) {
		this.justificativa2 = justificativa2;
	}


	public String getOpcao3() {
		return opcao3;
	}


	public void setOpcao3(String opcao3) {
		this.opcao3 = opcao3;
	}


	public String getJustificativa3() {
		return justificativa3;
	}


	public void setJustificativa3(String justificativa3) {
		this.justificativa3 = justificativa3;
	}


	public String getOpcao4() {
		return opcao4;
	}


	public void setOpcao4(String opcao4) {
		this.opcao4 = opcao4;
	}


	public String getJustificativa4() {
		return justificativa4;
	}


	public void setJustificativa4(String justificativa4) {
		this.justificativa4 = justificativa4;
	}


	public String getOpcao5() {
		return opcao5;
	}


	public void setOpcao5(String opcao5) {
		this.opcao5 = opcao5;
	}


	public String getJustificativa5() {
		return justificativa5;
	}


	public void setJustificativa5(String justificativa5) {
		this.justificativa5 = justificativa5;
	}


	public String getOpcao6() {
		return opcao6;
	}


	public void setOpcao6(String opcao6) {
		this.opcao6 = opcao6;
	}


	public String getJustificativa6() {
		return justificativa6;
	}


	public void setJustificativa6(String justificativa6) {
		this.justificativa6 = justificativa6;
	}


	public String getOpcao7() {
		return opcao7;
	}


	public void setOpcao7(String opcao7) {
		this.opcao7 = opcao7;
	}


	public String getJustificativa7() {
		return justificativa7;
	}


	public void setJustificativa7(String justificativa7) {
		this.justificativa7 = justificativa7;
	}


	public String getOpcao8() {
		return opcao8;
	}


	public void setOpcao8(String opcao8) {
		this.opcao8 = opcao8;
	}


	public String getJustificativa8() {
		return justificativa8;
	}


	public void setJustificativa8(String justificativa8) {
		this.justificativa8 = justificativa8;
	}


	public String getOpcao9() {
		return opcao9;
	}


	public void setOpcao9(String opcao9) {
		this.opcao9 = opcao9;
	}


	public String getJustificativa9() {
		return justificativa9;
	}


	public void setJustificativa9(String justificativa9) {
		this.justificativa9 = justificativa9;
	}


	public String getOpcao10() {
		return opcao10;
	}


	public void setOpcao10(String opcao10) {
		this.opcao10 = opcao10;
	}


	public String getJustificativa10() {
		return justificativa10;
	}


	public void setJustificativa10(String justificativa10) {
		this.justificativa10 = justificativa10;
	}


	public String getOpcao11() {
		return opcao11;
	}


	public void setOpcao11(String opcao11) {
		this.opcao11 = opcao11;
	}


	public String getJustificativa11() {
		return justificativa11;
	}


	public void setJustificativa11(String justificativa11) {
		this.justificativa11 = justificativa11;
	}


	public String getOpcao12() {
		return opcao12;
	}


	public void setOpcao12(String opcao12) {
		this.opcao12 = opcao12;
	}


	public String getJustificativa12() {
		return justificativa12;
	}


	public void setJustificativa12(String justificativa12) {
		this.justificativa12 = justificativa12;
	}


	public String getOpcao13() {
		return opcao13;
	}


	public void setOpcao13(String opcao13) {
		this.opcao13 = opcao13;
	}


	public String getJustificativa13() {
		return justificativa13;
	}


	public void setJustificativa13(String justificativa13) {
		this.justificativa13 = justificativa13;
	}


	public String getOpcao14() {
		return opcao14;
	}


	public void setOpcao14(String opcao14) {
		this.opcao14 = opcao14;
	}


	public String getJustificativa14() {
		return justificativa14;
	}


	public void setJustificativa14(String justificativa14) {
		this.justificativa14 = justificativa14;
	}


	public String getOpcao15() {
		return opcao15;
	}


	public void setOpcao15(String opcao15) {
		this.opcao15 = opcao15;
	}


	public String getJustificativa15() {
		return justificativa15;
	}


	public void setJustificativa15(String justificativa15) {
		this.justificativa15 = justificativa15;
	}


	public String getOpcao16() {
		return opcao16;
	}


	public void setOpcao16(String opcao16) {
		this.opcao16 = opcao16;
	}


	public String getJustificativa16() {
		return justificativa16;
	}


	public void setJustificativa16(String justificativa16) {
		this.justificativa16 = justificativa16;
	}


	public String getOpcao17() {
		return opcao17;
	}


	public void setOpcao17(String opcao17) {
		this.opcao17 = opcao17;
	}


	public String getJustificativa17() {
		return justificativa17;
	}


	public void setJustificativa17(String justificativa17) {
		this.justificativa17 = justificativa17;
	}


	public String getOpcao18() {
		return opcao18;
	}


	public void setOpcao18(String opcao18) {
		this.opcao18 = opcao18;
	}


	public String getJustificativa18() {
		return justificativa18;
	}


	public void setJustificativa18(String justificativa18) {
		this.justificativa18 = justificativa18;
	}


	public String getOpcao19() {
		return opcao19;
	}


	public void setOpcao19(String opcao19) {
		this.opcao19 = opcao19;
	}


	public String getJustificativa19() {
		return justificativa19;
	}


	public void setJustificativa19(String justificativa19) {
		this.justificativa19 = justificativa19;
	}


	public String getOpcao20() {
		return opcao20;
	}


	public void setOpcao20(String opcao20) {
		this.opcao20 = opcao20;
	}


	public String getJustificativa20() {
		return justificativa20;
	}


	public void setJustificativa20(String justificativa20) {
		this.justificativa20 = justificativa20;
	}


	public String getOpcao21() {
		return opcao21;
	}


	public void setOpcao21(String opcao21) {
		this.opcao21 = opcao21;
	}


	public String getJustificativa21() {
		return justificativa21;
	}


	public void setJustificativa21(String justificativa21) {
		this.justificativa21 = justificativa21;
	}


	public String getOpcao22() {
		return opcao22;
	}


	public void setOpcao22(String opcao22) {
		this.opcao22 = opcao22;
	}


	public String getJustificativa22() {
		return justificativa22;
	}


	public void setJustificativa22(String justificativa22) {
		this.justificativa22 = justificativa22;
	}


	public String getOpcao23() {
		return opcao23;
	}


	public void setOpcao23(String opcao23) {
		this.opcao23 = opcao23;
	}


	public String getJustificativa23() {
		return justificativa23;
	}


	public void setJustificativa23(String justificativa23) {
		this.justificativa23 = justificativa23;
	}


	public String getOpcao24() {
		return opcao24;
	}


	public void setOpcao24(String opcao24) {
		this.opcao24 = opcao24;
	}


	public String getJustificativa24() {
		return justificativa24;
	}


	public void setJustificativa24(String justificativa24) {
		this.justificativa24 = justificativa24;
	}


	public String getOpcao25() {
		return opcao25;
	}


	public void setOpcao25(String opcao25) {
		this.opcao25 = opcao25;
	}


	public String getJustificativa25() {
		return justificativa25;
	}


	public void setJustificativa25(String justificativa25) {
		this.justificativa25 = justificativa25;
	}


	public String getOpcao26() {
		return opcao26;
	}


	public void setOpcao26(String opcao26) {
		this.opcao26 = opcao26;
	}


	public String getJustificativa26() {
		return justificativa26;
	}


	public void setJustificativa26(String justificativa26) {
		this.justificativa26 = justificativa26;
	}


	public String getOpcao27() {
		return opcao27;
	}


	public void setOpcao27(String opcao27) {
		this.opcao27 = opcao27;
	}


	public String getJustificativa27() {
		return justificativa27;
	}


	public void setJustificativa27(String justificativa27) {
		this.justificativa27 = justificativa27;
	}


	public String getOpcao28() {
		return opcao28;
	}


	public void setOpcao28(String opcao28) {
		this.opcao28 = opcao28;
	}


	public String getJustificativa28() {
		return justificativa28;
	}


	public void setJustificativa28(String justificativa28) {
		this.justificativa28 = justificativa28;
	}


	public String getOpcao29() {
		return opcao29;
	}


	public void setOpcao29(String opcao29) {
		this.opcao29 = opcao29;
	}


	public String getJustificativa29() {
		return justificativa29;
	}


	public void setJustificativa29(String justificativa29) {
		this.justificativa29 = justificativa29;
	}


	public String getOpcao30() {
		return opcao30;
	}


	public void setOpcao30(String opcao30) {
		this.opcao30 = opcao30;
	}


	public String getJustificativa30() {
		return justificativa30;
	}


	public void setJustificativa30(String justificativa30) {
		this.justificativa30 = justificativa30;
	}


	public String getOpcao31() {
		return opcao31;
	}


	public void setOpcao31(String opcao31) {
		this.opcao31 = opcao31;
	}


	public String getJustificativa31() {
		return justificativa31;
	}


	public void setJustificativa31(String justificativa31) {
		this.justificativa31 = justificativa31;
	}


	public String getOpcao32() {
		return opcao32;
	}


	public void setOpcao32(String opcao32) {
		this.opcao32 = opcao32;
	}


	public String getJustificativa32() {
		return justificativa32;
	}


	public void setJustificativa32(String justificativa32) {
		this.justificativa32 = justificativa32;
	}


	public String getOpcao33() {
		return opcao33;
	}


	public void setOpcao33(String opcao33) {
		this.opcao33 = opcao33;
	}


	public String getJustificativa33() {
		return justificativa33;
	}


	public void setJustificativa33(String justificativa33) {
		this.justificativa33 = justificativa33;
	}


	public String getOpcao34() {
		return opcao34;
	}


	public void setOpcao34(String opcao34) {
		this.opcao34 = opcao34;
	}


	public String getJustificativa34() {
		return justificativa34;
	}


	public void setJustificativa34(String justificativa34) {
		this.justificativa34 = justificativa34;
	}


	public String getOpcao35() {
		return opcao35;
	}


	public void setOpcao35(String opcao35) {
		this.opcao35 = opcao35;
	}


	public String getJustificativa35() {
		return justificativa35;
	}


	public void setJustificativa35(String justificativa35) {
		this.justificativa35 = justificativa35;
	}


	public String getOpcao36() {
		return opcao36;
	}


	public void setOpcao36(String opcao36) {
		this.opcao36 = opcao36;
	}


	public String getJustificativa36() {
		return justificativa36;
	}


	public void setJustificativa36(String justificativa36) {
		this.justificativa36 = justificativa36;
	}


	public String getOpcao37() {
		return opcao37;
	}


	public void setOpcao37(String opcao37) {
		this.opcao37 = opcao37;
	}


	public String getJustificativa37() {
		return justificativa37;
	}


	public void setJustificativa37(String justificativa37) {
		this.justificativa37 = justificativa37;
	}


	public void setOpcao38(String opcao38) {
		this.opcao38 = opcao38;
	}


	public String getOpcao38() {
		return opcao38;
	}


	public void setJustificativa38(String justificativa38) {
		this.justificativa38 = justificativa38;
	}


	public String getJustificativa38() {
		return justificativa38;
	}
	
}
