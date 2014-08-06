package br.ufs.dcomp.pv.web;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;

import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.mail.MessagingException;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import br.ufs.dcomp.pv.JPA.*;

public class AvaliarConsultaBean {

	private ArrayList<Turma> listaTurma;
	private ArrayList<Aluno> listaAluno;
	private Aluno alunoEscolhido;
	private Tutor tutorLogado;
	
	private RespostaPrimeira respostaPrimeira;
	
	private ArrayList<SelectItem> opcoesTurma;
	private ArrayList<SelectItem> opcoesAluno;	
	private Turma turmaEscolhida;
	
	private int turmaEscolhidaAux;
	private String alunoEscolhidoAux;
		
	private int consulta;
		
	private float imcCorreto;
	
	private float nota;
	private String comentarios;
	private String comentariosAluno;
	
	private ArrayList<ParametroClinico> listaParametros;
	private ArrayList<MedicamentoNaoPrescrito> listaMedicamentoNP;
	private ArrayList<MedicamentoPrescrito> listaMedicamentoP;
	private ArrayList<MedicamentoAnterior> listaMedicamentoAnt;
	
	private ArrayList<QueixaRespostaPrimeira> listaQueixaResposta1;
	private ArrayList<Queixa> listaQueixa1;
	
	//private ArrayList<Intervencao> listaIntervencao1;
	//private ArrayList<IntervencaoResposta> listaIntervencaoResposta1;
	
	public AvaliarConsultaBean(){
		
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		
		Usuario auxiliar = (Usuario) session.getAttribute("TutorLogado");
		TutorBean tutBean = new TutorBean();
		TutorDAO daoT = tutBean.getTutorDAO();
		
		tutorLogado = daoT.getTutor(auxiliar.getLogin());

		CadastrarTurmaBean auxBean = new CadastrarTurmaBean();
		TurmaDAO daoTurma = auxBean.getTurmaDAO();
		System.out.println("executando construtor");
		listaTurma = daoTurma.getAllTurmas();
		opcoesTurma = new ArrayList<SelectItem>();
		
		for(Iterator<Turma> i = listaTurma.iterator(); i.hasNext();){
			Turma turmaTemp = i.next();
			SelectItem temp = new SelectItem(turmaTemp.getId(),turmaTemp.getNmDisciplina() + " - " + turmaTemp.getPeriodo()+" - "+turmaTemp.getCodigo());
			opcoesTurma.add(temp);
		}
		
	}
	
	public String escolherTurma(){
		
		CadastrarTurmaBean auxBean = new CadastrarTurmaBean();
		TurmaDAO daoTurma = auxBean.getTurmaDAO();

		turmaEscolhida = daoTurma.getTurma(turmaEscolhidaAux);
				
		return "Turma Escolhida com Sucesso";
	}
	
	public String addRazaoEncontroCaso(){
		
		RazaoEncontro newRazao1 = new RazaoEncontro();
		newRazao1.setDescricao(respostaPrimeira.getOutroRazaoEncontroTxt());
		newRazao1.setIdioma(TraducaoBean.getIdiomaAtual());
		getRazaoEncontroDAO().addRazaoEncontro(newRazao1);
	
		RazaoEncontroCaso newRazao = new RazaoEncontroCaso();
		newRazao.setCasoclinico(respostaPrimeira.getConsulta().getFkCasoClinico());
		newRazao.setDescricao(respostaPrimeira.getOutroRazaoEncontroTxt());
		getRazaoEncontroCasoDAO().addRazaoEncontroCaso(newRazao);
		
		return "success";			
	}
	
	public String addExperienciaMedicamentos1Caso(){
		
		ExperienciaMedicamentos1 newExp1 = new ExperienciaMedicamentos1();
		newExp1.setDescricao(respostaPrimeira.getOutroExpMed1Txt());
		newExp1.setIdioma(TraducaoBean.getIdiomaAtual());
		getExperienciaMedicamentos1DAO().addExperienciaMedicamentos1(newExp1);
		
		ExperienciaMedicamentos1Caso newExp = new ExperienciaMedicamentos1Caso();
		newExp.setCasoclinico(respostaPrimeira.getConsulta().getFkCasoClinico());
		newExp.setDescricao(respostaPrimeira.getOutroExpMed1Txt());
		getExperienciaMedicamentos1CasoDAO().addExperienciaMedicamentos1Caso(newExp);
		
		return "success";			
	}
	
