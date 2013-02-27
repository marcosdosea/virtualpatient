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
import br.ufs.dcomp.pv.JPA.Intervencao;
import br.ufs.dcomp.pv.JPA.IntervencaoDAO;
import br.ufs.dcomp.pv.JPA.IntervencaoRespostaSegunda;
import br.ufs.dcomp.pv.JPA.IntervencaoRespostaSegundaDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixa;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaSegunda;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaSegundaDAO;
import br.ufs.dcomp.pv.JPA.Queixa;
import br.ufs.dcomp.pv.JPA.QueixaDAO;
import br.ufs.dcomp.pv.JPA.QueixaRespostaSegunda;
import br.ufs.dcomp.pv.JPA.QueixaRespostaSegundaDAO;
import br.ufs.dcomp.pv.JPA.RespostaSegunda;
import br.ufs.dcomp.pv.JPA.RespostaSegundaDAO;
import br.ufs.dcomp.pv.JPA.Tutor;
import br.ufs.dcomp.pv.JPA.TutorDAO;
import br.ufs.dcomp.pv.JPA.Usuario;
import br.ufs.dcomp.pv.JPA.UsuarioDAO;

public class AvaliarConsulta2Bean {

	private Tutor tutorLogado;
	
	private Aluno alunoAvaliado;
	
	private ArrayList<QueixaBean> listaGabarito;
	
	private ArrayList<QueixaBean> listaAluno;
	
	private RespostaSegunda respostaSegunda;	
	
	private ArrayList<Intervencao> listaIntervencaoGabarito;
	private ArrayList<IntervencaoRespostaSegunda> listaIntervencaoAluno;
	
	private String comentarios;
	private String comentariosAluno;
	private float nota;
	
	
	public AvaliarConsulta2Bean() {
		
/*		PRMsItens = new LinkedHashMap<String, Object>();
		PRMsItens.put("1 - Terapia medicamentosa desnecessária", 1);
		PRMsItens.put("2 - Necessidade de terapia medicamentosa adicional", 2);
		PRMsItens.put("3 - Fármaco inefetivo", 3);
		PRMsItens.put("4 - Dose menor do que a necessária", 4);
		PRMsItens.put("5 - Reação Adversa a Medicamento", 5);
		PRMsItens.put("6 - Dose elevada", 6);
		PRMsItens.put("7 - Não adesão", 7);
		
		PRMs = (ArrayList<String>) PRMsItens.keySet();
*/		
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		
		Usuario auxiliar = (Usuario) session.getAttribute("TutorLogado");
		TutorBean tutBean = new TutorBean();
		TutorDAO daoT = tutBean.getTutorDAO();
		
		tutorLogado = daoT.getTutor(auxiliar.getLogin());
		
		alunoAvaliado = (Aluno) session.getAttribute("avaliado");
		
		RespostaSegundaDAO daoR2 = getRespostaAlunoSegundaDAO();
		
		respostaSegunda = daoR2.getSemCorrecaoByConsulta(alunoAvaliado.getConsultaAtual());
		
	}

	public Tutor getTutorLogado() {
		return tutorLogado;
	}

