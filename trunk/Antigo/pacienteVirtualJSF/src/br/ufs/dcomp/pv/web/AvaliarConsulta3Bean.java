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
import br.ufs.dcomp.pv.JPA.DiarioMedicamentos;
import br.ufs.dcomp.pv.JPA.DiarioMedicamentosCaso;
import br.ufs.dcomp.pv.JPA.DiarioMedicamentosCasoDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixa;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaSegunda;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaSegundaDAO;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaTerceira;
import br.ufs.dcomp.pv.JPA.MedicamentoQueixaTerceiraDAO;
import br.ufs.dcomp.pv.JPA.Queixa;
import br.ufs.dcomp.pv.JPA.QueixaDAO;
import br.ufs.dcomp.pv.JPA.QueixaRespostaSegunda;
import br.ufs.dcomp.pv.JPA.QueixaRespostaSegundaDAO;
import br.ufs.dcomp.pv.JPA.QueixaRespostaTerceira;
import br.ufs.dcomp.pv.JPA.QueixaRespostaTerceiraDAO;
import br.ufs.dcomp.pv.JPA.RespostaSegundaDAO;
import br.ufs.dcomp.pv.JPA.RespostaTerceira;
import br.ufs.dcomp.pv.JPA.RespostaTerceiraDAO;
import br.ufs.dcomp.pv.JPA.Tutor;
import br.ufs.dcomp.pv.JPA.TutorDAO;
import br.ufs.dcomp.pv.JPA.Usuario;
import br.ufs.dcomp.pv.JPA.UsuarioDAO;

public class AvaliarConsulta3Bean {

	private Tutor tutorLogado;
	
	private Aluno alunoAvaliado;
	
	private RespostaTerceira respostaTerceira;
	
	private float imcCorreto;
	
	private ArrayList<Queixa> listaQueixaResposta;
	
	private ArrayList<QueixaRespostaTerceira> listaQueixaAluno;
	
	private ArrayList<QueixaBean> listaGabarito;
	
	private ArrayList<QueixaBean> listaAluno;
		
	private float nota;
	private String comentarios;
	private String comentariosAluno;
	
	public AvaliarConsulta3Bean(){
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		
		Usuario auxiliar = (Usuario) session.getAttribute("TutorLogado");
		TutorBean tutBean = new TutorBean();
		TutorDAO daoT = tutBean.getTutorDAO();
		
		tutorLogado = daoT.getTutor(auxiliar.getLogin());
		
		alunoAvaliado = (Aluno) session.getAttribute("avaliado");
		
		RespostaTerceiraDAO daoR3 = getRespostaAlunoTerceiraDAO();
		
		respostaTerceira = daoR3.getSemCorrecaoByConsulta(alunoAvaliado.getConsultaAtual());

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

	public RespostaTerceira getRespostaTerceira() {
		return respostaTerceira;
	}

	public void setRespostaTerceira(RespostaTerceira respostaTerceira) {
		this.respostaTerceira = respostaTerceira;
	}
	
	public void setImcCorreto(float imcCorreto) {
		this.imcCorreto = imcCorreto;
	}

	public float getImcCorreto() {
				
		imcCorreto = (float) (respostaTerceira.getPeso() / Math.pow(respostaTerceira.getConsulta().getFkCasoClinico().getAltura(), 2)) ;
		
		return imcCorreto;
	}
	
	public ArrayList<Queixa> getListaQueixaResposta() {
		
		QueixaDAO daoQ = getQueixaDAO();
		
		listaQueixaResposta = daoQ.getAll(respostaTerceira.getConsulta().getFkCasoClinico(), 2);
		
		return listaQueixaResposta;
	}

	public void setListaQueixaResposta(ArrayList<Queixa> listaQueixaResposta) {
		this.listaQueixaResposta = listaQueixaResposta;
	}

	public ArrayList<QueixaRespostaTerceira> getListaQueixaAluno() {
		
		QueixaRespostaTerceiraDAO daoQR3 = getQueixaRespostaTerceiraDAO();
		
		listaQueixaAluno = daoQR3.getAll(respostaTerceira);
		
		return listaQueixaAluno;
	}
	
	private MedicamentoQueixaTerceiraDAO getMedicamentoQueixa3DAO(){
		
		MedicamentoQueixaTerceiraDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (MedicamentoQueixaTerceiraDAO) ctx.lookup("pacienteVirtualEAR/MedicamentoQueixaTerceiraDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	public ArrayList<QueixaBean> getListaAluno() {
		
		QueixaRespostaTerceiraDAO daoQR3 = getQueixaRespostaTerceiraDAO();
		
		MedicamentoQueixaTerceiraDAO daoMQR3 = getMedicamentoQueixa3DAO();

		ArrayList<QueixaRespostaTerceira> listaTemp = new ArrayList<QueixaRespostaTerceira>();
		listaTemp = daoQR3.getAll(respostaTerceira);
		
		listaAluno = new ArrayList<QueixaBean>();
		
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
			
			listaAluno.add(queixaBean);
			
		}
		
		return listaAluno;
	}

	public void setListaAluno(ArrayList<QueixaBean> listaAluno) {
		this.listaAluno = listaAluno;
	}
	
	
	public void setListaGabarito(ArrayList<QueixaBean> listaGabarito) {
		this.listaGabarito = listaGabarito;
	}
		
	public ArrayList<QueixaBean> getListaGabarito() {
		
		QueixaDAO daoQ = getQueixaDAO();
		
		ArrayList<Queixa> listaTemp = new ArrayList<Queixa>();
		
		listaTemp = daoQ.getAll(alunoAvaliado.getConsultaAtual().getFkCasoClinico(), 2);
				
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
				medBean.setSituacao(medTemp.getSituacao());
				medBean.setAlternativa1(medTemp.getAlternativa1());
				medBean.setAlternativa2(medTemp.getAlternativa2());
				
				queixaBean.getListaMedicamentos().add(medBean);
			}
			
			listaGabarito.add(queixaBean);
			
		}
		
