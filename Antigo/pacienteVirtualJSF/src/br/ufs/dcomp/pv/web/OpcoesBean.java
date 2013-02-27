package br.ufs.dcomp.pv.web;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedHashMap;

import javax.faces.model.SelectItem;
import javax.naming.InitialContext;
import javax.swing.JOptionPane;

import br.ufs.dcomp.pv.JPA.*;

public class OpcoesBean {

	private String opcaoEscolhida;
	private String descricao;
	private String teste;
	LinkedHashMap<String, Integer> listaOpcoes;
		
	
	public String addMedicamento(){
		MedicamentosDAO dao = getMedicamentosDAO();
		Medicamentos newO = new Medicamentos();
		
		if(descricao != "")
		{
			String desc1 = descricao.trim();
			boolean tem = false;
			ArrayList<Medicamentos> list = 	getMedicamentosDAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
			for(Iterator<Medicamentos> i = list.iterator(); i.hasNext();){
				Medicamentos elementoAux = i.next();
				String desc2 = elementoAux.getDescricao().trim();
				
				if(desc1.equalsIgnoreCase(desc2))
				{
					tem = true;
					descricao = "";
					break;
				}
			}
			
			if(!tem){
			
				newO.setDescricao(descricao.trim());
				newO.setIdioma(TraducaoBean.getIdiomaAtual());
				
				dao.addMedicamento(newO);
				
				descricao = "";
				
				return "success";
			}
		}		
		
		return "";
	}
	
	public String addRazaoEncontro(){
		RazaoEncontroDAO dao = getRazaoEncontroDAO();
		RazaoEncontro newO = new RazaoEncontro();
		
		if(descricao != "")
		{
			String desc1 = descricao.trim();
			boolean tem = false;
			ArrayList<RazaoEncontro> list = 	getRazaoEncontroDAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
			for(Iterator<RazaoEncontro> i = list.iterator(); i.hasNext();){
				RazaoEncontro elementoAux = i.next();
				String desc2 = elementoAux.getDescricao().trim();
				
				if(desc1.equalsIgnoreCase(desc2))
				{
					tem = true;
					descricao = "";
					break;
				}
			}
			
			if(!tem){
			
				newO.setDescricao(descricao.trim());
				newO.setIdioma(TraducaoBean.getIdiomaAtual());
				
				dao.addRazaoEncontro(newO);
				
				descricao = "";
				
				return "success";
			}
		}		
		
		return "";
	}
	
	public String addExperienciaMedicamentos1(){
		ExperienciaMedicamentos1DAO dao = getExperienciaMedicamentos1DAO();
		ExperienciaMedicamentos1 newO = new ExperienciaMedicamentos1();
		
		if(descricao != "")
		{
			String desc1 = descricao.trim();
			boolean tem = false;
			ArrayList<ExperienciaMedicamentos1> list = 	getExperienciaMedicamentos1DAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
			for(Iterator<ExperienciaMedicamentos1> i = list.iterator(); i.hasNext();){
				ExperienciaMedicamentos1 elementoAux = i.next();
				String desc2 = elementoAux.getDescricao().trim();
				
				if(desc1.equalsIgnoreCase(desc2))
				{
					tem = true;
					descricao = "";
					break;
				}
			}
			
			if(!tem){
			
				newO.setDescricao(descricao.trim());
				newO.setIdioma(TraducaoBean.getIdiomaAtual());
				
				dao.addExperienciaMedicamentos1(newO);
				
				descricao = "";
				
				return "success";
			}
		}		
		
		return "";
	}
	
