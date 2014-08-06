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
	
		<br><h2><h:outputText value="#{bundle.revisaoSistQueixasIni}"></h:outputText></h2><br><br>
	<h:panelGroup layout="block" id="queixasIni" styleClass="field">
	
    <h3><h:outputText value="#{bundle.sistGeral}"></h:outputText></h3><br>
	<h:panelGrid  border="0" columns="4" rules="groups"
			columnClasses="column1,columnsCasoClinico2,.column3,column4">
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGeral1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSGeral1}"></h:outputText>
			<h:selectOneRadio id="DAorPRMPA"
				value="#{casoClinicoBean.doencaOuPRMSGeral1}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}  " itemValue="D"
					id="DAPA" />
				<f:selectItem itemLabel="#{bundle.prm}  " itemValue="P" id="PRMPA" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMPerdaDeApetite"
				value="#{casoClinicoBean.nPRMSGeral1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGeral2}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSGeral2}"></h:outputText>
			<h:selectOneRadio id="DAorPRMAP"
				value="#{casoClinicoBean.doencaOuPRMSGeral2}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAAP" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMAP" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMAlteracaoDePeso"
				value="#{casoClinicoBean.nPRMSGeral2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGeral3}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSGeral3}"></h:outputText>
			<h:selectOneRadio id="DAorPRMDor"
				value="#{casoClinicoBean.doencaOuPRMSGeral3}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DADor" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMDores" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDor" value="#{casoClinicoBean.nPRMSGeral3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGeral4}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSGeral4}"></h:outputText>
			<h:selectOneRadio id="DAorPRMTonteira"
				value="#{casoClinicoBean.doencaOuPRMSGeral4}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DATonteira" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMTont" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMTonteira"
				value="#{casoClinicoBean.nPRMSGeral4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGeral5}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSGeral5}"></h:outputText>
			<h:selectOneRadio id="DAorPRMEdema"
				value="#{casoClinicoBean.doencaOuPRMSGeral5}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAEdema" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMEdem" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMEdema" value="#{casoClinicoBean.nPRMSGeral5}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
		</h:panelGrid>
	<br><br><h3><h:outputText value="#{bundle.oonb}"></h:outputText></h3><br>
	<h:panelGrid border="0" columns="4" columnClasses="column1,columnsCasoClinico2,.column3,column4">
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoOONB1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoOONB1}"></h:outputText>
			<h:selectOneRadio id="DAorPRMAV"
				value="#{casoClinicoBean.doencaOuPRMOONB1}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAAV" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMAV" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMAlteracoesVisuais"
				value="#{casoClinicoBean.nPRMOONB1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoOONB2}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoOONB2}"></h:outputText>
			<h:selectOneRadio id="DAorPRMDA"
				value="#{casoClinicoBean.doencaOuPRMOONB2}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DADA" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMDA" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDiminAudicao"
				value="#{casoClinicoBean.nPRMOONB2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoOONB3}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoOONB3}"></h:outputText>
			<h:selectOneRadio id="DAorPRMZO"
				value="#{casoClinicoBean.doencaOuPRMOONB3}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAZO" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMZO" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMZumbido" value="#{casoClinicoBean.nPRMOONB3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoOONB4}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoOONB4}"></h:outputText>
			<h:selectOneRadio id="DAorPRMEpistaxe"
				value="#{casoClinicoBean.doencaOuPRMOONB4}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAEp" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMEp" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMEpistaxe"
				value="#{casoClinicoBean.nPRMOONB4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoOONB5}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoOONB5}"></h:outputText>
			<h:selectOneRadio id="DAorPRMRA"
				value="#{casoClinicoBean.doencaOuPRMOONB5}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DARA" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMRA" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMRiniteAlergica"
				value="#{casoClinicoBean.nPRMOONB5}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoOONB6}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoOONB6}"></h:outputText>
			<h:selectOneRadio id="DAorPRMGl"
				value="#{casoClinicoBean.doencaOuPRMOONB6}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAGl" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMGl" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMGlaucoma"
				value="#{casoClinicoBean.nPRMOONB6}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoOONB7}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoOONB7}"></h:outputText>
			<h:selectOneRadio id="DAorPRMHemoptise"
				value="#{casoClinicoBean.doencaOuPRMOONB7}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAHem" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMHem" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMHemoptise"
				value="#{casoClinicoBean.nPRMOONB7}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
		</h:panelGrid>
		<br><br><h3><h:outputText value="#{bundle.cardiovascular}"></h:outputText></h3><br>
		<h:panelGrid border="0" columns="4" columnClasses="column1,columnsCasoClinico2,.column3,column4">
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoCardio1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoCardio1}"></h:outputText>
			<h:selectOneRadio id="DAorPRMDP"
				value="#{casoClinicoBean.doencaOuPRMCardio1}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DADP" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMDP" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDorNoPeito"
				value="#{casoClinicoBean.nPRMCardio1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoCardio2}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoCardio2}"></h:outputText>
			<h:selectOneRadio id="DAorPRMHiperlipidermia"
				value="#{casoClinicoBean.doencaOuPRMCardio2}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAHiperL" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMHiperL" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMHiperlipidemia"
				value="#{casoClinicoBean.nPRMCardio2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoCardio3}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoCardio3}"></h:outputText>
			<h:selectOneRadio id="DAorPRMHipertensao"
				value="#{casoClinicoBean.doencaOuPRMCardio3}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAHiperT" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMHiperT" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMHipertensao"
				value="#{casoClinicoBean.nPRMCardio3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoCardio4}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoCardio4}"></h:outputText>
			<h:selectOneRadio id="DAorPRMInfarto"
				value="#{casoClinicoBean.doencaOuPRMCardio4}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAInfarto" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMInfarto" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMInfartoDoMiocardio"
				value="#{casoClinicoBean.nPRMCardio4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
		</h:panelGrid>
		<br><br><h3><h:outputText value="#{bundle.pulmonar}"></h:outputText></h3><br>
		<h:panelGrid border="0" columns="4" columnClasses="column1,columnsCasoClinico2,.column3,column4">
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoPulm1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoPulm1}"></h:outputText>
			<h:selectOneRadio id="DAorPRMAsma"
				value="#{casoClinicoBean.doencaOuPRMPulm1}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAAsma" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMASMA" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMAsma" value="#{casoClinicoBean.nPRMPulm1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoPulm2}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoPulm2}"></h:outputText>
			<h:selectOneRadio id="DAorPRMFaltaDeAR"
				value="#{casoClinicoBean.doencaOuPRMPulm2}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAFA" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMFA" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMFaltaDeAr"
				value="#{casoClinicoBean.nPRMPulm2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoPulm3}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoPulm3}"></h:outputText>
			<h:selectOneRadio id="DAorPRMChiado"
				value="#{casoClinicoBean.doencaOuPRMPulm3}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DACH" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMCH" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMChiado" value="#{casoClinicoBean.nPRMPulm3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
	</h:panelGrid>
	<br><br><h3><h:outputText value="#{bundle.tgi}"></h:outputText></h3><br>
	<h:panelGrid border="0" columns="4" columnClasses="column1,columnsCasoClinico2,.column3,column4">
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoTGI1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoTGI1}"></h:outputText>
			<h:selectOneRadio id="DAorPRMQueimacao"
				value="#{casoClinicoBean.doencaOuPRMTGI1}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAQueima" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMQueima" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMQueimacao"
				value="#{casoClinicoBean.nPRMTGI1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoTGI2}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoTGI2}"></h:outputText>
			<h:selectOneRadio id="DAorPRMDorAbdominal"
				value="#{casoClinicoBean.doencaOuPRMTGI2}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DADorA" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMDorA" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDorAbdominal"
				value="#{casoClinicoBean.nPRMTGI2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoTGI3}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoTGI3}"></h:outputText>
			<h:selectOneRadio id="DAorPRMDiarreia"
				value="#{casoClinicoBean.doencaOuPRMTGI3}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DADiarreia" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMdiarreia" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDiarreia" value="#{casoClinicoBean.nPRMTGI3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoTGI4}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoTGI4}"></h:outputText>
			<h:selectOneRadio id="DAorPRMNausea"
				value="#{casoClinicoBean.doencaOuPRMTGI4}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DANausea" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMnausea" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMNausea" value="#{casoClinicoBean.nPRMTGI4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoTGI5}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoTGI5}"></h:outputText>
			<h:selectOneRadio id="DAorPRMConstipacao"
				value="#{casoClinicoBean.doencaOuPRMTGI5}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAConstipacao" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMconstipacao" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMConstipacao"
				value="#{casoClinicoBean.nPRMTGI5}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
	</h:panelGrid>
	<br><br><h3><h:outputText value="#{bundle.sistEndoc}"></h:outputText></h3><br>
	<h:panelGrid border="0" columns="4" columnClasses="column1,columnsCasoClinico2,.column3,column4">
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSEndoc1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSEndoc1}"></h:outputText>
			<h:selectOneRadio id="DAorPRMDiabetes"
				value="#{casoClinicoBean.doencaOuPRMSEndoc1}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DADiabetes" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMdiabetes" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDiabetes"
				value="#{casoClinicoBean.nPRMSEndoc1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSEndoc2}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSEndoc2}"></h:outputText>
			<h:selectOneRadio id="DAorPRMHipotireodismo"
				value="#{casoClinicoBean.doencaOuPRMSEndoc2}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAHipot" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMHipot" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMHipotireodismo"
				value="#{casoClinicoBean.nPRMSEndoc2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSEndoc3}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSEndoc3}"></h:outputText>
			<h:selectOneRadio id="DAorPRMSintMenopausa"
				value="#{casoClinicoBean.doencaOuPRMSEndoc3}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DASM" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMSM" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMSintomasMenopausa"
				value="#{casoClinicoBean.nPRMSEndoc3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
	</h:panelGrid>
	<br><br><h3><h:outputText value="#{bundle.urinario}"></h:outputText></h3><br>
	<h:panelGrid border="0" columns="4" columnClasses="column1,columnsCasoClinico2,.column3,column4">
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSUrin1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSUrin1}"></h:outputText>
			<h:selectOneRadio id="DAorPRMFU"
				value="#{casoClinicoBean.doencaOuPRMSUrin1}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAFU" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMFU" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMFrequenciaUrinaria"
				value="#{casoClinicoBean.nPRMSUrin1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
	</h:panelGrid>
	<br><br><h3><h:outputText value="#{bundle.geniRepro}"></h:outputText></h3><br>
	<h:panelGrid border="0" columns="4" columnClasses="column1,columnsCasoClinico2,.column3,column4">
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGenitRepr1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSGenitRepr1}"></h:outputText>
			<h:selectOneRadio id="DAorPRMDismenorreia"
				value="#{casoClinicoBean.doencaOuPRMSGenitRepr1}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DADismen" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMDismen" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDismenorreia"
				value="#{casoClinicoBean.nPRMSGenitRepr1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGenitRepr2}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSGenitRepr2}"></h:outputText>
			<h:selectOneRadio id="DAorPRMInconti"
				value="#{casoClinicoBean.doencaOuPRMSGenitRepr2}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAInconti" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMInconti" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMIncotinencia"
				value="#{casoClinicoBean.nPRMSGenitRepr2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGenitRepr3}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSGenitRepr3}"></h:outputText>
			<h:selectOneRadio id="DAorPRMImpotencia"
				value="#{casoClinicoBean.doencaOuPRMSGenitRepr3}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAImpot" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMImpot" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMImpotencia"
				value="#{casoClinicoBean.nPRMSGenitRepr3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGenitRepr4}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSGenitRepr4}"></h:outputText>
			<h:selectOneRadio id="DAorPRMDimDesejoSexual"
				value="#{casoClinicoBean.doencaOuPRMSGenitRepr4}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DADDS" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMDDS" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDimDesejoSexual"
				value="#{casoClinicoBean.nPRMSGenitRepr4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGenitRepr5}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSGenitRepr5}"></h:outputText>
			<h:selectOneRadio id="DAorPRMCorrimento"
				value="#{casoClinicoBean.doencaOuPRMSGenitRepr5}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DACV" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMCV" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMCorrimentoVaginal"
				value="#{casoClinicoBean.nPRMSGenitRepr5}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
	</h:panelGrid>
	<br><br><h3><h:outputText value="#{bundle.sintHemato}"></h:outputText></h3><br>
	<h:panelGrid border="0" columns="4" columnClasses="column1,columnsCasoClinico2,.column3,column4">
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSHematop1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSHematop1}"></h:outputText>
			<h:selectOneRadio id="DAorPRMFormExcHematomas"
				value="#{casoClinicoBean.doencaOuPRMSHematop1}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAFEH" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMFEH" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMFormacaoExcessivaHematomas"
				value="#{casoClinicoBean.nPRMSHematop1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSHematop2}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSHematop2}"></h:outputText>
			<h:selectOneRadio id="DAorPRMHemor"
				value="#{casoClinicoBean.doencaOuPRMSHematop2}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAHemor" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMHemor" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMHemorragia"
				value="#{casoClinicoBean.nPRMSHematop2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSHematop3}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSHematop3}"></h:outputText>
			<h:selectOneRadio id="DAorPRMAnemia"
				value="#{casoClinicoBean.doencaOuPRMSHematop3}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAAnem" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMAnem" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMAnemia"
				value="#{casoClinicoBean.nPRMSHematop3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
	</h:panelGrid>
	<br><br><h3><h:outputText value="#{bundle.muscEsq}"></h:outputText></h3><br>
	<h:panelGrid border="0" columns="4" columnClasses="column1,columnsCasoClinico2,.column3,column4">
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoMuscEsq1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoMuscEsq1}"></h:outputText>
			<h:selectOneRadio id="DAorPRMDorNasCostas"
				value="#{casoClinicoBean.doencaOuPRMMuscEsq1}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DADC" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMDC" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDorNasCostas"
				value="#{casoClinicoBean.nPRMMuscEsq1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoMuscEsq2}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoMuscEsq2}"></h:outputText>
			<h:selectOneRadio id="DAorPRMArtrite"
				value="#{casoClinicoBean.doencaOuPRMMuscEsq2}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAArtri" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMArtri" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMArtrite"
				value="#{casoClinicoBean.nPRMMuscEsq2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoMuscEsq3}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoMuscEsq3}"></h:outputText>
			<h:selectOneRadio id="DAorPRMTendinites"
				value="#{casoClinicoBean.doencaOuPRMMuscEsq3}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DATend" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMTend" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMTendinites"
				value="#{casoClinicoBean.nPRMMuscEsq3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoMuscEsq4}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoMuscEsq4}"></h:outputText>
			<h:selectOneRadio id="DAorPRMDorMuscular"
				value="#{casoClinicoBean.doencaOuPRMMuscEsq4}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DADM" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMDM" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDorMuscular"
				value="#{casoClinicoBean.nPRMMuscEsq4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
	</h:panelGrid>
	<br><br><h3><h:outputText value="#{bundle.sistNervoso}"></h:outputText>o</h3><br>
	<h:panelGrid border="0" columns="4" columnClasses="column1,columnsCasoClinico2,.column3,column4">
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSNervoso1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSNervoso1}"></h:outputText>
			<h:selectOneRadio id="DAorPRMParestesia"
				value="#{casoClinicoBean.doencaOuPRMSNervoso1}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAParest" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMParest" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMParestesia"
				value="#{casoClinicoBean.nPRMSNervoso1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSNervoso2}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSNervoso2}"></h:outputText>
			<h:selectOneRadio id="DAorPRMTremor"
				value="#{casoClinicoBean.doencaOuPRMSNervoso2}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DATrem" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMTrem" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMTremor"
				value="#{casoClinicoBean.nPRMSNervoso2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSNervoso3}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSNervoso3}"></h:outputText>
			<h:selectOneRadio id="DAorPRMPerdaDeEquilibrio"
				value="#{casoClinicoBean.doencaOuPRMSNervoso3}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAPerdaDeEquilibrio" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMPerdaDeEq" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMPerdaDeEquilibrio"
				value="#{casoClinicoBean.nPRMSNervoso3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSNervoso4}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSNervoso4}"></h:outputText>
			<h:selectOneRadio id="DAorPRMDepressao"
				value="#{casoClinicoBean.doencaOuPRMSNervoso4}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DADepre" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMDepre" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDepressao"
				value="#{casoClinicoBean.nPRMSNervoso4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSNervoso5}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSNervoso5}"></h:outputText>
			<h:selectOneRadio id="DAorPRMSuicidio"
				value="#{casoClinicoBean.doencaOuPRMSNervoso5}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DASuic" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMSuic" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMSuicidio"
				value="#{casoClinicoBean.nPRMSNervoso5}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSNervoso6}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSNervoso6}"></h:outputText>
			<h:selectOneRadio id="DAorPRMAnsiedade"
				value="#{casoClinicoBean.doencaOuPRMSNervoso6}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAAN" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMAN" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMAnsiedade"
				value="#{casoClinicoBean.nPRMSNervoso6}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSNervoso7}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoSNervoso7}"></h:outputText>
			<h:selectOneRadio id="DAorPRMPerdaDeMemoria"
				value="#{casoClinicoBean.doencaOuPRMSNervoso7}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAPM" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMPM" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMPerdaDeMemoria"
				value="#{casoClinicoBean.nPRMSNervoso7}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
	</h:panelGrid>
	<br><br><h3><h:outputText value="#{bundle.pele}"></h:outputText></h3><br>
	<h:panelGrid border="0" columns="4" columnClasses="column1,columnsCasoClinico2,.column3,column4">
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoPele1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoPele1}"></h:outputText>
			<h:selectOneRadio id="DAorPRMEczema"
				value="#{casoClinicoBean.doencaOuPRMPele1}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAEcz" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMEcz" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMEczema" value="#{casoClinicoBean.nPRMPele1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoPele2}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoPele2}"></h:outputText>
			<h:selectOneRadio id="DAorPRMPrurido"
				value="#{casoClinicoBean.doencaOuPRMPele2}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAPru" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMPru" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMPrurido" value="#{casoClinicoBean.nPRMPele2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoPele3}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoPele3}"></h:outputText>
			<h:selectOneRadio id="DAorPRMRash"
				value="#{casoClinicoBean.doencaOuPRMPele3}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DArash" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMrsh" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMRash" value="#{casoClinicoBean.nPRMPele3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
	</h:panelGrid>
	<br><br><h3><h:outputText value="#{bundle.doencasInfec}"></h:outputText></h3><br>
	<h:panelGrid border="0" columns="4" columnClasses="column1,columnsCasoClinico2,.column3,column4">
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoDoencInfec1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoDoencInfec1}"></h:outputText>
			<h:selectOneRadio id="DAorPRMMalaria"
				value="#{casoClinicoBean.doencaOuPRMDoencInfec1}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAMalar" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMMalar" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMMalaria"
				value="#{casoClinicoBean.nPRMDoencInfec1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoDoencInfec2}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoDoencInfec2}"></h:outputText>
			<h:selectOneRadio id="DAorPRMSifilis"
				value="#{casoClinicoBean.doencaOuPRMDoencInfec2}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DASif" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMSif" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMSifilis"
				value="#{casoClinicoBean.nPRMDoencInfec2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoDoencInfec3}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoDoencInfec3}"></h:outputText>
			<h:selectOneRadio id="DAorPRMHPV"
				value="#{casoClinicoBean.doencaOuPRMDoencInfec3}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAHpv" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMHpvv" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMHPV"
				value="#{casoClinicoBean.nPRMDoencInfec3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoDoencInfec4}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoDoencInfec4}"></h:outputText>
			<h:selectOneRadio id="DAorPRMGonorreia"
				value="#{casoClinicoBean.doencaOuPRMDoencInfec4}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAGono" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMGono" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMGonorreia"
				value="#{casoClinicoBean.nPRMDoencInfec4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoDoencInfec5}"></h:selectBooleanCheckbox>
			<h:outputText value="#{bundle.descricaoDoencInfec5}"></h:outputText>
			<h:selectOneRadio id="DAorPRMHerpes"
				value="#{casoClinicoBean.doencaOuPRMDoencInfec5}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D"
					id="DAHerp" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" id="PRMHerp" />
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMHerpes"
				value="#{casoClinicoBean.nPRMDoencInfec5}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
		</h:panelGrid>
		
		<br><br><h3><h:outputText value="#{bundle.outros}"></h:outputText></h3><br>
		<h:panelGrid border="0" columns="3" columnClasses="columnsCasoClinico1, column2, column3">
			<h:inputText value="#{casoClinicoBean.descricaoOutro1}" style="width:250px;" styleClass="field_text">
			</h:inputText>
			<h:selectOneRadio value="#{casoClinicoBean.doencaOuPRMOutro1}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" />
			</h:selectOneRadio>
			<h:selectOneMenu value="#{casoClinicoBean.nPRMOutro1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			
			<h:inputText value="#{casoClinicoBean.descricaoOutro2}" style="width:250px;" styleClass="field_text">
			</h:inputText>
			<h:selectOneRadio value="#{casoClinicoBean.doencaOuPRMOutro2}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" />
			</h:selectOneRadio>
			<h:selectOneMenu value="#{casoClinicoBean.nPRMOutro2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			
			<h:inputText value="#{casoClinicoBean.descricaoOutro3}" style="width:250px;" styleClass="field_text">
			</h:inputText>
			<h:selectOneRadio value="#{casoClinicoBean.doencaOuPRMOutro3}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" />
			</h:selectOneRadio>
			<h:selectOneMenu value="#{casoClinicoBean.nPRMOutro3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
			
			<h:inputText value="#{casoClinicoBean.descricaoOutro4}" style="width:250px;" styleClass="field_text">
			</h:inputText>
			<h:selectOneRadio value="#{casoClinicoBean.doencaOuPRMOutro4}">
				<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D" />
				<f:selectItem itemLabel="#{bundle.prm}" itemValue="P" />
			</h:selectOneRadio>
			<h:selectOneMenu value="#{casoClinicoBean.nPRMOutro4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}" />
			</h:selectOneMenu>
		
		</h:panelGrid>
		
		<h:commandButton action="#{casoClinicoBean.pagina3}" value="#{bundle.avancar}"></h:commandButton>
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