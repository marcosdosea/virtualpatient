package br.ufs.dcomp.pv.JPA;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ConsultaDAOBean implements ConsultaDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;

	
	public int addConsulta(Consulta consulta){
		entityManager.persist(consulta);
		return consulta.getId();
	}
}