	public String addExperienciaMedicamentos2(){
		ExperienciaMedicamentos2DAO dao = getExperienciaMedicamentos2DAO();
		ExperienciaMedicamentos2 newO = new ExperienciaMedicamentos2();
		
		if(descricao != "")
		{
			String desc1 = descricao.trim();
			boolean tem = false;
			ArrayList<ExperienciaMedicamentos2> list = 	getExperienciaMedicamentos2DAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
			for(Iterator<ExperienciaMedicamentos2> i = list.iterator(); i.hasNext();){
				ExperienciaMedicamentos2 elementoAux = i.next();
				String desc2 = elementoAux.getDescricao().trim();
				
				if(desc1.equalsIgnoreCase(desc2))
				{
					tem = true;
					descricao = "";
					break;
				}
			}
			
			if(!tem){
			
				newO.setDescricao(descricao.trim());
				newO.setIdioma(TraducaoBean.getIdiomaAtual());
				
				dao.addExperienciaMedicamentos2(newO);
				
				descricao = "";
				
				return "success";
			}
		}		
		
		return "";
	}
	
	public String addExperienciaMedicamentos3(){
		ExperienciaMedicamentos3DAO dao = getExperienciaMedicamentos3DAO();
		ExperienciaMedicamentos3 newO = new ExperienciaMedicamentos3();
		
		if(descricao != "")
		{
			String desc1 = descricao.trim();
			boolean tem = false;
			ArrayList<ExperienciaMedicamentos3> list = 	getExperienciaMedicamentos3DAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
			for(Iterator<ExperienciaMedicamentos3> i = list.iterator(); i.hasNext();){
				ExperienciaMedicamentos3 elementoAux = i.next();
				String desc2 = elementoAux.getDescricao().trim();
				
				if(desc1.equalsIgnoreCase(desc2))
				{
					tem = true;
					descricao = "";
					break;
				}
			}
			
			if(!tem){
			
				newO.setDescricao(descricao.trim());
				newO.setIdioma(TraducaoBean.getIdiomaAtual());
				
				dao.addExperienciaMedicamentos3(newO);
				
				descricao = "";
				
				return "success";
			}
		}		
		
		return "";
	}	
	
	public String addExperienciaMedicamentos4(){
		ExperienciaMedicamentos4DAO dao = getExperienciaMedicamentos4DAO();
		ExperienciaMedicamentos4 newO = new ExperienciaMedicamentos4();
		
		if(descricao != "")
		{
			String desc1 = descricao.trim();
			boolean tem = false;
			ArrayList<ExperienciaMedicamentos4> list = 	getExperienciaMedicamentos4DAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
			for(Iterator<ExperienciaMedicamentos4> i = list.iterator(); i.hasNext();){
				ExperienciaMedicamentos4 elementoAux = i.next();
				String desc2 = elementoAux.getDescricao().trim();
				
				if(desc1.equalsIgnoreCase(desc2))
				{
					tem = true;
					descricao = "";
					break;
				}
			}
			
			if(!tem){
			
				newO.setDescricao(descricao.trim());
				newO.setIdioma(TraducaoBean.getIdiomaAtual());
				
				dao.addExperienciaMedicamentos4(newO);
				
				descricao = "";
				
				return "success";
			}
		}		
		
		return "";
	}
	
	public String addExperienciaMedicamentos5(){
		ExperienciaMedicamentos5DAO dao = getExperienciaMedicamentos5DAO();
		ExperienciaMedicamentos5 newO = new ExperienciaMedicamentos5();
		
		if(descricao != "")
		{
			String desc1 = descricao.trim();
			boolean tem = false;
			ArrayList<ExperienciaMedicamentos5> list = 	getExperienciaMedicamentos5DAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
			for(Iterator<ExperienciaMedicamentos5> i = list.iterator(); i.hasNext();){
				ExperienciaMedicamentos5 elementoAux = i.next();
				String desc2 = elementoAux.getDescricao().trim();
				
				if(desc1.equalsIgnoreCase(desc2))
				{
					tem = true;
					descricao = "";
					break;
				}
			}
			
			if(!tem){
			
				newO.setDescricao(descricao.trim());
				newO.setIdioma(TraducaoBean.getIdiomaAtual());
				
				dao.addExperienciaMedicamentos5(newO);
				
				descricao = "";
				
				return "success";
			}
		}		
		
		return "";
	}
	
