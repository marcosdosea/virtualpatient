<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PharmaVP</title>
<link href="${pageContext.request.contextPath}/css/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link rel="StyleSheet" type="text/css" href="${pageContext.request.contextPath}/css/oneColElsCtrHdr.css"  media="screen" />

<script language="JavaScript">
	function validaForm(){
		
		//validar login		
		if (document.getElementById("index:login").value == ""){
			alert(document.getElementById("index:alertLogin").value);
			document.getElementById("index:login").focus();
			return false;
		}
		
		//validar senha
		if (document.getElementById("index:senha").value == ""){
			alert(document.getElementById("index:alertSenha").value);
			document.getElementById("index:senha").focus();
			return false;
		}
		
		return true;
	}
</script> 
</head>
<body>
<f:loadBundle basename="LocalizationResources" var="bundle"/>
<f:view>
	<h:panelGroup layout="block" id="container" styleClass="container">
		<h:panelGroup layout="block" id="cabecalho" styleClass="cabecalho">
			<h:graphicImage value="/css/header.PNG" style="border: 0" alt="PharmaVP"></h:graphicImage>
  			<!-- end #header -->
  		</h:panelGroup>
  		<h:panelGroup layout="block" id="corpo" styleClass="corpo">
			<h:panelGroup layout="block" id="divLogin" styleClass="login">			
				<h:form  id="index" onsubmit="return validaForm()">
				
				<br>
				<h:panelGroup layout="block" id="divIdioma" styleClass="idioma">
					<h:outputText value="#{bundle.escolhaIdioma}" style="font-size: 80%; color: white; font-weight:bold;"></h:outputText>
					<br>					
					<h:commandLink action="#{traducaoBean.mudarIdioma}" >
						<h:graphicImage value="/css/flagBrasil.png" alt="#{bundle.portugues}" style="border: 0px;"></h:graphicImage>
						<f:setPropertyActionListener value="pt" target="#{traducaoBean.idioma}"/>
					</h:commandLink>
					&nbsp;
					<h:commandLink action="#{traducaoBean.mudarIdioma}" >
						<h:graphicImage value="/css/flagEUA.png" alt="#{bundle.ingles}" style="border: 0px;"></h:graphicImage>
						<f:setPropertyActionListener value="en" target="#{traducaoBean.idioma}"/>
					</h:commandLink>
					&nbsp;
					<h:commandLink action="#{traducaoBean.mudarIdioma}" >
						<h:graphicImage value="/css/flagEspanha.png" alt="#{bundle.espanhol}" style="border: 0px;"></h:graphicImage>
						<f:setPropertyActionListener value="es" target="#{traducaoBean.idioma}"/>
					</h:commandLink>
				</h:panelGroup>
				<br>
				<h:outputText value="#{bundle.login}"></h:outputText><br>
				<h:inputText id="login" value="#{usuarioBean.login}" styleClass="inputLogin"></h:inputText><br>
				<h:outputText value="#{bundle.password}"></h:outputText><br>
				<h:inputSecret id="senha" value="#{usuarioBean.senha}" styleClass="inputLogin"></h:inputSecret>
				<br>
				<h:commandLink action="recuperarSenha" styleClass="linksLogin"> 
						<h:outputText value="#{bundle.noPassword}"></h:outputText>
					</h:commandLink>
					&nbsp;&nbsp;&nbsp;
					<h:commandLink action="cadastrar Aluno" styleClass="linksLogin">
						<h:outputText value="#{bundle.noLogin}"></h:outputText>
					</h:commandLink><br><br>
				
					<h:commandButton action="#{usuarioBean.logar}" id="logar" value="Login"></h:commandButton>
			<br>
			
			<h:inputText id="alertLogin" style="display:none" value="#{bundle.alertLogin}"></</h:inputText>
			<h:inputText id="alertSenha" style="display:none" value="#{bundle.alertSenha}"></</h:inputText>				
			</h:form>
			</h:panelGroup>
		</h:panelGroup>
		
		<h:panelGroup layout="block" id="rodape" styleClass="rodape">
			<p>dcomp&copy;</p>
  			<!-- end #footer -->
		</h:panelGroup>
  		
	</h:panelGroup>
	
</f:view>
</body>
</html>