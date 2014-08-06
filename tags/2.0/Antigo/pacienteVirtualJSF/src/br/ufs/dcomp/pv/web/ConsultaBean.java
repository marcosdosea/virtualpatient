package br.ufs.dcomp.pv.web;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;

import javax.faces.model.SelectItem;
import javax.naming.InitialContext;

import br.ufs.dcomp.pv.JPA.CasoClinico;
import br.ufs.dcomp.pv.JPA.CasoClinicoDAO;

public class ConsultaBean {

	private ArrayList<CasoClinico> listaCasosByIdioma = new ArrayList<CasoClinico>();
	
	Integer casoConsultadoAuxStr;
	
	CasoClinico casoConsultado = new CasoClinico();
	
	public String Escolher(){
		
		CasoClinicoDAO daoCC = getCasoClinicoDAO();
						
		System.out.println(casoConsultadoAuxStr);
		
		casoConsultado = daoCC.getCasoClinico(casoConsultadoAuxStr);
		
		return "consultado com sucesso";
	}
	
	public CasoClinicoDAO getCasoClinicoDAO(){
		
		CasoClinicoDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (CasoClinicoDAO) ctx.lookup("pacienteVirtualEAR/CasoClinicoDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	public ArrayList<SelectItem> getListaCasosByIdioma(){		
		
		CasoClinicoDAO daoCC = getCasoClinicoDAO();
		
		listaCasosByIdioma = new ArrayList<CasoClinico>();
		
		listaCasosByIdioma = daoCC.getCasosByIdioma(TraducaoBean.getIdiomaAtual());
		
		ArrayList<SelectItem> retorno = new ArrayList<SelectItem>(); 
		
		for(Iterator<CasoClinico> i = listaCasosByIdioma.iterator(); i.hasNext();){
			CasoClinico elementoAux = i.next();
			SelectItem a = new SelectItem(elementoAux.getId(), elementoAux.getNome());
			retorno.add(a);
		}
		
		return retorno; 		
	}
	
	public Integer getCasoConsultadoAuxStr() {
		return casoConsultadoAuxStr;
	}

	public void setCasoConsultadoAuxStr(Integer casoConsultadoAuxStr) {
		this.casoConsultadoAuxStr = casoConsultadoAuxStr;
	}

	public CasoClinico getCasoConsultado() {
		return casoConsultado;
	}

	public void setCasoConsultado(CasoClinico casoConsultado) {
		this.casoConsultado = casoConsultado;
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