	public String addExperienciaMedicamentosConc(){
		ExperienciaMedicamentosConcDAO dao = getExperienciaMedicamentosConcDAO();
		ExperienciaMedicamentosConc newO = new ExperienciaMedicamentosConc();
		
		if(descricao != "")
		{
			String desc1 = descricao.trim();
			boolean tem = false;
			ArrayList<ExperienciaMedicamentosConc> list = 	getExperienciaMedicamentosConcDAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
			for(Iterator<ExperienciaMedicamentosConc> i = list.iterator(); i.hasNext();){
				ExperienciaMedicamentosConc elementoAux = i.next();
				String desc2 = elementoAux.getDescricao().trim();
				
				if(desc1.equalsIgnoreCase(desc2))
				{
					tem = true;
					descricao = "";
					break;
				}
			}
			
			if(!tem){
			
				newO.setDescricao(descricao.trim());
				newO.setIdioma(TraducaoBean.getIdiomaAtual());
				
				dao.addExperienciaMedicamentosConc(newO);
				
				descricao = "";
				
				return "success";
			}
		}		
		
		return "";
	}
	
	public String addHistoriaMedicaPregressa(){
		HistoriaMedicaPregressaDAO dao = getHistoriaMedicaPregressaDAO();
		HistoriaMedicaPregressa newO = new HistoriaMedicaPregressa();
		
		if(descricao != "")
		{
			String desc1 = descricao.trim();
			boolean tem = false;
			ArrayList<HistoriaMedicaPregressa> list = 	getHistoriaMedicaPregressaDAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
			for(Iterator<HistoriaMedicaPregressa> i = list.iterator(); i.hasNext();){
				HistoriaMedicaPregressa elementoAux = i.next();
				String desc2 = elementoAux.getDescricao().trim();
				
				if(desc1.equalsIgnoreCase(desc2))
				{
					tem = true;
					descricao = "";
					break;
				}
			}
			
			if(!tem){
			
				newO.setDescricao(descricao.trim());
				newO.setIdioma(TraducaoBean.getIdiomaAtual());
				
				dao.addHistoriaMedicaPregressa(newO);
				
				descricao = "";
				
				return "success";
			}
		}		
		
		return "";
	}
	
	public String addHistoriaFamiliar(){
		HistoriaFamiliarDAO dao = getHistoriaFamiliarDAO();
		HistoriaFamiliar newO = new HistoriaFamiliar();
		
		if(descricao != "")
		{
			String desc1 = descricao.trim();
			boolean tem = false;
			ArrayList<HistoriaFamiliar> list = 	getHistoriaFamiliarDAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
			for(Iterator<HistoriaFamiliar> i = list.iterator(); i.hasNext();){
				HistoriaFamiliar elementoAux = i.next();
				String desc2 = elementoAux.getDescricao().trim();
				
				if(desc1.equalsIgnoreCase(desc2))
				{
					tem = true;
					descricao = "";
					break;
				}
			}
			
			if(!tem){
			
				newO.setDescricao(descricao.trim());
				newO.setIdioma(TraducaoBean.getIdiomaAtual());
				
				dao.addHistoriaFamiliar(newO);
				
				descricao = "";
				
				return "success";
			}
		}		
		
		return "";
	}
	
	public String addAlergias(){
		AlergiasDAO dao = getAlergiasDAO();
		Alergias newO = new Alergias();
		
		if(descricao != "")
		{
			String desc1 = descricao.trim();
			boolean tem = false;
			ArrayList<Alergias> list = 	getAlergiasDAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
			for(Iterator<Alergias> i = list.iterator(); i.hasNext();){
				Alergias elementoAux = i.next();
				String desc2 = elementoAux.getDescricao().trim();
				
				if(desc1.equalsIgnoreCase(desc2))
				{
					tem = true;
					descricao = "";
					break;
				}
			}
			
			if(!tem){
			
				newO.setDescricao(descricao.trim());
				newO.setIdioma(TraducaoBean.getIdiomaAtual());
				
				dao.addAlergia(newO);
				
				descricao = "";
				
				return "success";
			}
		}		
		
		return "";
	}
	
