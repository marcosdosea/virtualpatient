<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<h:form>
	<h:panelGroup layout="block" id="tudo" styleClass="tudo">
		<h:panelGroup layout="block" id="conteudo" styleClass="conteudo">
			<h:panelGroup layout="block" id="header" styleClass="header">
			    <h:panelGroup>	
			    <h:commandLink action="#{usuarioBean.retornarMenu}" style="color: white; padding-right:10px;" immediate="true">
					<h:graphicImage value="/css/header.PNG" style="border: 0" alt="PharmaVP"></h:graphicImage>		
				</h:commandLink>
				</h:panelGroup>
				<h:panelGroup layout="block" style="text-align: right;">
					<h:commandLink action="#{usuarioBean.sair}" style="color: white; padding-right:10px;" immediate="true">
						<h:outputText value="#{bundle.sair}"></h:outputText>
				    </h:commandLink>	
			    </h:panelGroup>		
			</h:panelGroup>
			<h:panelGroup layout="block" id="wraper" styleClass="wraper">
				<h:panelGroup layout="block" id="mainContent" styleClass="mainContent">
		
		<br><h2><h:outputText value="#{bundle.cadastroTutores}"></h:outputText></h2><br><br>
		<h:panelGrid border="0" columns="2">
			<h:outputText value="#{bundle.login}"></h:outputText>
			<h:inputText value="#{tutorBean.login}"></h:inputText>
			<h:outputText value="#{bundle.password}"></h:outputText>
			<h:inputSecret value="#{tutorBean.senha}"></h:inputSecret>
			<h:outputText value="#{bundle.senhaDois}"></h:outputText>
			<h:inputSecret value="#{tutorBean.senhaTeste}"></h:inputSecret>			
			<h:outputText value="#{bundle.nome}"></h:outputText>
			<h:inputText value="#{tutorBean.nome}"></h:inputText>
			<h:outputText value="#{bundle.email}"></h:outputText>
			<h:inputText value="#{tutorBean.email}"></h:inputText>
		</h:panelGrid>
		<br>
		<h:commandButton action="#{tutorBean.add}" value="#{bundle.enviar}"></h:commandButton>
		
	</h:panelGroup>
			</h:panelGroup>
			<h:panelGroup layout="block" id="clear" styleClass="clear">
			</h:panelGroup>
		</h:panelGroup>
		<h:panelGroup layout="block" id="footer" styleClass="footer">
			<p>dcomp&copy;</p>
		</h:panelGroup>
	</h:panelGroup>
</h:form>
</f:view>
</body>
</html>