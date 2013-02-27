<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<f:view>
	<h:form>
	<br>Revisão de Sistemas:<br><br><br>Sistema geral:
	<h:panelGrid border="0" columns="4" rules="groups" columnClasses="column1,column2,column3,column4" >
		<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGeral1}"></h:selectBooleanCheckbox>
		<h:outputText value="Perda de apetite"></h:outputText>
			<h:selectOneRadio id="DAorPRMPA" value="#{casoClinicoBean.doencaOuPRMSGeral1}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAPA"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMPA"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMPerdaDeApetite" value="#{casoClinicoBean.nPRMSGeral1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGeral2}"></h:selectBooleanCheckbox>
			<h:outputText value="Alteração de peso"></h:outputText>
			<h:selectOneRadio id="DAorPRMAP" value="#{casoClinicoBean.doencaOuPRMSGeral2}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAAP"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMAP"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMAlteracaoDePeso" value="#{casoClinicoBean.nPRMSGeral2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGeral3}"></h:selectBooleanCheckbox>
			<h:outputText value="Dor"></h:outputText>
			<h:selectOneRadio id="DAorPRMDor" value="#{casoClinicoBean.doencaOuPRMSGeral3}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DADor"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMDores"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDor" value="#{casoClinicoBean.nPRMSGeral3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGeral4}"></h:selectBooleanCheckbox>
			<h:outputText value="Tonteira (Vertigem)"></h:outputText>
			<h:selectOneRadio id="DAorPRMTonteira" value="#{casoClinicoBean.doencaOuPRMSGeral4}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DATonteira"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMTont"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMTonteira" value="#{casoClinicoBean.nPRMSGeral4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGeral5}"></h:selectBooleanCheckbox>
			<h:outputText value="Edema"></h:outputText>
			<h:selectOneRadio id="DAorPRMEdema" value="#{casoClinicoBean.doencaOuPRMSGeral5}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAEdema"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMEdem"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMEdema" value="#{casoClinicoBean.nPRMSGeral5}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
		</h:panelGrid>
		<br>OONB:
	<h:panelGrid border="0" columns="4">
		<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoOONB1}"></h:selectBooleanCheckbox>
		<h:outputText value="Alterações visuais"></h:outputText>
			<h:selectOneRadio id="DAorPRMAV" value="#{casoClinicoBean.doencaOuPRMOONB1}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAAV"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMAV"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMAlteracoesVisuais" value="#{casoClinicoBean.nPRMOONB1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoOONB2}"></h:selectBooleanCheckbox>
			<h:outputText value="Diminuição da audição"></h:outputText>
			<h:selectOneRadio id="DAorPRMDA" value="#{casoClinicoBean.doencaOuPRMOONB2}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DADA"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMDA"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDiminAudicao" value="#{casoClinicoBean.nPRMOONB2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoOONB3}"></h:selectBooleanCheckbox>
			<h:outputText value="Zumbido no ouvido"></h:outputText>
			<h:selectOneRadio id="DAorPRMZO" value="#{casoClinicoBean.doencaOuPRMOONB3}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAZO"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMZO"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMZumbido" value="#{casoClinicoBean.nPRMOONB3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoOONB4}"></h:selectBooleanCheckbox>
			<h:outputText value="Epistaxe"></h:outputText>
			<h:selectOneRadio id="DAorPRMEpistaxe" value="#{casoClinicoBean.doencaOuPRMOONB4}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAEp"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMEp"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMEpistaxe" value="#{casoClinicoBean.nPRMOONB4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoOONB5}"></h:selectBooleanCheckbox>
			<h:outputText value="Rinite alérgica"></h:outputText>
			<h:selectOneRadio id="DAorPRMRA" value="#{casoClinicoBean.doencaOuPRMOONB5}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DARA"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMRA"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMRiniteAlergica" value="#{casoClinicoBean.nPRMOONB5}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoOONB6}"></h:selectBooleanCheckbox>
			<h:outputText value="Glaucoma"></h:outputText>
			<h:selectOneRadio id="DAorPRMGl" value="#{casoClinicoBean.doencaOuPRMOONB6}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAGl"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMGl"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMGlaucoma" value="#{casoClinicoBean.nPRMOONB6}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoOONB7}"></h:selectBooleanCheckbox>
			<h:outputText value="Hemoptise"></h:outputText>
			<h:selectOneRadio id="DAorPRMHemoptise" value="#{casoClinicoBean.doencaOuPRMOONB7}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAHem"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMHem"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMHemoptise" value="#{casoClinicoBean.nPRMOONB7}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
		</h:panelGrid>
		<br>Cardiovascular:
		<h:panelGrid border="0" columns="4">
		<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoCardio1}"></h:selectBooleanCheckbox>
		<h:outputText value="Dor no peito"></h:outputText>
			<h:selectOneRadio id="DAorPRMDP" value="#{casoClinicoBean.doencaOuPRMCardio1}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DADP"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMDP"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDorNoPeito" value="#{casoClinicoBean.nPRMCardio1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoCardio2}"></h:selectBooleanCheckbox>
			<h:outputText value="Hiperlipidemia"></h:outputText>
			<h:selectOneRadio id="DAorPRMHiperlipidermia" value="#{casoClinicoBean.doencaOuPRMCardio2}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAHiperL"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMHiperL"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMHiperlipidemia" value="#{casoClinicoBean.nPRMCardio2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoCardio3}"></h:selectBooleanCheckbox>
			<h:outputText value="Hipertensão"></h:outputText>
			<h:selectOneRadio id="DAorPRMHipertensao" value="#{casoClinicoBean.doencaOuPRMCardio3}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAHiperT"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMHiperT"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMHipertensao" value="#{casoClinicoBean.nPRMCardio3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoCardio4}"></h:selectBooleanCheckbox>
			<h:outputText value="Infarto do miocárdio"></h:outputText>
			<h:selectOneRadio id="DAorPRMInfarto" value="#{casoClinicoBean.doencaOuPRMCardio4}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAInfarto"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMInfarto"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMInfartoDoMiocardio" value="#{casoClinicoBean.nPRMCardio4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
		</h:panelGrid>
		<br>Pulmonar:
		<h:panelGrid border="0" columns="4">
		<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoPulm1}"></h:selectBooleanCheckbox>
		<h:outputText value="Asma"></h:outputText>
			<h:selectOneRadio id="DAorPRMAsma" value="#{casoClinicoBean.doencaOuPRMPulm1}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAAsma"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMASMA"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMAsma" value="#{casoClinicoBean.nPRMPulm1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoPulm2}"></h:selectBooleanCheckbox>
			<h:outputText value="Falta de ar"></h:outputText>
			<h:selectOneRadio id="DAorPRMFaltaDeAR" value="#{casoClinicoBean.doencaOuPRMPulm2}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAFA"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMFA"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMFaltaDeAr" value="#{casoClinicoBean.nPRMPulm2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoPulm3}"></h:selectBooleanCheckbox>
			<h:outputText value="Chiado"></h:outputText>
			<h:selectOneRadio id="DAorPRMChiado" value="#{casoClinicoBean.doencaOuPRMPulm3}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DACH"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMCH"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMChiado" value="#{casoClinicoBean.nPRMPulm3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
		</h:panelGrid>
		<br>TGI:
	<h:panelGrid border="0" columns="4">
		<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoTGI1}"></h:selectBooleanCheckbox>
		<h:outputText value="Queimação"></h:outputText>
			<h:selectOneRadio id="DAorPRMQueimacao" value="#{casoClinicoBean.doencaOuPRMTGI1}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAQueima"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMQueima"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMQueimacao" value="#{casoClinicoBean.nPRMTGI1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoTGI2}"></h:selectBooleanCheckbox>
			<h:outputText value="Dor abdominal"></h:outputText>
			<h:selectOneRadio id="DAorPRMDorAbdominal" value="#{casoClinicoBean.doencaOuPRMTGI2}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DADorA"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMDorA"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDorAbdominal" value="#{casoClinicoBean.nPRMTGI2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoTGI3}"></h:selectBooleanCheckbox>
			<h:outputText value="Diarréia"></h:outputText>
			<h:selectOneRadio id="DAorPRMDiarreia" value="#{casoClinicoBean.doencaOuPRMTGI3}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DADiarreia"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMdiarreia"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDiarreia" value="#{casoClinicoBean.nPRMTGI3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoTGI4}"></h:selectBooleanCheckbox>
			<h:outputText value="Nausea"></h:outputText>
			<h:selectOneRadio id="DAorPRMNausea" value="#{casoClinicoBean.doencaOuPRMTGI4}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DANausea"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMnausea"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMNausea" value="#{casoClinicoBean.nPRMTGI4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoTGI5}"></h:selectBooleanCheckbox>
			<h:outputText value="Constipação"></h:outputText>
			<h:selectOneRadio id="DAorPRMConstipacao" value="#{casoClinicoBean.doencaOuPRMTGI5}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAConstipacao"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMconstipacao"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMConstipacao" value="#{casoClinicoBean.nPRMTGI5}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
		</h:panelGrid>
		<br>Sistema endócrino:
	<h:panelGrid border="0" columns="4">
		<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSEndoc1}"></h:selectBooleanCheckbox>
		<h:outputText value="Diabetes"></h:outputText>
			<h:selectOneRadio id="DAorPRMDiabetes" value="#{casoClinicoBean.doencaOuPRMSEndoc1}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DADiabetes"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMdiabetes"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDiabetes" value="#{casoClinicoBean.nPRMSEndoc1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSEndoc2}"></h:selectBooleanCheckbox>
			<h:outputText value="Hipotireodismo"></h:outputText>
			<h:selectOneRadio id="DAorPRMHipotireodismo" value="#{casoClinicoBean.doencaOuPRMSEndoc2}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAHipot"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMHipot"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMHipotireodismo" value="#{casoClinicoBean.nPRMSEndoc2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSEndoc3}"></h:selectBooleanCheckbox>
			<h:outputText value="Sintomas da menopausa"></h:outputText>
			<h:selectOneRadio id="DAorPRMSintMenopausa" value="#{casoClinicoBean.doencaOuPRMSEndoc3}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DASM"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMSM"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMSintomasMenopausa" value="#{casoClinicoBean.nPRMSEndoc3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
		</h:panelGrid>
		<br>Urinário:
	<h:panelGrid border="0" columns="4">
		<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSUrin1}"></h:selectBooleanCheckbox>
		<h:outputText value="Frequência urinária"></h:outputText>
			<h:selectOneRadio id="DAorPRMFU" value="#{casoClinicoBean.doencaOuPRMSUrin1}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAFU"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMFU"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMFrequenciaUrinaria" value="#{casoClinicoBean.nPRMSUrin1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
		</h:panelGrid>
		<br>Geniturinário reprodutivo:
	<h:panelGrid border="0" columns="4">
		<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGenitRepr1}"></h:selectBooleanCheckbox>
		<h:outputText value="Dismenorréia"></h:outputText>
			<h:selectOneRadio id="DAorPRMDismenorreia" value="#{casoClinicoBean.doencaOuPRMSGenitRepr1}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DADismen"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMDismen"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDismenorreia" value="#{casoClinicoBean.nPRMSGenitRepr1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGenitRepr2}"></h:selectBooleanCheckbox>
			<h:outputText value="Incontinência"></h:outputText>
			<h:selectOneRadio id="DAorPRMInconti" value="#{casoClinicoBean.doencaOuPRMSGenitRepr2}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAInconti"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMInconti"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMIncotinencia" value="#{casoClinicoBean.nPRMSGenitRepr2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGenitRepr3}"></h:selectBooleanCheckbox>
			<h:outputText value="Impotência"></h:outputText>
			<h:selectOneRadio id="DAorPRMImpotencia" value="#{casoClinicoBean.doencaOuPRMSGenitRepr3}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAImpot"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMImpot"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMImpotencia" value="#{casoClinicoBean.nPRMSGenitRepr3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGenitRepr4}"></h:selectBooleanCheckbox>
			<h:outputText value="Diminuição do desejo sexual"></h:outputText>
			<h:selectOneRadio id="DAorPRMDimDesejoSexual" value="#{casoClinicoBean.doencaOuPRMSGenitRepr4}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DADDS"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMDDS"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDimDesejoSexual" value="#{casoClinicoBean.nPRMSGenitRepr4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSGenitRepr5}"></h:selectBooleanCheckbox>
			<h:outputText value="Corrimento vaginal/coceira"></h:outputText>
			<h:selectOneRadio id="DAorPRMCorrimento" value="#{casoClinicoBean.doencaOuPRMSGenitRepr5}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DACV"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMCV"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMCorrimentoVaginal" value="#{casoClinicoBean.nPRMSGenitRepr5}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
		</h:panelGrid>
		<br>Sintomas hematopoiéticos:
	<h:panelGrid border="0" columns="4">
		<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSHematop1}"></h:selectBooleanCheckbox>
		<h:outputText value="Formação excessiva de hematomas"></h:outputText>
			<h:selectOneRadio id="DAorPRMFormExcHematomas" value="#{casoClinicoBean.doencaOuPRMSHematop1}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAFEH"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMFEH"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMFormacaoExcessivaHematomas" value="#{casoClinicoBean.nPRMSHematop1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSHematop2}"></h:selectBooleanCheckbox>
			<h:outputText value="Hemorragia"></h:outputText>
			<h:selectOneRadio id="DAorPRMHemor" value="#{casoClinicoBean.doencaOuPRMSHematop2}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAHemor"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMHemor"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMHemorragia" value="#{casoClinicoBean.nPRMSHematop2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSHematop3}"></h:selectBooleanCheckbox>
			<h:outputText value="Anemia"></h:outputText>
			<h:selectOneRadio id="DAorPRMAnemia" value="#{casoClinicoBean.doencaOuPRMSHematop3}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAAnem"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMAnem"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMAnemia" value="#{casoClinicoBean.nPRMSHematop3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
		</h:panelGrid>
		<br>Musculoesquelético:
	<h:panelGrid border="0" columns="4">
		<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoMuscEsq1}"></h:selectBooleanCheckbox>
		<h:outputText value="Dor nas costas"></h:outputText>
			<h:selectOneRadio id="DAorPRMDorNasCostas" value="#{casoClinicoBean.doencaOuPRMMuscEsq1}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DADC"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMDC"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDorNasCostas" value="#{casoClinicoBean.nPRMMuscEsq1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoMuscEsq2}"></h:selectBooleanCheckbox>
			<h:outputText value="Artrite(osteo/reumatoide)"></h:outputText>
			<h:selectOneRadio id="DAorPRMArtrite" value="#{casoClinicoBean.doencaOuPRMMuscEsq2}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAArtri"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMArtri"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMArtrite" value="#{casoClinicoBean.nPRMMuscEsq2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoMuscEsq3}"></h:selectBooleanCheckbox>
			<h:outputText value="Tendinites"></h:outputText>
			<h:selectOneRadio id="DAorPRMTendinites" value="#{casoClinicoBean.doencaOuPRMMuscEsq3}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DATend"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMTend"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMTendinites" value="#{casoClinicoBean.nPRMMuscEsq3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoMuscEsq4}"></h:selectBooleanCheckbox>
			<h:outputText value="Dor muscular"></h:outputText>
			<h:selectOneRadio id="DAorPRMDorMuscular" value="#{casoClinicoBean.doencaOuPRMMuscEsq4}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DADM"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMDM"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDorMuscular" value="#{casoClinicoBean.nPRMMuscEsq4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
		</h:panelGrid>
		<br>Sistema nervoso:
	<h:panelGrid border="0" columns="4">
		<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSNervoso1}"></h:selectBooleanCheckbox>
		<h:outputText value="Parestesia"></h:outputText>
			<h:selectOneRadio id="DAorPRMParestesia" value="#{casoClinicoBean.doencaOuPRMSNervoso1}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAParest"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMParest"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMParestesia" value="#{casoClinicoBean.nPRMSNervoso1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSNervoso2}"></h:selectBooleanCheckbox>
			<h:outputText value="Tremor"></h:outputText>
			<h:selectOneRadio id="DAorPRMTremor" value="#{casoClinicoBean.doencaOuPRMSNervoso2}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DATrem"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMTrem"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMTremor" value="#{casoClinicoBean.nPRMSNervoso2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSNervoso3}"></h:selectBooleanCheckbox>
			<h:outputText value="Perda de equilíbrio"></h:outputText>
			<h:selectOneRadio id="DAorPRMPerdaDeEquilibrio" value="#{casoClinicoBean.doencaOuPRMSNervoso3}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAPerdaDeEquilibrio"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMPerdaDeEq"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMPerdaDeEquilibrio" value="#{casoClinicoBean.nPRMSNervoso3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSNervoso4}"></h:selectBooleanCheckbox>
			<h:outputText value="Depressão"></h:outputText>
			<h:selectOneRadio id="DAorPRMDepressao" value="#{casoClinicoBean.doencaOuPRMSNervoso4}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DADepre"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMDepre"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMDepressao" value="#{casoClinicoBean.nPRMSNervoso4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSNervoso5}"></h:selectBooleanCheckbox>
			<h:outputText value="Suicídio"></h:outputText>
			<h:selectOneRadio id="DAorPRMSuicidio" value="#{casoClinicoBean.doencaOuPRMSNervoso5}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DASuic"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMSuic"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMSuicidio" value="#{casoClinicoBean.nPRMSNervoso5}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSNervoso6}"></h:selectBooleanCheckbox>
			<h:outputText value="Ansiedade/nervosismo"></h:outputText>
			<h:selectOneRadio id="DAorPRMAnsiedade" value="#{casoClinicoBean.doencaOuPRMSNervoso6}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAAN"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMAN"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMAnsiedade" value="#{casoClinicoBean.nPRMSNervoso6}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoSNervoso7}"></h:selectBooleanCheckbox>
			<h:outputText value="Perda de memória"></h:outputText>
			<h:selectOneRadio id="DAorPRMPerdaDeMemoria" value="#{casoClinicoBean.doencaOuPRMSNervoso7}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAPM"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMPM"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMPerdaDeMemoria" value="#{casoClinicoBean.nPRMSNervoso7}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
		</h:panelGrid>
		<br>Pele:
	<h:panelGrid border="0" columns="4">
		<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoPele1}"></h:selectBooleanCheckbox>
		<h:outputText value="Eczema/psoríase"></h:outputText>
			<h:selectOneRadio id="DAorPRMEczema" value="#{casoClinicoBean.doencaOuPRMPele1}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAEcz"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMEcz"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMEczema" value="#{casoClinicoBean.nPRMPele1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoPele2}"></h:selectBooleanCheckbox>
			<h:outputText value="Prurido"></h:outputText>
			<h:selectOneRadio id="DAorPRMPrurido" value="#{casoClinicoBean.doencaOuPRMPele2}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAPru"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMPru"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMPrurido" value="#{casoClinicoBean.nPRMPele2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoPele3}"></h:selectBooleanCheckbox>
			<h:outputText value="Rash"></h:outputText>
			<h:selectOneRadio id="DAorPRMRash" value="#{casoClinicoBean.doencaOuPRMPele3}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DArash"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMrsh"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMRash" value="#{casoClinicoBean.nPRMPele3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
		</h:panelGrid>
		<br>Doenças infecciosas:
	<h:panelGrid border="0" columns="4">
		<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoDoencInfec1}"></h:selectBooleanCheckbox>
		<h:outputText value="Malária"></h:outputText>
			<h:selectOneRadio id="DAorPRMMalaria" value="#{casoClinicoBean.doencaOuPRMDoencInfec1}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAMalar"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMMalar"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMMalaria" value="#{casoClinicoBean.nPRMDoencInfec1}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoDoencInfec2}"></h:selectBooleanCheckbox>
			<h:outputText value="Sífilis"></h:outputText>
			<h:selectOneRadio id="DAorPRMSifilis" value="#{casoClinicoBean.doencaOuPRMDoencInfec2}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DASif"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMSif"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMSifilis" value="#{casoClinicoBean.nPRMDoencInfec2}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoDoencInfec3}"></h:selectBooleanCheckbox>
			<h:outputText value="HPV"></h:outputText>
			<h:selectOneRadio id="DAorPRMHPV" value="#{casoClinicoBean.doencaOuPRMDoencInfec3}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAHpv"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMHpvv"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMHPV" value="#{casoClinicoBean.nPRMDoencInfec3}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoDoencInfec4}"></h:selectBooleanCheckbox>
			<h:outputText value="Gonorréia"></h:outputText>
			<h:selectOneRadio id="DAorPRMGonorreia" value="#{casoClinicoBean.doencaOuPRMDoencInfec4}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAGono"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMGono"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMGonorreia" value="#{casoClinicoBean.nPRMDoencInfec4}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
			<h:selectBooleanCheckbox value="#{casoClinicoBean.ativoDoencInfec5}"></h:selectBooleanCheckbox>
			<h:outputText value="Herpes"></h:outputText>
			<h:selectOneRadio id="DAorPRMHerpes" value="#{casoClinicoBean.doencaOuPRMDoencInfec5}">
				<f:selectItem itemLabel="Doença ou Agravo" itemValue="doenca" id="DAHerp"/>
				<f:selectItem itemLabel="PRM" itemValue="prm" id="PRMHerp"/>
			</h:selectOneRadio>
			<h:selectOneMenu id="PRMHerpes" value="#{casoClinicoBean.nPRMDoencInfec5}">
				<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
			</h:selectOneMenu>
		</h:panelGrid><br><br>
		<h:commandButton action="#{casoClinicoBean.pagina2}" value="success"></h:commandButton>
	</h:form>
</f:view>
</body>
</html>