	public String addAlternativas(){
		AlternativasDAO dao = getAlternativasDAO();
		Alternativas newO = new Alternativas();
		
		if(descricao != "")
		{
			String desc1 = descricao.trim();
			boolean tem = false;
			ArrayList<Alternativas> list = 	getAlternativasDAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
			for(Iterator<Alternativas> i = list.iterator(); i.hasNext();){
				Alternativas elementoAux = i.next();
				String desc2 = elementoAux.getDescricao().trim();
				
				if(desc1.equalsIgnoreCase(desc2))
				{
					tem = true;
					descricao = "";
					break;
				}
			}
			
			if(!tem){
			
				newO.setDescricao(descricao.trim());
				newO.setIdioma(TraducaoBean.getIdiomaAtual());
				
				dao.addAlternativa(newO);
				
				descricao = "";
				
				return "success";
			}
		}		
		
		return "";
	}
	
	public LinkedHashMap<String, String> getListaMedicamentos() {
		ArrayList<Medicamentos> list = 	getMedicamentosDAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
		LinkedHashMap<String, String> linkedList = new LinkedHashMap<String, String>();
		
		for(Iterator<Medicamentos> i = list.iterator(); i.hasNext();){
			Medicamentos elementoAux = i.next();
			linkedList.put(elementoAux.getDescricao(), elementoAux.getDescricao());		
		}
		
		return linkedList;
	}
	
	public LinkedHashMap<String, String> getListaRazaoEncontro() {
		ArrayList<RazaoEncontro> list = getRazaoEncontroDAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
		LinkedHashMap<String, String> linkedList = new LinkedHashMap<String, String>();
		
		for(Iterator<RazaoEncontro> i = list.iterator(); i.hasNext();){
			RazaoEncontro elementoAux = i.next();
			linkedList.put(elementoAux.getDescricao(), elementoAux.getDescricao());		
		}
		
		return linkedList;
	}
	
	public LinkedHashMap<String, String> getListaExperienciaMedicamentos1() {
		ArrayList<ExperienciaMedicamentos1> list = 	getExperienciaMedicamentos1DAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
		LinkedHashMap<String, String> linkedList = new LinkedHashMap<String, String>();
		
		for(Iterator<ExperienciaMedicamentos1> i = list.iterator(); i.hasNext();){
			ExperienciaMedicamentos1 elementoAux = i.next();
			linkedList.put(elementoAux.getDescricao(), elementoAux.getDescricao());		
		}
		
		return linkedList;
	}
	
	public LinkedHashMap<String, String> getListaExperienciaMedicamentos2() {
		ArrayList<ExperienciaMedicamentos2> list = 	getExperienciaMedicamentos2DAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
		LinkedHashMap<String, String> linkedList = new LinkedHashMap<String, String>();
		
		for(Iterator<ExperienciaMedicamentos2> i = list.iterator(); i.hasNext();){
			ExperienciaMedicamentos2 elementoAux = i.next();
			linkedList.put(elementoAux.getDescricao(), elementoAux.getDescricao());		
		}
		
		return linkedList;
	}
	
	public LinkedHashMap<String, String> getListaExperienciaMedicamentos3() {
		ArrayList<ExperienciaMedicamentos3> list = 	getExperienciaMedicamentos3DAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
		LinkedHashMap<String, String> linkedList = new LinkedHashMap<String, String>();
		
		for(Iterator<ExperienciaMedicamentos3> i = list.iterator(); i.hasNext();){
			ExperienciaMedicamentos3 elementoAux = i.next();
			linkedList.put(elementoAux.getDescricao(), elementoAux.getDescricao());		
		}
		
		return linkedList;
	}
	
