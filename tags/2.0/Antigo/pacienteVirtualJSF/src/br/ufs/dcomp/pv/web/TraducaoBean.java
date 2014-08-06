package br.ufs.dcomp.pv.web;

import java.text.MessageFormat;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.MissingResourceException;
import java.util.Locale;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class TraducaoBean {
	
	public String idioma ="";
	public String testeP ="";
	public String testeP2 ="";
	
	private Map<String, Object> itensTeste;
	
	public String getTesteP() {
		return testeP;
	}
	public void setTesteP(String testeP) {
		this.testeP = testeP;
	}
	public String getTesteP2() {
		
		itensTeste = new LinkedHashMap<String, Object>();
		
		if(testeP == "1")
		{			
			itensTeste.put("TESTE DE 1 AAAA", 1);
			itensTeste.put("TESTE DE 1 BBBB", 1);
		}
		else
		{			
			itensTeste.put("TESTE DE 2 CCCCCC", 1);
			itensTeste.put("TESTE DE 2 DDDDDD", 1);
		}	
		
		return testeP2;
	}
	public void setTesteP2(String testeP2) {
		this.testeP2 = testeP2;
	}
	
	public void mudaP()
	{	
		
	}
	public void setItensTeste(Map<String, Object> itensTeste) {
		this.itensTeste = itensTeste;
	}
	public Map<String, Object> getItensTeste() {
		return itensTeste;
	}
	
	
	
	
	

	public String getIdioma() {
		return idioma;
	}

	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}

	public String mudarIdioma()
	{
		this.mudarLocale(new Locale(idioma));
		return null;
	}
	
	private void mudarLocale(Locale locale)
	{
		FacesContext.getCurrentInstance().getViewRoot().setLocale(locale);
		HttpServletRequest request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("Idioma", locale);
	}
	
	protected static ClassLoader getCurrentClassLoader(Object defaultObject)
	{
		ClassLoader loader =
			Thread.currentThread().getContextClassLoader();
			if (loader == null)
			{
			loader = defaultObject.getClass().getClassLoader();
			}
			return loader;
	}
	protected static String getDisplayString(String bundleName,String id, Object params[],Locale locale)
	{
		String text = null;
		ResourceBundle bundle = ResourceBundle.getBundle(bundleName, locale,getCurrentClassLoader(params));
	    try
		{
			text = bundle.getString(id);
		}
		catch (MissingResourceException e)
		{
			text = "???Chave " + id + " não encontrada.";
		}
		if (params != null)
		{
			MessageFormat mf = new MessageFormat(text, locale);
			text = mf.format(params, new StringBuffer(), null).toString();
		}
		return text;
	}
	public static String getTraducao(String key)
	{
		HttpServletRequest request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		Locale locale = (Locale) session.getAttribute("Idioma");
		
		return getDisplayString("LocalizationResources", key, null,
				locale);
	}
	
	public static String getIdiomaAtual()
	{
		HttpServletRequest request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
		HttpSession session = request.getSession();
		return session.getAttribute("Idioma").toString();
	}	

}
