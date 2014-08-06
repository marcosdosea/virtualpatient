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
		<h2><h:outputText value="#{bundle.tituloAddCasoClinico}"></h:outputText></h2>
		<br>
		<br>
		
		<fieldset><legend><h:outputText value="#{bundle.intervFarmacIniciais}"></h:outputText></legend> 
		<h:panelGroup id="intervencoesIni" layout="block" styleClass="field">	
		<h:panelGrid border="0" columns="3" columnClasses="columnsCasoClinicoP,columnsCasoClinico2, column3" rowClasses="rowCasoClinicoP">
		
			<h:outputText value=""></h:outputText>
			<h:outputText value="#{bundle.iniciarMedicamento}" style="height:30px" styleClass="headerGridQueixasMed"></h:outputText>
			<h:outputText value="#{bundle.comunicacao}" styleClass="headerGridQueixasMed"></h:outputText>
	
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoIntervencao1etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{casoClinicoBean.descricaoIntervencao1}"></h:outputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencao1}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />		
			</h:selectOneMenu>
			
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoIntervencao2etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{casoClinicoBean.descricaoIntervencao2}"></h:outputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencao2}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />		
			</h:selectOneMenu>
			
			<h:outputText value=""></h:outputText>
			<h:outputText value="#{bundle.modificarFarmacoterapia}" styleClass="headerGridQueixasMed"></h:outputText>
			<h:outputText value=""></h:outputText>
			
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoIntervencao3etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{casoClinicoBean.descricaoIntervencao3}"></h:outputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencao3}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />		
			</h:selectOneMenu>
			
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoIntervencao4etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{casoClinicoBean.descricaoIntervencao4}"></h:outputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencao4}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />		
			</h:selectOneMenu>
			
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoIntervencao5etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{casoClinicoBean.descricaoIntervencao5}"></h:outputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencao5}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />		
			</h:selectOneMenu>
			
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoIntervencao6etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{casoClinicoBean.descricaoIntervencao6}"></h:outputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencao6}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />	
			</h:selectOneMenu>
			
			<h:outputText value=""></h:outputText>
			<h:outputText value="#{bundle.descontinuarFarmacoterapia}" styleClass="headerGridQueixasMed"></h:outputText>
			<h:outputText value=""></h:outputText>
			
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoIntervencao7etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{casoClinicoBean.descricaoIntervencao7}"></h:outputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencao7}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />		
			</h:selectOneMenu>
			
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoIntervencao8etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{casoClinicoBean.descricaoIntervencao8}"></h:outputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencao8}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />		
			</h:selectOneMenu>
			
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoIntervencao9etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{casoClinicoBean.descricaoIntervencao9}"></h:outputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencao9}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />		
			</h:selectOneMenu>
			
			<h:outputText value=""></h:outputText>
			<h:outputText value="#{bundle.educacao}" styleClass="headerGridQueixasMed"></h:outputText>
			<h:outputText value=""></h:outputText>			
			
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoIntervencao10etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{casoClinicoBean.descricaoIntervencao10}"></h:outputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencao10}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />		
			</h:selectOneMenu>
			
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoIntervencao11etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{casoClinicoBean.descricaoIntervencao11}"></h:outputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencao11}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />	
			</h:selectOneMenu>
			
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoIntervencao12etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{casoClinicoBean.descricaoIntervencao12}"></h:outputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencao12}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />		
			</h:selectOneMenu>
			
			<h:outputText value=""></h:outputText>
			<h:outputText value="#{bundle.monitorizacao}" styleClass="headerGridQueixasMed"></h:outputText>
			<h:outputText value=""></h:outputText>	
			
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoIntervencao13etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{casoClinicoBean.descricaoIntervencao13}"></h:outputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencao13}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />	
			</h:selectOneMenu>
			
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoIntervencao14etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{casoClinicoBean.descricaoIntervencao14}"></h:outputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencao14}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />	
			</h:selectOneMenu>
			</h:panelGrid>
			
		<h:panelGrid columns="2" columnClasses="columnsCasoClinico1, column2" rowClasses="rowCasoClinicoP">			
			<h:outputText value="#{bundle.outros}" styleClass="headerGridQueixasMed"></h:outputText>
			<h:outputText value=""></h:outputText>
						
			<h:inputText value="#{casoClinicoBean.descricaoIntervencaoOutro1}" style="width: 250px;" styleClass="field_text"></h:inputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencaoOutro1}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />	
			</h:selectOneMenu>
						
			<h:inputText value="#{casoClinicoBean.descricaoIntervencaoOutro2}" style="width: 250px;" styleClass="field_text"></h:inputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencaoOutro2}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />	
			</h:selectOneMenu>		
			
			<h:inputText value="#{casoClinicoBean.descricaoIntervencaoOutro3}" style="width: 250px;" styleClass="field_text"></h:inputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencaoOutro3}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />	
			</h:selectOneMenu>
			
			<h:inputText value="#{casoClinicoBean.descricaoIntervencaoOutro4}" style="width: 250px;" styleClass="field_text"></h:inputText>
			<h:selectOneMenu value="#{casoClinicoBean.indicacaoIntervencaoOutro4}">
				<f:selectItems value="#{casoClinicoBean.indicacaoItens}" />	
			</h:selectOneMenu>
		</h:panelGrid>
		</h:panelGroup></fieldset>
		<br>
		
		<br><h:commandButton action="#{casoClinicoBean.paginaRefMed}" value="#{bundle.avancar}"></h:commandButton>
	
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