	public String addExperienciaMedicamentos2Caso(){
		
		ExperienciaMedicamentos2 newExp2 = new ExperienciaMedicamentos2();
		newExp2.setDescricao(respostaPrimeira.getOutroExpMed2Txt());
		newExp2.setIdioma(TraducaoBean.getIdiomaAtual());
		getExperienciaMedicamentos2DAO().addExperienciaMedicamentos2(newExp2);
		
		ExperienciaMedicamentos2Caso newExp = new ExperienciaMedicamentos2Caso();
		newExp.setCasoclinico(respostaPrimeira.getConsulta().getFkCasoClinico());
		newExp.setDescricao(respostaPrimeira.getOutroExpMed2Txt());
		getExperienciaMedicamentos2CasoDAO().addExperienciaMedicamentos2Caso(newExp);
		
		return "success";			
	}
	
	public String addExperienciaMedicamentos3Caso(){
		
		ExperienciaMedicamentos3 newExp3 = new ExperienciaMedicamentos3();
		newExp3.setDescricao(respostaPrimeira.getOutroExpMed3Txt());
		newExp3.setIdioma(TraducaoBean.getIdiomaAtual());
		getExperienciaMedicamentos3DAO().addExperienciaMedicamentos3(newExp3);
		
		ExperienciaMedicamentos3Caso newExp = new ExperienciaMedicamentos3Caso();
		newExp.setCasoclinico(respostaPrimeira.getConsulta().getFkCasoClinico());
		newExp.setDescricao(respostaPrimeira.getOutroExpMed3Txt());
		getExperienciaMedicamentos3CasoDAO().addExperienciaMedicamentos3Caso(newExp);
		
		return "success";			
	}
	
	public String addExperienciaMedicamentos4Caso(){
		
		ExperienciaMedicamentos4 newExp4 = new ExperienciaMedicamentos4();
		newExp4.setDescricao(respostaPrimeira.getOutroExpMed4Txt());
		newExp4.setIdioma(TraducaoBean.getIdiomaAtual());
		getExperienciaMedicamentos4DAO().addExperienciaMedicamentos4(newExp4);
		
		ExperienciaMedicamentos4Caso newExp = new ExperienciaMedicamentos4Caso();
		newExp.setCasoclinico(respostaPrimeira.getConsulta().getFkCasoClinico());
		newExp.setDescricao(respostaPrimeira.getOutroExpMed4Txt());
		getExperienciaMedicamentos4CasoDAO().addExperienciaMedicamentos4Caso(newExp);
		
		return "success";			
	}
	
	public String addExperienciaMedicamentos5Caso(){
		
		ExperienciaMedicamentos5 newExp5 = new ExperienciaMedicamentos5();
		newExp5.setDescricao(respostaPrimeira.getOutroExpMed5Txt());
		newExp5.setIdioma(TraducaoBean.getIdiomaAtual());
		getExperienciaMedicamentos5DAO().addExperienciaMedicamentos5(newExp5);
		
		ExperienciaMedicamentos5Caso newExp = new ExperienciaMedicamentos5Caso();
		newExp.setCasoclinico(respostaPrimeira.getConsulta().getFkCasoClinico());
		newExp.setDescricao(respostaPrimeira.getOutroExpMed5Txt());
		getExperienciaMedicamentos5CasoDAO().addExperienciaMedicamentos5Caso(newExp);
		
		return "success";			
	}
	