	public void setTutorLogado(Tutor tutorLogado) {
		this.tutorLogado = tutorLogado;
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
			queixaBean.setTipo(queixaTemp.getTipo().trim());
			
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

	public void setAlunoAvaliado(Aluno alunoAvaliado) {
		this.alunoAvaliado = alunoAvaliado;
	}

	public Aluno getAlunoAvaliado() {
		return alunoAvaliado;
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

	public void setRespostaSegunda(RespostaSegunda respostaSegunda) {
		this.respostaSegunda = respostaSegunda;
	}

	public RespostaSegunda getRespostaSegunda() {
		return respostaSegunda;
	}

	public void setListaGabarito(ArrayList<QueixaBean> listaGabarito) {
		this.listaGabarito = listaGabarito;
	}

	public ArrayList<QueixaBean> getListaGabarito() {
		
		QueixaDAO daoQ = getQueixaDAO();
		
		ArrayList<Queixa> listaTemp = new ArrayList<Queixa>();
		
		listaTemp = daoQ.getAll(alunoAvaliado.getConsultaAtual().getFkCasoClinico(), 1);
				
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
			if(queixaTemp.getTipo() != null)
			{
				queixaBean.setTipo(queixaTemp.getTipo().trim());
			}
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

	public ArrayList<Intervencao> getListaIntervencaoGabarito() {
					
		IntervencaoDAO daoI = getIntervencaoDAO();
				
		listaIntervencaoGabarito = daoI.getIntervencesByCasoClinico(alunoAvaliado.getConsultaAtual().getFkCasoClinico(), 1);
		
		return listaIntervencaoGabarito;
	}

	public void setListaIntervencaoGabarito(
			ArrayList<Intervencao> listaIntervencaoGabarito) {
		this.listaIntervencaoGabarito = listaIntervencaoGabarito;
	}

	public ArrayList<IntervencaoRespostaSegunda> getListaIntervencaoAluno() {
		
		IntervencaoRespostaSegundaDAO daoIR2 = getIntervencaoRespostaSegundaDAO();
		
		listaIntervencaoAluno = daoIR2.getIntervencoesRSByRespostaSegunda(respostaSegunda);
		
		return listaIntervencaoAluno;
	}

	public void setListaIntervencaoAluno(
			ArrayList<IntervencaoRespostaSegunda> listaIntervencaoAluno) {
		this.listaIntervencaoAluno = listaIntervencaoAluno;
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

	public float getNota() {
		return nota;
	}

	public void setNota(float nota) {
		this.nota = nota;
	}
	
	public String correto1(){
		
		//Avaliacao newAvaliacao = new Avaliacao();
		
		respostaSegunda.setComentario(comentarios);
		respostaSegunda.setComentarioAluno(comentariosAluno);
		respostaSegunda.setNota(nota);
		respostaSegunda.setFlCorreto("V");
		
		RespostaSegundaDAO daoR2 = getRespostaAlunoSegundaDAO();
		daoR2.addCorrecao(respostaSegunda);
		
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
				
		daoA.setarOcupado(alunoAvaliado, 3, 1, 'S');
		
		return "Correto";
	}
	

	public String inCorreto1(){
		
		respostaSegunda.setComentario(comentarios);
		respostaSegunda.setComentarioAluno(comentariosAluno);
		respostaSegunda.setNota(nota);
		respostaSegunda.setFlCorreto("F");
		
		RespostaSegundaDAO daoR2 = getRespostaAlunoSegundaDAO();
		daoR2.addCorrecao(respostaSegunda);
		
		String msg = new String();
		
		AlunoBean aluB = new AlunoBean();
		
		AlunoDAO daoA = aluB.getAlunoDAO();
		
		if (alunoAvaliado.getNrTentativa() < 3){
			daoA.setarOcupado(alunoAvaliado, 2, alunoAvaliado.getNrTentativa()+1 , 'S');
			
			msg = "Olá,\n\nSua consulta foi avaliada como incorreta e deve ser refeita.\n\nConsulta: "+alunoAvaliado.getNrConsulta()+"\nTentativa: "+alunoAvaliado.getNrTentativa()+"\n\nNota: "+nota+"\n\nComentarios: "+comentariosAluno;
		}else{
			daoA.setarOcupado(alunoAvaliado, 3, 1, 'S');
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
	
	public String getFake(){
		
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		
		alunoAvaliado = (Aluno) session.getAttribute("avaliado");
		
		RespostaSegundaDAO daoR2 = getRespostaAlunoSegundaDAO();
		
		respostaSegunda = daoR2.getSemCorrecaoByConsulta(alunoAvaliado.getConsultaAtual());
		
		return "";
	}
	
}
