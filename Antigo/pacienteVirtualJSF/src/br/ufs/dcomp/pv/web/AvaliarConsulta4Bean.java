package br.ufs.dcomp.pv.web;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;

import javax.faces.context.FacesContext;
import javax.mail.MessagingException;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import br.ufs.dcomp.pv.JPA.Aluno;
import br.ufs.dcomp.pv.JPA.AlunoDAO;
import br.ufs.dcomp.pv.JPA.CasoClinico;
import br.ufs.dcomp.pv.JPA.Intervencao;
import br.ufs.dcomp.pv.JPA.IntervencaoDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixa;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaDAO;
import br.ufs.dcomp.pv.JPA.Queixa;
import br.ufs.dcomp.pv.JPA.QueixaDAO;
import br.ufs.dcomp.pv.JPA.RespostaQuarta;
import br.ufs.dcomp.pv.JPA.RespostaQuartaDAO;
import br.ufs.dcomp.pv.JPA.Tutor;
import br.ufs.dcomp.pv.JPA.TutorDAO;
import br.ufs.dcomp.pv.JPA.Usuario;
import br.ufs.dcomp.pv.JPA.UsuarioDAO;

public class AvaliarConsulta4Bean {

	private Tutor tutorLogado;
	
	private Aluno alunoAvaliado;
	
	private RespostaQuarta respostaQuarta;
	
	private ArrayList<QueixaBean> listaAluno;
	
	private ArrayList<QueixaBean> listaGabarito;
	
	private ArrayList<Intervencao> listaIntervencao;
	
	private float nota;
	private String comentarios;
	private String comentariosAluno;
	
	public AvaliarConsulta4Bean(){
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		
		Usuario auxiliar = (Usuario) session.getAttribute("TutorLogado");
		TutorBean tutBean = new TutorBean();
		TutorDAO daoT = tutBean.getTutorDAO();
		
		tutorLogado = daoT.getTutor(auxiliar.getLogin());
		
		alunoAvaliado = (Aluno) session.getAttribute("avaliado");
		
		RespostaQuartaDAO daoR4 = getRespostaQuartaDAO();
			
		respostaQuarta = daoR4.getSemCorrecaoByConsulta(alunoAvaliado.getConsultaAtual());

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

	public Tutor getTutorLogado() {
		return tutorLogado;
	}

	public void setTutorLogado(Tutor tutorLogado) {
		this.tutorLogado = tutorLogado;
	}

	public Aluno getAlunoAvaliado() {
		return alunoAvaliado;
	}

	public void setAlunoAvaliado(Aluno alunoAvaliado) {
		this.alunoAvaliado = alunoAvaliado;
	}

	public RespostaQuarta getRespostaQuarta() {
		return respostaQuarta;
	}

	public void setRespostaQuarta(RespostaQuarta respostaQuarta) {
		this.respostaQuarta = respostaQuarta;
	}

	public void setListaAluno(ArrayList<QueixaBean> listaAluno) {
		this.listaAluno = listaAluno;
	}

	public ArrayList<QueixaBean> getListaGabarito() {
		
		QueixaDAO daoQ = getQueixaDAO();
		
		ArrayList<Queixa> listaTemp = new ArrayList<Queixa>();
		
		listaTemp = daoQ.getAllOrder(alunoAvaliado.getConsultaAtual().getFkCasoClinico(), 2);
				
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
				
				queixaBean.getListaMedicamentos().add(medBean);
			}
			
			listaGabarito.add(queixaBean);
			
		}
		
