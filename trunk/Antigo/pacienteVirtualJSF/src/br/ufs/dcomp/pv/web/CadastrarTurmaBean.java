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
import br.ufs.dcomp.pv.JPA.Turma;
import br.ufs.dcomp.pv.JPA.TurmaDAO;
import br.ufs.dcomp.pv.JPA.Tutor;
import br.ufs.dcomp.pv.JPA.TutorDAO;
import br.ufs.dcomp.pv.JPA.Usuario;

public class CadastrarTurmaBean {

	private String codigo;
	private Tutor tutor;
	private String periodo;
	private String nmDisciplina;
	
	private ArrayList<Aluno> listaAlunos;
	private ArrayList<AlunoAux> listaAux;
	private ArrayList<Turma> listaTurma;
	
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public Tutor getTutor() {
		return tutor;
	}
	public void setTutor(Tutor tutor) {
		this.tutor = tutor;
	}
	
	public CadastrarTurmaBean(){
		HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();

		Usuario auxiliar = (Usuario) session.getAttribute("TutorLogado");
		TutorBean tutBean = new TutorBean();
		TutorDAO daoT = tutBean.getTutorDAO();
		
		tutor = daoT.getTutor(auxiliar.getLogin());
		
		listaAlunos = new ArrayList<Aluno>();
		
		AlunoBean alu = new AlunoBean();
		AlunoDAO daoA = alu.getAlunoDAO();
		listaAlunos = daoA.getAllSemTurma();
				
	}
	
	public String getPeriodo() {
		return periodo;
	}
	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}

	public String adicionarTurma(){
		
		Turma turma = new Turma();
		TurmaDAO daoT = getTurmaDAO();
		
		turma.setTutor(tutor);
		turma.setCodigo(codigo);
		turma.setPeriodo(periodo);
		turma.setNmDisciplina(nmDisciplina);
		
		daoT.addTurma(turma);
		
		return "Turma Cadastrada com Sucesso";
	}
	
	public TurmaDAO getTurmaDAO(){
		
		TurmaDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (TurmaDAO) ctx.lookup("pacienteVirtualEAR/TurmaDAOBean/remote");
			
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
	public void setListaAlunos(ArrayList<Aluno> listaAlunos) {
		this.listaAlunos = listaAlunos;
	}
	public ArrayList<Aluno> getListaAlunos() {
		return listaAlunos;
	}
	public void setListaAux(ArrayList<AlunoAux> listaAux) {
		this.listaAux = listaAux;
	}
	public ArrayList<AlunoAux> getListaAux() {
		
		listaAux = new ArrayList<AlunoAux>();
		
		AlunoBean alu = new AlunoBean();
		AlunoDAO daoA = alu.getAlunoDAO();
		listaAlunos = daoA.getAllSemTurma();

		for (Iterator<Aluno> i = listaAlunos.iterator(); i.hasNext();) {
			Aluno aux = i.next();
			AlunoAux aluAux = new AlunoAux();

			aluAux.setLogin(aux.getLogin());
			aluAux.setMatricula(aux.getMatricula());
			aluAux.setNome(aux.getNome());
			aluAux.setTurma(0);

			listaAux.add(aluAux);
		}
		
		return listaAux;
	}
	public ArrayList<Turma> getListaTurma() {
		
		TurmaDAO daoTurma = getTurmaDAO();		
		listaTurma = new ArrayList<Turma>();
		listaTurma = daoTurma.getAllTurmas();
		
		return listaTurma;
	}
	public void setListaTurma(ArrayList<Turma> listaTurma) {
		this.listaTurma = listaTurma;
	}

	public ArrayList<SelectItem> getListaTurmaStr(){
		
		TurmaDAO daoTurma = getTurmaDAO();		
		listaTurma = new ArrayList<Turma>();
		listaTurma = daoTurma.getAllTurmas();
		
		ArrayList<SelectItem> retorno = new ArrayList<SelectItem>(); 
		
		SelectItem first = new SelectItem(0, "--");
		retorno.add(first);
		
		
		for(Iterator<Turma> i = listaTurma.iterator(); i.hasNext();){
			Turma elementoAux = i.next();
			SelectItem a = new SelectItem(elementoAux.getId(), elementoAux.getNmDisciplina()+" - "+elementoAux.getPeriodo()+" - "+ elementoAux.getCodigo());
			//Aux novo = new Aux(elementoAux.getNome(), elementoAux.getId());
			retorno.add(a);
			//System.out.println(novo.imprime());
		}
		
		
		return retorno; 		
	}

	
	public String alocarAlunos(){
		
		TurmaDAO daoTurma = getTurmaDAO();
		System.out.println("tamanho: "+listaAux.size());
		
		for(Iterator<AlunoAux> i = listaAux.iterator(); i.hasNext();){
			AlunoAux temp = i.next();
			
			Aluno alunoAuxiliar = new Aluno();
			
			alunoAuxiliar.setLogin(temp.getLogin());
			alunoAuxiliar.setMatricula(temp.getMatricula());
			if(temp.getTurma() != 0){
				alunoAuxiliar.setTurma(daoTurma.getTurma(temp.getTurma()));
			}
			AlunoBean alu = new AlunoBean();
			AlunoDAO daoA = alu.getAlunoDAO();
			
			daoA.alocarEmTurma(alunoAuxiliar);
		}
		
		return "alocação com sucesso";
	}
	public void setNmDisciplina(String nmDisciplina) {
		this.nmDisciplina = nmDisciplina;
	}
	public String getNmDisciplina() {
		return nmDisciplina;
	}
	
}