	public LinkedHashMap<String, String> getListaExperienciaMedicamentos4() {
		ArrayList<ExperienciaMedicamentos4> list = 	getExperienciaMedicamentos4DAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
		LinkedHashMap<String, String> linkedList = new LinkedHashMap<String, String>();
		
		for(Iterator<ExperienciaMedicamentos4> i = list.iterator(); i.hasNext();){
			ExperienciaMedicamentos4 elementoAux = i.next();
			linkedList.put(elementoAux.getDescricao(), elementoAux.getDescricao());		
		}
		
		return linkedList;
	}
	
	public LinkedHashMap<String, String> getListaExperienciaMedicamentos5() {
		ArrayList<ExperienciaMedicamentos5> list = 	getExperienciaMedicamentos5DAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
		LinkedHashMap<String, String> linkedList = new LinkedHashMap<String, String>();
		
		for(Iterator<ExperienciaMedicamentos5> i = list.iterator(); i.hasNext();){
			ExperienciaMedicamentos5 elementoAux = i.next();
			linkedList.put(elementoAux.getDescricao(), elementoAux.getDescricao());		
		}
		
		return linkedList;
	}
	
	public LinkedHashMap<String, String> getListaExperienciaMedicamentosConc() {
		ArrayList<ExperienciaMedicamentosConc> list = 	getExperienciaMedicamentosConcDAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
		LinkedHashMap<String, String> linkedList = new LinkedHashMap<String, String>();
		
		for(Iterator<ExperienciaMedicamentosConc> i = list.iterator(); i.hasNext();){
			ExperienciaMedicamentosConc elementoAux = i.next();
			linkedList.put(elementoAux.getDescricao(), elementoAux.getDescricao());		
		}
		
		return linkedList;
	}
	
	public LinkedHashMap<String, String> getListaHistoriaMedicaPregressa() {
		ArrayList<HistoriaMedicaPregressa> list = 	getHistoriaMedicaPregressaDAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
		LinkedHashMap<String, String> linkedList = new LinkedHashMap<String, String>();
		
		for(Iterator<HistoriaMedicaPregressa> i = list.iterator(); i.hasNext();){
			HistoriaMedicaPregressa elementoAux = i.next();
			linkedList.put(elementoAux.getDescricao(), elementoAux.getDescricao());		
		}
		
		return linkedList;
	}
	
	public LinkedHashMap<String, String> getListaHistoriaFamiliar() {
		ArrayList<HistoriaFamiliar> list = 	getHistoriaFamiliarDAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
		LinkedHashMap<String, String> linkedList = new LinkedHashMap<String, String>();
		
		for(Iterator<HistoriaFamiliar> i = list.iterator(); i.hasNext();){
			HistoriaFamiliar elementoAux = i.next();
			linkedList.put(elementoAux.getDescricao(), elementoAux.getDescricao());		
		}
		
		return linkedList;
	}
	
	public LinkedHashMap<String, String> getListaAlergias() {
		ArrayList<Alergias> list = 	getAlergiasDAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
		LinkedHashMap<String, String> linkedList = new LinkedHashMap<String, String>();
		
		for(Iterator<Alergias> i = list.iterator(); i.hasNext();){
			Alergias elementoAux = i.next();
			linkedList.put(elementoAux.getDescricao(), elementoAux.getDescricao());		
		}
		
		return linkedList;
	}

	public LinkedHashMap<String, String> getListaAlternativas() {
		ArrayList<Alternativas> list = 	getAlternativasDAO().getAllByIdioma(TraducaoBean.getIdiomaAtual()) ;
		LinkedHashMap<String, String> linkedList = new LinkedHashMap<String, String>();
		
		for(Iterator<Alternativas> i = list.iterator(); i.hasNext();){
			Alternativas elementoAux = i.next();
			linkedList.put(elementoAux.getDescricao(), elementoAux.getDescricao());		
		}
		
		return linkedList;
	}
	
	public String escolher(){
		
		return "opcao" + opcaoEscolhida;
	}
	
