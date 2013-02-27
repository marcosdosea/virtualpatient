package br.ufs.dcomp.pv.JPA;

import javax.ejb.Remote;

@Remote
public interface UsuarioDAO {
	public void addUsuario(Usuario usuario);
	public Usuario getUsuario(String login);
	public Usuario getUsuarioByEmail(String email);
	public String getUsuarioTesteCadastroByEmail(String email);
	public String getUsuarioTesteCadastroByLogin(String login);
}
