<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PharmaVP</title>
<link href="${pageContext.request.contextPath}/css/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link rel="StyleSheet" type="text/css" href="${pageContext.request.contextPath}/css/cssAnalise.css"  media="screen" />
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
		<h:panelGroup layout="block" id="sidebar" styleClass="sidebar">
			<h:graphicImage value="#{respostaDoAluno4Bean.respostaAnterior.consulta.fkCasoClinico.fotoFileName}"></h:graphicImage>
			<br>
			<h:outputText value="#{bundle.casoInicial} " style="font-weight: bold;" ></h:outputText>
			<h:outputText value="#{respostaDoAluno4Bean.respostaAnterior.consulta.fkCasoClinico.relatoDeCasoPrimeiraConsulta}"/>
			<br><br>
			<h:outputText value="#{bundle.casoEvolucao} " style="font-weight: bold;" ></h:outputText>
			<h:outputText value="#{respostaDoAluno4Bean.respostaAnterior.consulta.fkCasoClinico.relatoDeCasoSegundaConsulta}"/>
			<br><br>
			<h:outputText value="#{bundle.casoEvolucao3} " style="font-weight: bold;" ></h:outputText>		
			<h:outputText value="#{respostaDoAluno4Bean.respostaAnterior.consulta.fkCasoClinico.relatoDeCasoTerceiraConsulta}"></h:outputText>
			<br><br>
			<h:outputText value="#{bundle.casoEvolucao4} " style="font-weight: bold;" ></h:outputText>		
			<h:outputText value="#{respostaDoAluno4Bean.respostaAnterior.consulta.fkCasoClinico.relatoDeCasoQuartaConsulta}"></h:outputText>
		</h:panelGroup>
	    <h:panelGroup layout="block" id="wraper" styleClass="wraper">				
		<h:panelGroup layout="block" id="mainContent" styleClass="mainContent">			
		
		<br>
		<h:outputText value="#{bundle.comentariosTutor}" style="font-weight: bold"></h:outputText>
		<br>
		<h:outputText value="#{respostaDoAluno4Bean.respostaAnterior.comentarioAluno}"></h:outputText>
		<br><br>	
		
		<fieldset>		
		<h:panelGroup id="dr" layout="block" styleClass="field">	
			<h:panelGrid border="1" columns="3" styleClass="dataTables" headerClass="headerDataTable" rowClasses="headerDataTable,odd, even,odd, even,odd, even,odd, even">
				<h:outputText value="-----" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
				
				<h:outputText value="#{bundle.nomeDr}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{respostaDoAluno4Bean.respostaAnterior.consulta.fkCasoClinico.nomeDr}"/>
				<h:outputText value="#{respostaDoAluno4Bean.respostaAnterior.nomeDr}"></h:outputText>
				
				<h:outputText value="#{bundle.telPaciente}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{respostaDoAluno4Bean.respostaAnterior.consulta.fkCasoClinico.telefone}"/>
				<h:outputText value="#{respostaDoAluno4Bean.respostaAnterior.telefone}"></h:outputText>
				
			</h:panelGrid>						
		</h:panelGroup>
		</fieldset>
		<br>	
			
		<fieldset>
		<legend><h:outputText value="#{bundle.motivosRef}"></h:outputText></legend> 
		<h:panelGroup id="motivosRef" layout="block" styleClass="field">			
			<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
			<br><br>
			<h:inputTextarea style="height: 140px" readonly="true"
				value="#{respostaDoAluno4Bean.respostaAnterior.consulta.fkCasoClinico.motivosRefMedica}"
				styleClass="field_text">
			</h:inputTextarea>
			<br><br>
			<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
			<br><br>
			<h:inputTextarea style="height: 140px" readonly="true"
				value="#{respostaDoAluno4Bean.respostaAnterior.motivosRefMedica}"
				styleClass="field_text">
			</h:inputTextarea>			
		</h:panelGroup>
		</fieldset>	
		<br>	
			
		<fieldset>		
		<legend><h:outputText value="#{bundle.alternativas}"></h:outputText></legend> 
		<h:panelGroup id="alternativas" layout="block" styleClass="field">	
			<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
			<br><br>
			1: <h:inputTextarea style="height: 140px" readonly="true"
				value="#{respostaDoAluno4Bean.respostaAnterior.consulta.fkCasoClinico.alternativaRefMed1}"
				styleClass="field_text">
			</h:inputTextarea>
			<br><br>
			2: <h:inputTextarea style="height: 140px" readonly="true"
				value="#{respostaDoAluno4Bean.respostaAnterior.consulta.fkCasoClinico.alternativaRefMed2}"
				styleClass="field_text">
			</h:inputTextarea>
			<br><br>
			<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
			<br><br>
			1: <h:inputTextarea style="height: 140px" readonly="true"
				value="#{respostaDoAluno4Bean.respostaAnterior.alternativaRefMed1}"
				styleClass="field_text">
			</h:inputTextarea>
			<br><br>
			2: <h:inputTextarea style="height: 140px" readonly="true"
				value="#{respostaDoAluno4Bean.respostaAnterior.alternativaRefMed2}"
				styleClass="field_text">
			</h:inputTextarea>		
		</h:panelGroup>
		</fieldset>	
		<br>	
		
		<fieldset>		
		<legend><h:outputText value="#{bundle.referencias}"></h:outputText></legend> 
		<h:panelGroup id="referencias" layout="block" styleClass="field">	
			<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
			<br><br>
			<h:inputTextarea style="height: 140px" readonly="true"
				value="#{respostaDoAluno4Bean.respostaAnterior.consulta.fkCasoClinico.referencias}"
				styleClass="field_text">
			</h:inputTextarea>
			<br><br>
			<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
			<br><br>
			<h:inputTextarea style="height: 140px" readonly="true"
				value="#{respostaDoAluno4Bean.respostaAnterior.referencias}"
				styleClass="field_text">
			</h:inputTextarea>
		</h:panelGroup>
		</fieldset>	
							
		
		<br><br>			
		<a href="menuAluno.jsp">
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