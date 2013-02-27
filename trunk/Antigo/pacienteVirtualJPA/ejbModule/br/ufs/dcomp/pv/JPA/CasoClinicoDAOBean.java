package br.ufs.dcomp.pv.JPA;

import java.util.ArrayList;
import java.util.Collection;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class CasoClinicoDAOBean implements CasoClinicoDAO {

	@PersistenceContext(unitName="pacienteVirtualJPA")
	private EntityManager entityManager;
	
	public int addCasoClinico(CasoClinico caso) {
		entityManager.persist(caso);
		
		System.out.println(caso.getId());
		
		/*Collection<Tb_casoclinico> colecao = (Collection<Tb_casoclinico>) entityManager.createQuery("from Tb_casoclinico t").getResultList();
		
		int retorno = 0;

		retorno = colecao.size();
		*/
		return caso.getId();
	}
	
	public ArrayList<CasoClinico> getAll(){
		Query abc = entityManager.createQuery("from CasoClinico e");
		return (ArrayList<CasoClinico>) abc.getResultList();
	}
	
	public CasoClinico getCasoClinico(int id){
		return entityManager.find(CasoClinico.class, id);
	}
	
	public ArrayList<ParametroClinico> getAllParametrosClinicos(int i){
		Query abc = entityManager.createQuery("from ParametroClinico e where fkcasoclinico = ?1").setParameter(1, i);
		return (ArrayList<ParametroClinico>) abc.getResultList();
	}
	
	public ArrayList<MedicamentoNaoPrescrito> getAllMedicamentosNaoPrescritos(int i){
		Query abc = entityManager.createQuery("from MedicamentoNaoPrescrito e where fkcasoclinico = ?1").setParameter(1, i);
		return (ArrayList<MedicamentoNaoPrescrito>) abc.getResultList();
	}

	public ArrayList<MedicamentoPrescrito> getAllMedicamentosPrescritos(int i){
		Query abc = entityManager.createQuery("from MedicamentoPrescrito e where fkCasoClinico = ?1").setParameter(1, i);
		return (ArrayList<MedicamentoPrescrito>) abc.getResultList();
	}

	public ArrayList<MedicamentoAnterior> getAllMedicamentosAnteriores(int i) {
		Query abc = entityManager.createQuery("from MedicamentoAnterior e where fkCasoClinico = ?1").setParameter(1, i);
		return (ArrayList<MedicamentoAnterior>) abc.getResultList();
	}
	
	public ArrayList<CasoClinico> getCasosByIdioma(String idioma){
		Query abc = entityManager.createQuery("from CasoClinico e where idioma = ?1").setParameter(1, idioma);
		return (ArrayList<CasoClinico>) abc.getResultList();
	}
	
	public ArrayList<DiarioMedicamentosCaso> getAllDiarioMed(int id) {
		Query abc = entityManager.createQuery("from DiarioMedicamentosCaso e where fkCasoClinico = ?1").setParameter(1, id);
		return (ArrayList<DiarioMedicamentosCaso>) abc.getResultList();
	}
	

}
