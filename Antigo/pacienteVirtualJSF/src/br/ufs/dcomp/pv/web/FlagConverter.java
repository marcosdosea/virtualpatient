package br.ufs.dcomp.pv.web;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;

public class FlagConverter implements Converter{

	@Override
	public Object getAsObject(FacesContext arg0, UIComponent arg1,
			String arg2) {
		/*if(arg2.equals("V")){
			return "Sim";
		}else{
			return "Não";
		}*/
		return null;
	}

	@Override
	public String getAsString(FacesContext arg0, UIComponent arg1,
			Object arg2) {
		if(arg2.equals("V")){
			return TraducaoBean.getTraducao("sim");
		}if(arg2.equals("F")){
			return TraducaoBean.getTraducao("nao");
		}else{
			return "";
		}
	}
	
}