	public LinkedHashMap<String, Integer> getListaOpcoes() {		
		listaOpcoes =  new LinkedHashMap<String, Integer>();
		listaOpcoes.put(TraducaoBean.getTraducao("opcao1"), 1);
		listaOpcoes.put(TraducaoBean.getTraducao("opcao2"), 2);
		listaOpcoes.put(TraducaoBean.getTraducao("opcao3"), 3);
		listaOpcoes.put(TraducaoBean.getTraducao("opcao4"), 4);
		listaOpcoes.put(TraducaoBean.getTraducao("opcao5"), 5);
		listaOpcoes.put(TraducaoBean.getTraducao("opcao6"), 6);
		listaOpcoes.put(TraducaoBean.getTraducao("opcao7"), 7);
		listaOpcoes.put(TraducaoBean.getTraducao("opcao8"), 8);
		listaOpcoes.put(TraducaoBean.getTraducao("opcao9"), 9);
		listaOpcoes.put(TraducaoBean.getTraducao("opcao10"), 10);
		listaOpcoes.put(TraducaoBean.getTraducao("opcao11"), 11);
		listaOpcoes.put(TraducaoBean.getTraducao("opcao12"), 12);
		
		return listaOpcoes;
	}
	
	private MedicamentosDAO getMedicamentosDAO(){
		
		MedicamentosDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (MedicamentosDAO) ctx.lookup("pacienteVirtualEAR/MedicamentosDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	private RazaoEncontroDAO getRazaoEncontroDAO(){
			
		RazaoEncontroDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (RazaoEncontroDAO) ctx.lookup("pacienteVirtualEAR/RazaoEncontroDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}

	private ExperienciaMedicamentos1DAO getExperienciaMedicamentos1DAO(){
		
		ExperienciaMedicamentos1DAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentos1DAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentos1DAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	private ExperienciaMedicamentos2DAO getExperienciaMedicamentos2DAO(){
		
		ExperienciaMedicamentos2DAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentos2DAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentos2DAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	private ExperienciaMedicamentos3DAO getExperienciaMedicamentos3DAO(){
		
		ExperienciaMedicamentos3DAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentos3DAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentos3DAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	private ExperienciaMedicamentos4DAO getExperienciaMedicamentos4DAO(){
		
		ExperienciaMedicamentos4DAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentos4DAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentos4DAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	private ExperienciaMedicamentos5DAO getExperienciaMedicamentos5DAO(){
		
		ExperienciaMedicamentos5DAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentos5DAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentos5DAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	private ExperienciaMedicamentosConcDAO getExperienciaMedicamentosConcDAO(){
		
		ExperienciaMedicamentosConcDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (ExperienciaMedicamentosConcDAO) ctx.lookup("pacienteVirtualEAR/ExperienciaMedicamentosConcDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
		
	private HistoriaMedicaPregressaDAO getHistoriaMedicaPregressaDAO(){
		
		HistoriaMedicaPregressaDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (HistoriaMedicaPregressaDAO) ctx.lookup("pacienteVirtualEAR/HistoriaMedicaPregressaDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	private HistoriaFamiliarDAO getHistoriaFamiliarDAO(){
		
		HistoriaFamiliarDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (HistoriaFamiliarDAO) ctx.lookup("pacienteVirtualEAR/HistoriaFamiliarDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	private AlergiasDAO getAlergiasDAO(){
		
		AlergiasDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (AlergiasDAO) ctx.lookup("pacienteVirtualEAR/AlergiasDAOBean/remote");
			
		} catch (Exception e) {
			// TODO handle errors
		}
		
		return dao;
	}
	
	private AlternativasDAO getAlternativasDAO(){
		
		AlternativasDAO dao = null;
		try {
			InitialContext ctx = getInitialContext();
			dao = (AlternativasDAO) ctx.lookup("pacienteVirtualEAR/AlternativasDAOBean/remote");
			
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

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setOpcaoEscolhida(String opcaoEscolhida) {
		this.opcaoEscolhida = opcaoEscolhida;
	}

	public String getOpcaoEscolhida() {
		return opcaoEscolhida;
	}

	public void setTeste(String teste) {
		this.teste = teste;
	}

	public String getTeste() {
		return teste;
	}

}
