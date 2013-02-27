package br.ufs.dcomp.pv.web;

import java.io.File;  
import java.util.Hashtable;
import java.util.Iterator;  
import java.util.List;  

import javax.faces.context.FacesContext;
import javax.naming.InitialContext;
import javax.servlet.ServletContext;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;  
import org.apache.commons.fileupload.FileUploadException;  
import org.apache.commons.fileupload.disk.DiskFileItemFactory;  
import org.apache.commons.fileupload.servlet.ServletFileUpload;  

import br.ufs.dcomp.pv.JPA.CasoClinicoDAO;
  
public class UploadBean {  
    private DiskFileItemFactory fileUpload = new DiskFileItemFactory();  
    private ServletFileUpload sfu = new ServletFileUpload(fileUpload);  
    private String diretorio;  
    private String filename;  
    private String pastaLocal = "css/fotos";
   // File dir = new File("C:/jboss/server/default/tmp/deploy/pacienteVirtualJSF2857829766437389900-exp.war/css/fotos");  

    
    public String getDiretorio() {  
        return diretorio;  
    }  
  
    public void setDiretorio(String diretorio) {  
        this.diretorio = diretorio;  
    }  
  
    public String getFilename() {  
        return filename;  
    }  
  
    public void setFilename(String filename) {  
        this.filename = filename;  
    }  
  
    public DiskFileItemFactory getFileUpload() {  
        return fileUpload;  
    }  
  
    public void setFileUpload(DiskFileItemFactory fileUpload) {  
        this.fileUpload = fileUpload;  
    }  
  
    public ServletFileUpload getSfu() {  
        return sfu;  
    }  
  
    public void setSfu(ServletFileUpload sfu) {  
        this.sfu = sfu;  
    }  
  
    public boolean doFilePost(HttpServletRequest request, ServletContext context){  
        if (request.getContentType() == null)   
            return false;  
        if (!request.getContentType().startsWith("multipart/form-data"))  
            return false;  
        
        String path = context.getRealPath(pastaLocal);
        File dir = new File(path);
        
        
        try{  
            List list = sfu.parseRequest(request);  
            Iterator iterator  = list.iterator();  
  
            while (iterator.hasNext()){  
                FileItem item = (FileItem)iterator.next();  
  
                if (!item.isFormField()){  
                    filename = item.getName();  
                  
                if ((filename != null) && (!filename.equals(""))){  
                    filename = (new File(filename)).getName();  
                    item.write(new File(dir+ "/" + filename));   
                    
                    gravarNaSessao();
                }  
              }  
            }  
        }catch(FileUploadException e){  
            e.printStackTrace();  
        }catch(Exception ex) {  
            ex.printStackTrace();  
        }  
       return true;  
    }  
    
    public void gravarNaSessao(){
       
    	FacesContext facesContext = FacesContext.getCurrentInstance();
		
		HttpServletRequest request = (HttpServletRequest) facesContext.getCurrentInstance().getExternalContext().getRequest();
		
		HttpSession session = request.getSession();
		
		session.setAttribute("fotoFileName", pastaLocal + "/" + filename);
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