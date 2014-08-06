<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%><%@taglib
	uri="http://java.sun.com/jsf/core" prefix="f"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PharmaVP</title>
<link href="${pageContext.request.contextPath}/css/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link rel="StyleSheet" type="text/css" href="${pageContext.request.contextPath}/css/cssCadastro.css"  media="screen" />
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
			
			<h:panelGroup id="alocarAlunos" layout="block" styleClass="field">	
				<h:dataTable border="1" value="#{cadastrarTurmaBean.listaAux}" var="currentAluno"
					styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
					<h:column id="column1">
						<f:facet name="header">
							<h:outputText value="#{bundle.nome2}"></h:outputText>
						</f:facet>
						<h:outputText value="#{currentAluno.nome}"></h:outputText>
					</h:column>
					<h:column id="column2">
						<f:facet name="header">
							<h:outputText value="#{bundle.matricula2}"></h:outputText>
						</f:facet>
						<h:outputText value="#{currentAluno.matricula}"></h:outputText>
					</h:column>
					<h:column id="column3">
						<f:facet name="header">
							<h:outputText value="#{bundle.turma}"></h:outputText>
						</f:facet>
						<h:selectOneMenu value="#{currentAluno.turma}" >
							<f:selectItems value="#{cadastrarTurmaBean.listaTurmaStr}"/>
						</h:selectOneMenu>
					</h:column>		
				</h:dataTable>
				<br>
				<h:commandButton value="OK!" action="#{cadastrarTurmaBean.alocarAlunos}"></h:commandButton>
			</h:panelGroup>
					
			
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