		return listaGabarito;
	}


	public void setListaQueixaAluno(
			ArrayList<QueixaRespostaTerceira> listaQueixaAluno) {
		this.listaQueixaAluno = listaQueixaAluno;
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
		
		respostaTerceira.setComentario(comentarios);
		respostaTerceira.setComentarioAluno(comentariosAluno);
		respostaTerceira.setNota(nota);
		respostaTerceira.setFlCorreto("V");
		
		RespostaTerceiraDAO daoR3 = getRespostaAlunoTerceiraDAO();
		
		daoR3.addCorrecao(respostaTerceira);
		
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
				
		daoA.setarOcupado(alunoAvaliado, 4, 1, 'S');
		
		return "Correto";
	}
	

	public String inCorreto1(){
		
		respostaTerceira.setComentario(comentarios);
		respostaTerceira.setComentarioAluno(comentariosAluno);
		respostaTerceira.setNota(nota);
		respostaTerceira.setFlCorreto("F");
		
		RespostaTerceiraDAO daoR3 = getRespostaAlunoTerceiraDAO();
		
		daoR3.addCorrecao(respostaTerceira);
		
		String msg = new String();
		
		AlunoBean aluB = new AlunoBean();
		
		AlunoDAO daoA = aluB.getAlunoDAO();
		
		if (alunoAvaliado.getNrTentativa() < 3){
			daoA.setarOcupado(alunoAvaliado, 3, alunoAvaliado.getNrTentativa()+1 , 'S');
			
			msg = "Olá,\n\nSua consulta foi avaliada como incorreta e deve ser refeita.\n\nConsulta: "+alunoAvaliado.getNrConsulta()+"\nTentativa: "+alunoAvaliado.getNrTentativa()+"\n\nNota: "+nota+"\n\nComentarios: "+comentariosAluno;
		}else{
			daoA.setarOcupado(alunoAvaliado, 4, 1, 'S');
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
		
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		
		alunoAvaliado = (Aluno) session.getAttribute("avaliado");
		
		RespostaTerceiraDAO daoR3 = getRespostaAlunoTerceiraDAO();
		
		respostaTerceira = daoR3.getSemCorrecaoByConsulta(alunoAvaliado.getConsultaAtual());
		
		return "";
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

	public ArrayList<DiarioMedicamentos> getListaDiarioMed() {
		RespostaTerceiraDAO daoR3 = getRespostaAlunoTerceiraDAO();
		return daoR3.getDiarioMedicamentos(respostaTerceira.getId());		 
	}
	
	public ArrayList<DiarioMedicamentosCaso> getListaDiarioMedGabarito() {		
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
