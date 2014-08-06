<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%> 
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PharmaVP</title>
<link href="${pageContext.request.contextPath}/css/favicon.ico" rel="shortcut icon" type="image/x-icon" />
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
	
	
		<br>
		<h2><h:outputText value="#{bundle.tituloRefConsultaMedica}"></h:outputText></h2>
		<br>
		<br>
		
		<h:panelGroup id="saudacao" layout="block" styleClass="field">	
			<h:outputText value="#{bundle.exmo}"></h:outputText>
			<br>
			<h:inputText id="nomeDr" value="#{casoClinicoBean.nomeDr}" styleClass="field_text"></h:inputText>	
			<br><br>
			<h:outputText value="#{bundle.textoSaudacao}"></h:outputText>
			<br>					
		</h:panelGroup>
		<br>
		
		<fieldset>
		<legend><h:outputText value="#{bundle.identificPaciente}"></h:outputText></legend> 
		<h:panelGroup id="identificacaoPaciente" layout="block" styleClass="field">	
			<h:outputText value="#{bundle.nome}"></h:outputText>
			<br>
			<h:inputText id="nome" value="#{casoClinicoBean.nome}" 
				styleClass="field_text"></h:inputText>
			<br>
			<h:outputText value="#{bundle.dataNasc}"></h:outputText>
			<br>
			<h:inputText id="dataNasc" value="#{casoClinicoBean.dataNascimentoAuxiliar}" 
				styleClass="field_text" ></h:inputText>
			<br>
			<h:outputText value="#{bundle.telefone}:"></h:outputText>
			<br>
			<h:inputText id="telefone" value="#{casoClinicoBean.telefone}" styleClass="field_text"></h:inputText>	
			<br>						
		</h:panelGroup>
		</fieldset>
		<br>		
		
		<fieldset>
		<legend><h:outputText value="#{bundle.motivosRef}"></h:outputText></legend>
		<h:panelGroup id="motivos" layout="block" styleClass="field">	
			<h:inputTextarea id="motivosRefMedica" style="height: 140px"
				value="#{casoClinicoBean.motivosRefMedica}" styleClass="field_text"></h:inputTextarea>
			<br>	
		</h:panelGroup>
		</fieldset>
		<br>
		
		<h:panelGroup id="alternativas" layout="block" styleClass="field">	
			<h:outputText value="#{bundle.textoAlternativas}"></h:outputText>
			<br><br>
			<h:panelGrid border="1" columns="2" columnClasses="refMedAlternativasC1, refMedAlternativasC2">
				<h:outputText value="( )"></h:outputText>
				<h:inputTextarea id="alternativaRefMed1" style="height: 140px"
					value="#{casoClinicoBean.alternativaRefMed1}" styleClass="field_text"></h:inputTextarea>				
				<h:outputText value="( )"></h:outputText>
				<h:inputTextarea id="alternativaRefMed2" style="height: 140px"
					value="#{casoClinicoBean.alternativaRefMed2}" styleClass="field_text"></h:inputTextarea>	
				<h:outputText value="Outro ( )"></h:outputText>
				<h:inputTextarea disabled="true" style="height: 140px; width:100%;" value="" ></h:inputTextarea>				
			</h:panelGrid>
		</h:panelGroup>
		<br>
		
		<h:panelGroup id="assinatura" layout="block" styleClass="field">	
			<h:outputText value="#{bundle.textoAssCarimbo}"></h:outputText>
			<br><br><br>		
			<h:outputText value="#{bundle.assMedico}:"></h:outputText>&nbsp;&nbsp;
			<h:outputText value="_____________________________________________"></h:outputText> &nbsp;&nbsp;&nbsp;
			
			<h:outputText value="#{bundle.data}:"></h:outputText>
			<h:outputText value="  __/__/____"></h:outputText>	
			<br><br>
			<h:outputText value="#{bundle.carimboMedico}:"></h:outputText>
			<br><br><br>				
		</h:panelGroup>
		<br>
		
		<h:panelGroup id="agradecimentos" layout="block" styleClass="field">
			<h:outputText value="#{bundle.textoAgradecimento}"></h:outputText>
			<br>
			<h:outputText value="#{bundle.textoCumprimento}"></h:outputText>
			<br><br>
			<h:outputText value="#{bundle.farmaceutico}: "></h:outputText>
			<h:inputText value="" styleClass="field_text" disabled="true"></h:inputText>
			<br>
			<h:outputText value="#{bundle.crf}: "></h:outputText>
			<h:inputText value="" styleClass="field_text" disabled="true"></h:inputText>
			<br>
			<h:outputText value="#{bundle.telefone}: "></h:outputText>
			<h:inputText value="" styleClass="field_text" disabled="true"></h:inputText>			
		</h:panelGroup>		
		<br>
		
		<fieldset>	
		<legend><h:outputText value="#{bundle.referencias}"></h:outputText></legend>
		<h:panelGroup id="ref" layout="block" styleClass="field">
			<h:inputTextarea id="referencias" style="height: 140px"
				value="#{casoClinicoBean.referencias}" styleClass="field_text"></h:inputTextarea>
			<br>	
		</h:panelGroup>	
		</fieldset>	
		<br>
		
				
		<br><h:commandButton action="#{casoClinicoBean.pagina5}" value="#{bundle.avancar}"></h:commandButton>
	
	
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