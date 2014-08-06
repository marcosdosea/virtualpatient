package br.ufs.dcomp.pv.web;

import java.util.Date;
import java.util.Hashtable;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.NoResultException;

import org.jboss.jms.wireformat.SessionAcknowledgeDeliveriesRequest;

import br.ufs.dcomp.pv.JPA.Usuario;
import br.ufs.dcomp.pv.JPA.UsuarioDAO;

public class RecuperandoSenhaBean {

	private String email;
	
	private Usuario usuario;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public class SMTPAuthenticator extends Authenticator {

		public PasswordAuthentication getPasswordAuthentication() {
			String username = "suportepv@gmail.com";
			String password = "rafaelwanderson";
			return new PasswordAuthentication(username, password);
		}

	}
	
	public String recuperar() throws NamingException{
		
		UsuarioDAO daoU = getUsuarioDAO();
		try {
		usuario = daoU.getUsuarioByEmail(email);
		
		PvMail mensageiro = new PvMail();
		
		
		//Session mailSession = (Session) icnt.lookup("java:/Mail");
		
		//MimeMessage msg = new MimeMessage(session);
		
		
			// "de" e "para"!!
			//msg.setFrom(new InternetAddress("suportepv@gmail.com"));
			//msg.setRecipient(Message.RecipientType.TO, new InternetAddress(
			//		usuario.getEmail()));

			//msg.setSentDate(new Date());

			//msg.setSubject("Recuperação de Senha");

			String mensagem = "Dados recuperados.\n\nUsuario: "+usuario.getLogin()+"\nSenha: "+usuario.getSenha();
			mensageiro.enviarEmail(usuario.getEmail(), "Recuperação de Senha", mensagem);
	
			//msg.setText(mensagem);			
			
			//Transport transport = mailSession.getTransport("smtp");
			//transport.connect("smtp.gmail.com", "suportepv@gmail.com", "rafaelwanderson");
			//transport.sendMessage(msg, msg.getAllRecipients());
			
			// evniando mensagem (tentando)
			//Transport.send(msg);
			
			return "senhaEnviada";
		} catch (AddressException e) {
			e.printStackTrace();
			return "erro";
		} catch (MessagingException e) {
			e.printStackTrace();
			return "erro";
		}catch(NoResultException e){
			return "Não existe conta registrada com esse email.";
		}
		
		
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
