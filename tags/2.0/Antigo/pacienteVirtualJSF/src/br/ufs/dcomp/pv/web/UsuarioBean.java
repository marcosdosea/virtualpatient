package br.ufs.dcomp.pv.web;

import java.util.Hashtable;

import javax.faces.context.FacesContext;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import br.ufs.dcomp.pv.JPA.Aluno;
import br.ufs.dcomp.pv.JPA.AlunoDAO;
import br.ufs.dcomp.pv.JPA.UsuarioDAO;
import br.ufs.dcomp.pv.JPA.Usuario;
import br.ufs.dcomp.pv.web.AlunoBean;


public class UsuarioBean {
	
	private String login;
	private String senha;
	private String email;
	private String nome;
	
	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	
	public String logar(){
		
		try{
		UsuarioDAO daoU = getUsuarioDAO();
		Usuario current = new Usuario();
		current = daoU.getUsuario(login);
		
		
		if (getSenha().equals(current.getSenha())){
			email = current.getEmail();
			
			FacesContext facesContext = FacesContext.getCurrentInstance();
			
			HttpServletRequest request = (HttpServletRequest) facesContext.getCurrentInstance().getExternalContext().getRequest();
			
			HttpSession session = request.getSession();
			session.setAttribute("Idioma", facesContext.getViewRoot().getLocale());
			session.setMaxInactiveInterval(7200);
			if (current.getTpUsuario().equals("Administrador")) {
				
				session.setAttribute("tipoU", "Administrador logado");
				session.setAttribute("AdministradorLogado", current);

				return "Administrador logado";
			} else {
				if (current.getTpUsuario().equals("Tutor")) {
					
					session.setAttribute("tipoU", "Tutor logado");
					session.setAttribute("TutorLogado", current);

					return "Tutor logado";
				} else {
					AlunoBean alunob = new AlunoBean();
					Aluno alunoAuxiliar = new Aluno();
					AlunoDAO daoA = alunob.getAlunoDAO();		
					
					alunoAuxiliar = daoA.getAluno(current.getLogin());
					
					nome = alunoAuxiliar.getNome();
					
					session.setAttribute("tipoU", "Aluno logado");
					session.setAttribute("AlunoLogado", alunoAuxiliar);
					return "Aluno logado";
				}
			}
		}else{
			return "inexistente";
		}
		}catch(NullPointerException e){
			return "inexistente";
		}
		
		/*setNome(current.getNome());
		setEmail(current.getEmail());
		setSenha(current.getSenha());
		setLogin(current.getLogin());
		return "inexistente";*/
	}
	
	public String sair(){
		
		FacesContext facesContext = FacesContext.getCurrentInstance();
		HttpServletRequest request = (HttpServletRequest) facesContext.getExternalContext().getRequest();
		HttpSession session = request.getSession();	
		session.invalidate();
		return "goHome";
	}
	
	public String retornarMenu()
	{
		FacesContext facesContext = FacesContext.getCurrentInstance();
		HttpServletRequest request = (HttpServletRequest) facesContext.getExternalContext().getRequest();
		HttpSession session = request.getSession();	
		String tipo = session.getAttribute("tipoU").toString();
		return tipo;
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


	
}
