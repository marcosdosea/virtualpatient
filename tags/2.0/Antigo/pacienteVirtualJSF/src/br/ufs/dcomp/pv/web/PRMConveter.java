package br.ufs.dcomp.pv.web;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;

public class PRMConveter implements Converter{

	private Map<Integer, String> PRMsItens;
	
	private ArrayList<String> PRMs;
	
	public PRMConveter() {
		PRMsItens = new LinkedHashMap<Integer, String>();
		PRMsItens.put(1, TraducaoBean.getTraducao("prm") + ": " + TraducaoBean.getTraducao("PRMsItens1"));
		PRMsItens.put(2, TraducaoBean.getTraducao("prm") + ": " + TraducaoBean.getTraducao("PRMsItens2"));
		PRMsItens.put(3, TraducaoBean.getTraducao("prm") + ": " + TraducaoBean.getTraducao("PRMsItens3"));
		PRMsItens.put(4, TraducaoBean.getTraducao("prm") + ": " + TraducaoBean.getTraducao("PRMsItens4"));
		PRMsItens.put(5, TraducaoBean.getTraducao("prm") + ": " + TraducaoBean.getTraducao("PRMsItens5"));
		PRMsItens.put(6, TraducaoBean.getTraducao("prm") + ": " + TraducaoBean.getTraducao("PRMsItens6"));
		PRMsItens.put(7, TraducaoBean.getTraducao("prm") + ": " + TraducaoBean.getTraducao("PRMsItens7"));
		PRMsItens.put(-1, TraducaoBean.getTraducao("doencaAgravo"));
		
		//PRMs = (ArrayList<String>) PRMsItens.keySet();
	}
	
	@Override
	public Object getAsObject(FacesContext arg0, UIComponent arg1, String arg2) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getAsString(FacesContext arg0, UIComponent arg1, Object arg2) {
		return PRMsItens.get(arg2);
		
	}

}