		return listaGabarito;
	}

	public void setListaGabarito(ArrayList<QueixaBean> listaGabarito) {
		this.listaGabarito = listaGabarito;
	}

	public ArrayList<Intervencao> getListaIntervencao() {
		
		IntervencaoDAO daoI = getIntervencaoDAO();
		
		CasoClinico teste = respostaQuarta.getConsulta().getFkCasoClinico();
		
		listaIntervencao = daoI.getIntervencesByCasoClinico(respostaQuarta.getConsulta().getFkCasoClinico(), 2);
		
		return listaIntervencao;
	}

	public void setListaIntervencao(ArrayList<Intervencao> listaIntervencao) {
		this.listaIntervencao = listaIntervencao;
	}

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

	public String correto1(){
		
		//Avaliacao newAvaliacao = new Avaliacao();
		
		respostaQuarta.setComentario(comentarios);
		respostaQuarta.setComentarioAluno(comentariosAluno);
		respostaQuarta.setNota(nota);
		respostaQuarta.setFlCorreto("V");
		
		RespostaQuartaDAO daoR4 = getRespostaQuartaDAO();
		daoR4.addCorrecao(respostaQuarta);
		
		String msg = new String();
		
		AlunoBean aluB = new AlunoBean();
		
		AlunoDAO daoA = aluB.getAlunoDAO();
		
		msg = "Olá,\n\nSua consulta foi avaliada como correta.\n\nConsulta: "+alunoAvaliado.getNrConsulta()+"\nTentativa: "+alunoAvaliado.getNrTentativa()+"\n\nNota: "+nota+"\n\nComentarios: "+comentariosAluno;
		
		PvMail mailPV = new PvMail();
		
		UsuarioDAO daoU = getUsuarioDAO();
		
		Usuario usuarioAuxiliar = daoU.getUsuario(alunoAvaliado.getLogin());

		try {
			mailPV.enviarEmail(usuarioAuxiliar.getEmail(), "Avaliação de Consulta", msg);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		daoA.setarOcupado(alunoAvaliado, 5, 1, 'S');
		
		return "Correto";
	}
	

	public String inCorreto1(){
		
		respostaQuarta.setComentario(comentarios);
		respostaQuarta.setComentarioAluno(comentariosAluno);
		respostaQuarta.setNota(nota);
		respostaQuarta.setFlCorreto("F");
		
		RespostaQuartaDAO daoR4 = getRespostaQuartaDAO();
		daoR4.addCorrecao(respostaQuarta);
		
		String msg = new String();
		
		AlunoBean aluB = new AlunoBean();
		
		AlunoDAO daoA = aluB.getAlunoDAO();
		
		if (alunoAvaliado.getNrTentativa() < 3){
			daoA.setarOcupado(alunoAvaliado, 4, alunoAvaliado.getNrTentativa()+1 , 'S');
			
			msg = "Olá,\n\nSua consulta foi avaliada como incorreta e deve ser refeita.\n\nConsulta: "+alunoAvaliado.getNrConsulta()+"\nTentativa: "+alunoAvaliado.getNrTentativa()+"\n\nNota: "+nota+"\n\nComentarios: "+comentariosAluno;
		}else{
			daoA.setarOcupado(alunoAvaliado, 5, 1, 'S');
			msg = "Olá,\n\nSua consulta foi avaliada como incorreta e suas três tentativas acabaram.\n\nConsulta: "+alunoAvaliado.getNrConsulta()+"\nTentativa: "+alunoAvaliado.getNrTentativa()+"\n\nNota: "+nota+"\n\nComentarios: "+comentariosAluno;

		}
		
		PvMail mailPV = new PvMail();
		
		UsuarioDAO daoU = getUsuarioDAO();
		
		Usuario usuarioAuxiliar = daoU.getUsuario(alunoAvaliado.getLogin());

		try {
			mailPV.enviarEmail(usuarioAuxiliar.getEmail(), "Avaliação de Consulta", msg);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "Incorreto";
	}
	
	public String getFake(){
		
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		
		alunoAvaliado = (Aluno) session.getAttribute("avaliado");
		
		RespostaQuartaDAO daoR4 = getRespostaQuartaDAO();
		
		respostaQuarta = daoR4.getSemCorrecaoByConsulta(alunoAvaliado.getConsultaAtual());
		
		return "";
	}
	
	public MedicamentoQueixaDAO getMedicamentoQueixaDAO() {

		MedicamentoQueixaDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (MedicamentoQueixaDAO) ctx
					.lookup("pacienteVirtualEAR/MedicamentoQueixaDAOBean/remote");

		} catch (Exception e) {
			// TODO handle errors
		}

		return dao;
	}
	
}
