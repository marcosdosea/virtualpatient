package br.ufs.dcomp.pv.web;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class PvMail {

	private Properties p;

	private MimeMessage msg;
	
	private String tagPV;
	
	Authenticator auth;

	public PvMail() {
				
		p = new Properties();  
		p.put("mail.transport.protocol", "smtp");
		p.put("mail.smtp.host", "200.17.141.1");
		p.put("mail.smtp.auth", "false");
		p.put("mail.debug", "false");  		
		
		auth = new SMTPAuthenticator();
		
		setTagPV("[PharmaVP]");
		
	}
	
	public class SMTPAuthenticator extends Authenticator {

		public PasswordAuthentication getPasswordAuthentication() {
			String username = "suportepv@gmail.com";
			String password = "rafaelwanderson";
			return new PasswordAuthentication(username, password);
		}

	}
	
	public boolean enviarEmail(String destino, String assunto, String mensagem) throws MessagingException{
		
		Session session = Session.getInstance(p);  
		msg = new MimeMessage(session);
		
		msg.setFrom(new InternetAddress("suportepv@gmail.com"));
		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(destino));

		msg.setSentDate(new Date());

		msg.setSubject(tagPV+" "+assunto);
			
		msg.setText(mensagem);
		
		Transport.send(msg);
		
		return true;
	}

	public Properties getP() {
		return p;
	}

	public void setP(Properties p) {
		this.p = p;
	}

	public MimeMessage getMsg() {
		return msg;
	}

	public void setMsg(MimeMessage msg) {
		this.msg = msg;
	}

	public void setTagPV(String tagPV) {
		this.tagPV = tagPV;
	}

	public String getTagPV() {
		return tagPV;
	}

	public Authenticator getAuth() {
		return auth;
	}

	public void setAuth(Authenticator auth) {
		this.auth = auth;
	}
	
	
}
