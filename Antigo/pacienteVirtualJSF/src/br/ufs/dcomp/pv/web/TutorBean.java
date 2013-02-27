package br.ufs.dcomp.pv.web;

import java.util.Collection;
import java.util.Hashtable;

import javax.naming.InitialContext;
import javax.swing.JOptionPane;


import br.ufs.dcomp.pv.JPA.Tutor;
import br.ufs.dcomp.pv.JPA.TutorDAO;
import br.ufs.dcomp.pv.JPA.Usuario;
import br.ufs.dcomp.pv.JPA.UsuarioDAO;

public class TutorBean {

	private String login;
	private String email;
	private String senha;
	private String nome;
	private String senhaTeste;
		
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}

	public String add(){
		
		if (getSenha().equals(getSenhaTeste())) {
			TutorDAO dao = getTutorDAO();
			Tutor newTutor = new Tutor();
			UsuarioDAO daoU = getUsuarioDAO();
			Usuario newUsuario = new Usuario();
			newUsuario.setLogin(login);
			newUsuario.setSenha(senha);
			newTutor.setNome(nome);
			newUsuario.setEmail(email);
			newUsuario.setTpUsuario("Tutor");
			newTutor.setLogin(login);
			newTutor.setTbusuario(newUsuario);

			daoU.addUsuario(newUsuario);
			dao.addTutor(newTutor);

			return "success";
		}else{
			JOptionPane.showMessageDialog(null, "A senha não confere!");
			return "falhou";
		}
	}
	
	public Collection<Tutor> getAll(){
		return getTutorDAO().getAllTutors();
	}
	
	public TutorDAO getTutorDAO(){
		
		TutorDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (TutorDAO) ctx.lookup("pacienteVirtualEAR/TutorDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	private UsuarioDAO getUsuarioDAO(){
		
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
	public String getSenhaTeste() {
		return senhaTeste;
	}
	public void setSenhaTeste(String senhaTeste) {
		this.senhaTeste = senhaTeste;
	}
}
