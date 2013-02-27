<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
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
				<h:panelGroup layout="block" id="mainContent"
					styleClass="mainContent">
					
					<big><b><h:outputText value="#{bundle.opcao3}"></h:outputText></b></big><br/>
					<br>
					<h:panelGrid border="0" columns="2" style="width: 508px">
						<h:outputText value="#{bundle.descricao}:"></h:outputText>
							<h:inputText value="#{opcoesBean.descricao}"></h:inputText>
					</h:panelGrid>
					<br>
					<h:commandButton value="#{bundle.bntAdicionar}"
							action="#{opcoesBean.addExperienciaMedicamentos1}"></h:commandButton>
							
					<br><br>
									
					<h:selectOneMenu value="teste">
						<f:selectItems value="#{opcoesBean.listaExperienciaMedicamentos1}" />
					</h:selectOneMenu>
					<br><br>
					<a href="adicionarOpcoes.jsp">
							<h:outputText value="#{bundle.voltar}"></h:outputText></a>
					
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