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
		    <h:commandLink action="#{usuarioBean.retornarMenu}" style="color: white; padding-right:10px;">
				<h:graphicImage value="/css/header.PNG" style="border: 0" alt="PharmaVP"></h:graphicImage>		
			</h:commandLink>
			</h:panelGroup>
			<h:panelGroup layout="block" style="text-align: right;">
				<h:commandLink action="#{usuarioBean.sair}" style="color: white; padding-right:10px;">
					<h:outputText value="#{bundle.sair}"></h:outputText>
			    </h:commandLink>	
		    </h:panelGroup>		
		</h:panelGroup>
		<h:panelGroup layout="block" id="wraper" styleClass="wraper">
			<h:panelGroup layout="block" id="mainContent" styleClass="mainContent">
				
			<br><h2><h:outputText value="#{bundle.tituloSatisfacao}"></h:outputText></h2><br><br>
			<h:panelGroup layout="block" styleClass="field">
			
				<h:outputText value="#{bundle.questao20}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao20}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa20}"></h:inputTextarea>
								
				<br><br>
				<h:outputText value="#{bundle.questao21}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao21}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa21}"></h:inputTextarea>
				
				<br><br>
				<h:outputText value="#{bundle.questao22}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao22}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa22}"></h:inputTextarea>				
						
				<br><br>
				<h:outputText value="#{bundle.questao23}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao23}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa23}"></h:inputTextarea>		
						
				<br><br>
				<h:outputText value="#{bundle.questao24}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao24}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa24}"></h:inputTextarea>		
							
								
				<br><br>
				<h:outputText value="#{bundle.questao25}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao25}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa25}"></h:inputTextarea>
								
				
				<br><br>
				<h:outputText value="#{bundle.questao26}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao26}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa26}"></h:inputTextarea>				
				
				<br><br>
				<h:outputText value="#{bundle.questao27}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao27}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa27}"></h:inputTextarea>	
					
				
				<br><br>
				<h:outputText value="#{bundle.questao28}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao28}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa28}"></h:inputTextarea>
						
						
				<br><br>
				<h:outputText value="#{bundle.questao29}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao29}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa29}"></h:inputTextarea>		
						
				<br><br>
				<h:outputText value="#{bundle.questao30}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao30}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa30}"></h:inputTextarea>		
						
						
				<br><br>
				<h:outputText value="#{bundle.questao31}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao31}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa31}"></h:inputTextarea>				
				
				<br><br>
				<h:outputText value="#{bundle.questao32}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao32}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa32}"></h:inputTextarea>				
						
				<br><br>
				<h:outputText value="#{bundle.questao33}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao33}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa33}"></h:inputTextarea>				
					
				<br><br>
				<h:outputText value="#{bundle.questao34}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao34}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa34}"></h:inputTextarea>			
						
						
				<br><br>
				<h:outputText value="#{bundle.questao35}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao35}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa35}"></h:inputTextarea>
				
								
				<br><br>
				<h:outputText value="#{bundle.questao36}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao36}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa36}"></h:inputTextarea>		
								
				
				<br><br>
				<h:outputText value="#{bundle.questao37}" style="font-weight: bold; width: 90%;"></h:outputText>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao37}">
					<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
				</h:selectOneMenu>
				<br><br>
				&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
				<br>
				&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
								value="#{respostaQuestionarioBean.justificativa37}"></h:inputTextarea>						
						
				<br><br>
					
				<h:commandButton action="#{respostaQuestionarioBean.salvarSatisfacao}" value="#{bundle.salvar}"></h:commandButton>		
						
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
</f:view></body>
</html>