	public String addExperienciaMedicamentosConcCaso(){
		
		ExperienciaMedicamentosConc newExpConc = new ExperienciaMedicamentosConc();
		newExpConc.setDescricao(respostaPrimeira.getOutroExpMedConcTxt());
		newExpConc.setIdioma(TraducaoBean.getIdiomaAtual());
		getExperienciaMedicamentosConcDAO().addExperienciaMedicamentosConc(newExpConc);
		
		ExperienciaMedicamentosConcCaso newExp = new ExperienciaMedicamentosConcCaso();
		newExp.setCasoclinico(respostaPrimeira.getConsulta().getFkCasoClinico());
		newExp.setDescricao(respostaPrimeira.getOutroExpMedConcTxt());
		getExperienciaMedicamentosConcCasoDAO().addExperienciaMedicamentosConcCaso(newExp);
		
		return "success";			
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
	
	private RazaoEncontroDAO getRazaoEncontroDAO() {
		RazaoEncontroDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (RazaoEncontroDAO) ctx.lookup("pacienteVirtualEAR/RazaoEncontroDAOBean/remote");
			
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
	
	private ExperienciaMedicamentos1DAO getExperienciaMedicamentos1DAO() {
		ExperienciaMedicamentos1DAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentos1DAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentos1DAOBean/remote");
			
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
	
	private ExperienciaMedicamentos2DAO getExperienciaMedicamentos2DAO() {
		ExperienciaMedicamentos2DAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentos2DAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentos2DAOBean/remote");
			
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
	
	private ExperienciaMedicamentos3DAO getExperienciaMedicamentos3DAO() {
		ExperienciaMedicamentos3DAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentos3DAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentos3DAOBean/remote");
			
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
	
	private ExperienciaMedicamentos4DAO getExperienciaMedicamentos4DAO() {
		ExperienciaMedicamentos4DAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentos4DAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentos4DAOBean/remote");
			
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
	
	private ExperienciaMedicamentos5DAO getExperienciaMedicamentos5DAO() {
		ExperienciaMedicamentos5DAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentos5DAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentos5DAOBean/remote");
			
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
	
	private ExperienciaMedicamentosConcDAO getExperienciaMedicamentosConcDAO() {
		ExperienciaMedicamentosConcDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentosConcDAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentosConcDAOBean/remote");
			
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

	public ArrayList<Turma> getListaTurma() {
		return listaTurma;
	}

	public void setListaTurma(ArrayList<Turma> listaTurma) {
		this.listaTurma = listaTurma;
	}

	public Aluno getAlunoEscolhido() {
		return alunoEscolhido;
	}

	public void setAlunoEscolhido(Aluno alunoEscolhido) {
		this.alunoEscolhido = alunoEscolhido;
	}

	public Tutor getTutorLogado() {
		return tutorLogado;
	}

	public void setTutorLogado(Tutor tutorLogado) {
		this.tutorLogado = tutorLogado;
	}

	public ArrayList<SelectItem> getOpcoesTurma() {
		return opcoesTurma;
	}

	public void setOpcoesTurma(ArrayList<SelectItem> opcoesTurma) {
		this.opcoesTurma = opcoesTurma;
	}

	public void setTurmaEscolhida(Turma turmaEscolhida) {
		this.turmaEscolhida = turmaEscolhida;
	}

	public Turma getTurmaEscolhida() {
		return turmaEscolhida;
	}

	public void setTurmaEscolhidaAux(int turmaEscolhidaAux) {
		this.turmaEscolhidaAux = turmaEscolhidaAux;
	}

	public int getTurmaEscolhidaAux() {
		return turmaEscolhidaAux;
	}
	
	public void setOpcoesAluno(ArrayList<SelectItem> opcoesAluno) {
		this.opcoesAluno = opcoesAluno;
	}

	public ArrayList<SelectItem> getOpcoesAluno() {
		
		opcoesAluno = new ArrayList<SelectItem>();
		
		AlunoBean alu = new AlunoBean();
		AlunoDAO daoA = alu.getAlunoDAO();
		listaAluno = daoA.getOcupados(turmaEscolhida);
		for(Iterator<Aluno> i = listaAluno.iterator(); i.hasNext();){
			Aluno alunoTemp = i.next();
			SelectItem temp = new SelectItem(alunoTemp.getLogin(), alunoTemp.getMatricula()+" - "+alunoTemp.getNome());
			opcoesAluno.add(temp);
		}

		
		return opcoesAluno;
	}
	
	public String escolherAluno(){
		

		AlunoBean alu = new AlunoBean();
		AlunoDAO daoA = alu.getAlunoDAO();
		
		alunoEscolhido = daoA.getAluno(alunoEscolhidoAux);
		consulta = alunoEscolhido.getNrConsulta();

		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		
		session.setAttribute("avaliado", alunoEscolhido);

		
		//System.out.println(alunoEscolhido.getNome());
								
		return "aluno escolhido com sucesso "+consulta;
	}

	public void setListaAluno(ArrayList<Aluno> listaAluno) {
		this.listaAluno = listaAluno;
	}

	public ArrayList<Aluno> getListaAluno() {
		return listaAluno;
	}

	public void setAlunoEscolhidoAux(String alunoEscolhidoAux) {
		this.alunoEscolhidoAux = alunoEscolhidoAux;
	}

	public String getAlunoEscolhidoAux() {
		return alunoEscolhidoAux;
	}

	public void setConsulta(int consulta) {
		this.consulta = consulta;
	}

	public int getConsulta() {
		return consulta;
	}

	public void setImcCorreto(float imcCorreto) {
		this.imcCorreto = imcCorreto;
	}

	public float getImcCorreto() {
		
		RespostaPrimeiraDAO daoR1 = getRespostaAlunoPrimeiraDAO();
		
		imcCorreto = (float) (daoR1.getUltimaRespostaByConsulta(alunoEscolhido.getConsultaAtual().getId()).getPeso() / Math.pow(daoR1.getUltimaRespostaByConsulta(alunoEscolhido.getConsultaAtual().getId()).getAltura(), 2)) ;
		
		return imcCorreto;
	}
	
	public void setListaMedicamentoAnt(ArrayList<MedicamentoAnterior> listaMedicamentoAnt) {
		this.listaMedicamentoAnt = listaMedicamentoAnt;
	}

	public ArrayList<MedicamentoAnterior> getListaMedicamentoAnt() {
		
		CasoClinicoBean ccBean = new CasoClinicoBean();
		
		CasoClinicoDAO daoCC = ccBean.getCasoClinicoDAO();
		
		listaMedicamentoAnt =  daoCC.getAllMedicamentosAnteriores(alunoEscolhido.getConsultaAtual().getFkCasoClinico().getId());
		
		return listaMedicamentoAnt;
	}

	public ArrayList<ParametroClinico> getListaParametros() {
		
		CasoClinicoBean ccBean = new CasoClinicoBean();
		
		CasoClinicoDAO daoCC = ccBean.getCasoClinicoDAO();
		
		listaParametros = daoCC.getAllParametrosClinicos(alunoEscolhido.getConsultaAtual().getFkCasoClinico().getId());
		
		return listaParametros;
	}

	public void setListaParametros(ArrayList<ParametroClinico> listaParametros) {
		this.listaParametros = listaParametros;
	}

	public ArrayList<MedicamentoNaoPrescrito> getListaMedicamentoNP() {
		
		CasoClinicoBean ccBean = new CasoClinicoBean();
		
		CasoClinicoDAO daoCC = ccBean.getCasoClinicoDAO();
		
		listaMedicamentoNP = daoCC.getAllMedicamentosNaoPrescritos(alunoEscolhido.getConsultaAtual().getFkCasoClinico().getId());
		
		return listaMedicamentoNP;
	}

	public void setListaMedicamentoNP(
			ArrayList<MedicamentoNaoPrescrito> listaMedicamentoNP) {
		this.listaMedicamentoNP = listaMedicamentoNP;
	}

	public ArrayList<MedicamentoPrescrito> getListaMedicamentoP() {
		
		CasoClinicoBean ccBean = new CasoClinicoBean();
		
		CasoClinicoDAO daoCC = ccBean.getCasoClinicoDAO();
		
		listaMedicamentoP = daoCC.getAllMedicamentosPrescritos(alunoEscolhido.getConsultaAtual().getFkCasoClinico().getId());
		
		return listaMedicamentoP;
	}

	public void setListaMedicamentoP(
			ArrayList<MedicamentoPrescrito> listaMedicamentoP) {
		this.listaMedicamentoP = listaMedicamentoP;
	}


	public ArrayList<QueixaRespostaPrimeira> getListaQueixaResposta1() {
		
		RespostaPrimeiraDAO daoR1 = getRespostaAlunoPrimeiraDAO();
		QueixaRespostaPrimeiraDAO daoQR1 = getQueixaRespostaPrimeiraDAO();
		
		listaQueixaResposta1 = daoQR1.getQueixasByResposta(daoR1.getUltimaRespostaByConsulta(alunoEscolhido.getConsultaAtual().getId()));
		
		return listaQueixaResposta1;
	}

	public void setListaQueixaResposta1(ArrayList<QueixaRespostaPrimeira> listaQueixaResposta1) {
		this.listaQueixaResposta1 = listaQueixaResposta1;
	}

	/*public ArrayList<Intervencao> getListaIntervencao1() {
		
		listaIntervencao1 = new ArrayList<Intervencao>();
		
		CasoClinicoBean ccBean = new CasoClinicoBean();

		IntervencaoDAO daoI = ccBean.getIntervencaoDAO();
		
		listaIntervencao1 = daoI.getIntervencaoByCaso(alunoEscolhido.getRespostaAtual().getCasoclinico(), 1);
		
		return listaIntervencao1;
	}

	public void setListaIntervencao1(ArrayList<Intervencao> listaIntervencao) {
		this.listaIntervencao1 = listaIntervencao;
	}

	public ArrayList<IntervencaoResposta> getListaIntervencaoResposta1() {
		
		listaIntervencaoResposta1 = new ArrayList<IntervencaoResposta>();
		
		IntervencaoRespostaDAO daoIR = getIntervencaoDAO();
		
		listaIntervencaoResposta1 = daoIR.getIntervencaoRespostaByRespostaAluno(alunoEscolhido.getRespostaAtual(), 1);
		
		return listaIntervencaoResposta1;
	}

	public void setListaIntervencaoResposta1(
			ArrayList<IntervencaoResposta> listaIntervencaoResposta) {
		this.listaIntervencaoResposta1 = listaIntervencaoResposta;
	}*/

	public float getNota() {
		return nota;
	}

	public void setNota(float nota) {
		this.nota = nota;
	}

	public String getComentarios() {
		return comentarios;
	}

	public void setComentarios(String comentarios) {
		this.comentarios = comentarios;
	}

	public String getComentariosAluno() {
		return comentariosAluno;
	}

	public void setComentariosAluno(String comentariosAluno) {
		this.comentariosAluno = comentariosAluno;
	}
	
	/*public AvaliacaoDAO getAvaliacaoDAO(){
		
		AvaliacaoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (AvaliacaoDAO) ctx.lookup("pacienteVirtualEAR/AvaliacaoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}*/

	
	public String correto1(){
		
		//Avaliacao newAvaliacao = new Avaliacao();
		
		respostaPrimeira.setComentario(comentarios);
		respostaPrimeira.setComentarioAluno(comentariosAluno);
		respostaPrimeira.setNota(nota);
		respostaPrimeira.setFlCorreto("V");
		
		RespostaPrimeiraDAO daoR1 = getRespostaAlunoPrimeiraDAO();
		daoR1.addCorrecao(respostaPrimeira);
		
		String msg = new String();
		
		AlunoBean aluB = new AlunoBean();
		
		AlunoDAO daoA = aluB.getAlunoDAO();
		
		msg = "Olá,\n\nSua consulta foi avaliada como correta.\n\nConsulta: "+alunoEscolhido.getNrConsulta()+"\nTentativa: "+alunoEscolhido.getNrTentativa()+"\n\nNota: "+nota+"\n\nComentarios: "+comentariosAluno;
		
		PvMail mailPV = new PvMail();
		
		UsuarioDAO daoU = getUsuarioDAO();
		
		Usuario usuarioAuxiliar = daoU.getUsuario(alunoEscolhido.getLogin());

		try {
			mailPV.enviarEmail(usuarioAuxiliar.getEmail(), "Avaliação de Consulta", msg);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		daoA.setarOcupado(alunoEscolhido, 2, 1, 'S');
		
		return "Correto";
	}
	

	public String inCorreto1(){
		
		respostaPrimeira.setComentario(comentarios);
		respostaPrimeira.setComentarioAluno(comentariosAluno);
		respostaPrimeira.setNota(nota);
		respostaPrimeira.setFlCorreto("F");
		
		RespostaPrimeiraDAO daoR1 = getRespostaAlunoPrimeiraDAO();
		daoR1.addCorrecao(respostaPrimeira);
		
		String msg = new String();
		
		AlunoBean aluB = new AlunoBean();
		
		AlunoDAO daoA = aluB.getAlunoDAO();
		
		if (alunoEscolhido.getNrTentativa() < 3){
			daoA.setarOcupado(alunoEscolhido, 1, alunoEscolhido.getNrTentativa()+1 , 'S');
			
			msg = "Olá,\n\nSua consulta foi avaliada como incorreta e deve ser refeita.\n\nConsulta: "+alunoEscolhido.getNrConsulta()+"\nTentativa: "+alunoEscolhido.getNrTentativa()+"\n\nNota: "+nota+"\n\nComentarios: "+comentariosAluno;
		}else{
			daoA.setarOcupado(alunoEscolhido, 2, 1, 'S');
			msg = "Olá,\n\nSua consulta foi avaliada como incorreta e suas três tentativas acabaram.\n\nConsulta: "+alunoEscolhido.getNrConsulta()+"\nTentativa: "+alunoEscolhido.getNrTentativa()+"\n\nNota: "+nota+"\n\nComentarios: "+comentariosAluno;

		}
		
		PvMail mailPV = new PvMail();
		
		UsuarioDAO daoU = getUsuarioDAO();
		
		Usuario usuarioAuxiliar = daoU.getUsuario(alunoEscolhido.getLogin());

		try {
			mailPV.enviarEmail(usuarioAuxiliar.getEmail(), "Avaliação de Consulta", msg);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "Incorreto";
	}
	

	public RespostaPrimeira getRespostaPrimeira() {
		return respostaPrimeira;
	}

	public void setRespostaPrimeira(RespostaPrimeira respostaPrimeira) {
		this.respostaPrimeira = respostaPrimeira;
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

	public void setListaQueixa1(ArrayList<Queixa> listaQueixa1) {
		this.listaQueixa1 = listaQueixa1;
	}

	public ArrayList<Queixa> getListaQueixa1() {
		
		QueixaDAO daoQ = getQueixaDAO();
		
		listaQueixa1 = daoQ.getAll(respostaPrimeira.getConsulta().getFkCasoClinico(), 1);
		
		return listaQueixa1;
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
	

	public UsuarioDAO getUsuarioDAO() {

		UsuarioDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (UsuarioDAO) ctx
					.lookup("pacienteVirtualEAR/UsuarioDAOBean/remote");

		} catch (Exception e) {
			// TODO handle errors
		}

		return dao;
	}

	public String getFake(){
		
		AlunoBean alu = new AlunoBean();
		AlunoDAO daoA = alu.getAlunoDAO();
		
		alunoEscolhido = daoA.getAluno(alunoEscolhidoAux);
		consulta = alunoEscolhido.getNrConsulta();
		
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		
		session.setAttribute("avaliado", alunoEscolhido);
		
		RespostaPrimeiraDAO daoR1 = getRespostaAlunoPrimeiraDAO();
		respostaPrimeira = daoR1.getUltimaRespostaByConsulta(alunoEscolhido.getConsultaAtual().getId());
		
		return "";
	}	
}
