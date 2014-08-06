<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Avaliação da Primeira Consulta</title>
<link href="${pageContext.request.contextPath}/css/favicon.ico"
	rel="shortcut icon" type="image/x-icon" />
<link rel="StyleSheet" type="text/css"
	href="${pageContext.request.contextPath}/css/cssCadastro.css"
	media="screen" />
</head>
<body>
<f:view>
	<h:panelGroup layout="block" id="tudo" styleClass="tudo">
		<h:panelGroup layout="block" id="conteudo" styleClass="conteudo">
			<h:panelGroup layout="block" id="header" styleClass="header">
				<h:graphicImage value="/css/header.PNG" style="border: 0"
					alt="PharmaVP"></h:graphicImage>
			</h:panelGroup>
			<h:panelGroup layout="block" id="wraper" styleClass="wraper">
				<h:panelGroup layout="block" id="mainContent"
					styleClass="mainContent">
					<br>
						<h2>Avaliação da Primeira Consulta</h2>
						<br>
						<br>
					<h:form>
						<fieldset>
						<legend>Avaliação</legend>
						<h:panelGroup layout="block" styleClass="field">
						<h:outputText value="Comentários:"></h:outputText><br>
						<h:inputTextarea
							style="height: 143px; width: 365px;"
							value="" styleClass="field_text"></h:inputTextarea>
						<br>
						<br>
						Nota: <h:inputText  style="width: 50px"></h:inputText>
						<br>
						<br>
						<h:outputText value="Comentários para Aluno:"></h:outputText><br>
						<h:inputTextarea
							style="height: 143px; width: 365px;"
							 styleClass="field_text"></h:inputTextarea>
						<br>
						<br>
						</h:panelGroup>
						</fieldset>
						<p align="center"><h:commandButton
							 value="Correto"></h:commandButton>
						<h:commandButton 
							value="Refazer"></h:commandButton></p>
					</h:form>
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