package br.ufs.dcomp.pv.JPA;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.hibernate.exception.ConstraintViolationException;

@Stateless
public class UsuarioDAOBean implements UsuarioDAO {

	@PersistenceContext(unitName = "pacienteVirtualJPA")
	private EntityManager entityManager;
	
	public void addUsuario(Usuario usuario) {
		entityManager.persist(usuario);
	}

	public Usuario getUsuario(String login) {
		return entityManager.find(Usuario.class, login);
	}

	public Usuario getUsuarioByEmail(String email) throws ConstraintViolationException{
		return (Usuario) entityManager.createQuery("from Usuario e where email = ?1").setParameter(1, email).getSingleResult();
	}

	@Override
	public String getUsuarioTesteCadastroByEmail(String email) {
		String result = "";		
		try
		{
			Usuario usu = (Usuario) entityManager.createQuery("from Usuario e where email = ?1").setParameter(1, email).getSingleResult();
			result = usu.getEmail();
		}
		catch(NoResultException e)
		{
			result = "";
		}		
		return result;
	}

	@Override
	public String getUsuarioTesteCadastroByLogin(String login) {
		String result = "";
		
		try
		{
			Usuario usu = (Usuario) entityManager.createQuery("from Usuario e where login = ?1").setParameter(1, login).getSingleResult();
			result = usu.getLogin();
		}
		catch(NoResultException e)
		{
			result = "";
		}
		
		return result;	
	}
	
}
