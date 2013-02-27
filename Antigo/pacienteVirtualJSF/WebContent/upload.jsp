<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@page import="javax.swing.ImageIcon"%>  
<%@page import="java.io.File"%>  
<jsp:useBean class="br.ufs.dcomp.pv.web.UploadBean" id="upl" />  
<jsp:setProperty name="upl" property="diretorio" value="aquivos" />  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PharmaVP</title>
<link href="${pageContext.request.contextPath}/css/favicon.ico"
	rel="shortcut icon" type="image/x-icon" />
<link rel="StyleSheet" type="text/css"
	href="${pageContext.request.contextPath}/css/cssCadastro.css"
	media="screen" /> 
</head>
<body>
<f:loadBundle basename="LocalizationResources" var="bundle"/>
<f:view>
	<h:panelGroup layout="block" id="tudo" styleClass="tudo">
		<h:panelGroup layout="block" id="conteudo" styleClass="conteudo">
			<h:panelGroup layout="block" id="header" styleClass="header">
		    <h:panelGroup>	
					<h:graphicImage value="/css/header.PNG" style="border: 0" alt="PharmaVP"></h:graphicImage>		
				</h:panelGroup>	
			</h:panelGroup>
			<h:panelGroup layout="block" id="wraper" styleClass="wraper">
				<h:panelGroup layout="block" id="mainContent" styleClass="mainContent">
					<form method="post" action="upload.jsp" enctype="multipart/form-data" > 
					 <br>
					 <br><h2><h:outputText value="#{bundle.foto}"></h:outputText></h2>
					 <br><br>	
					  <input type="file" name="foto" />  
					  <br><br>
					  <input type="submit" value="Upload" />
					  <br><br>	
					        <%              
						       if (upl.doFilePost(request,application)){  
						           out.println(upl.getFilename());  
						           out.println(upl.getDiretorio());  
						       } 
						     %>	
					   <br><br>    
					   <a href="uploadSucesso.jsp">
					   		<h:outputText value="#{bundle.verFoto}"></h:outputText></a> 	
					   <br><br>
					   <a href="addCasoClinico.jsp">
							<h:outputText value="#{bundle.voltar}"></h:outputText></a> 				      
					</form>
				</h:panelGroup>
			</h:panelGroup>
			<h:panelGroup layout="block" id="clear" styleClass="clear">
			</h:panelGroup>
		</h:panelGroup>
		<h:panelGroup layout="block" id="footer" styleClass="footer">
			<p>dcomp&copy;</p>
		</h:panelGroup>
	</h:panelGroup>
</f:view>
</body>
</html>