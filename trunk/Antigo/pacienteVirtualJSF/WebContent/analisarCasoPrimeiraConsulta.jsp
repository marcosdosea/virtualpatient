<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
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
	href="${pageContext.request.contextPath}/css/cssAnalise.css"
	media="screen" />
<script language="JavaScript">
	function validaForm(){
		//validar nome
		if (document.getElementById("analiseConsulta1:nome").value == ""){
			alert(document.getElementById("analiseConsulta1:alertNome").value);
			document.getElementById("analiseConsulta1:nome").focus();
			return false;
		}
		//validar data de nascimento
   		if (document.getElementById("analiseConsulta1:dataNasc").value == ""){
			alert(document.getElementById("analiseConsulta1:alertDataNasc").value);
			document.getElementById("analiseConsulta1:dataNasc").focus();
			return false;
		}
		//validar o formato da data de nascimento
		var data = document.getElementById("analiseConsulta1:dataNasc").value;
		var dia = data.substr(0,2);
		var mes = data.substr (3,2);
		var ano = data.substr (6,4);
		var b1 = data.substr(2,1);
		var b2 = data.substr(5,1);
		
		if(isNaN(dia) || isNaN(mes) || isNaN(ano) || b1 != "/" || b2 != "/"){
			alert(document.getElementById("analiseConsulta1:alertDataNascFormato").value);
			document.getElementById("analiseConsulta1:dataNasc").focus();
			return false;
		}		
		//validar gênero
		var preencheu = false;
    	var botoes = document.getElementsByName("analiseConsulta1:genero");
    	for(var i = 0; i < botoes.length; i++){
     	   if(botoes.item(i).checked)
      	      preencheu = true;
    	}
   		if(!preencheu){
   			alert(document.getElementById("analiseConsulta1:alertGenero").value);
   			document.getElementById("analiseConsulta1:ocupacao").focus();
       	 	return false;
    	}		   		
   		//validar ocupação
   		if (document.getElementById("analiseConsulta1:ocupacao").value == ""){
			alert(document.getElementById("analiseConsulta1:alertOcupacao").value);
			document.getElementById("analiseConsulta1:ocupacao").focus();
			return false;
		}
   		//validar moradia/família
   		if (document.getElementById("analiseConsulta1:moradiaFamilia").value == ""){
			alert(document.getElementById("analiseConsulta1:alertMoradiaFamilia").value);
			document.getElementById("analiseConsulta1:moradiaFamilia").focus();
			return false;
		}
   		//validar medicos quem atendem
   		if (document.getElementById("analiseConsulta1:medicos").value == ""){
			alert(document.getElementById("analiseConsulta1:alertMedicos").value);
			document.getElementById("analiseConsulta1:medicos").focus();
			return false;
		}
   		//validar plano de saúde
   		if (document.getElementById("analiseConsulta1:planoSaude").value == ""){
			alert(document.getElementById("analiseConsulta1:alertPlanoSaude").value);
			document.getElementById("analiseConsulta1:planoSaude").focus();
			return false;
		}
   		//validar razão do encontro 
   		if (document.getElementById("analiseConsulta1:razaoEnc").value == ""){
			alert(document.getElementById("analiseConsulta1:alertRazaoEnc").value);
			document.getElementById("analiseConsulta1:razaoEnc").focus();
			return false;
		}
		//validar todos os campos de experiência com medicamentos 
   		if (document.getElementById("analiseConsulta1:experienciaMedicamentos1").value == ""){
			alert(document.getElementById("analiseConsulta1:alertExpMedicamentos").value);
			document.getElementById("analiseConsulta1:experienciaMedicamentos1").focus();
			return false;
		}
   		if (document.getElementById("analiseConsulta1:experienciaMedicamentos2").value == ""){
			alert(document.getElementById("analiseConsulta1:alertExpMedicamentos").value);
			document.getElementById("analiseConsulta1:experienciaMedicamentos2").focus();
			return false;
		}
   		if (document.getElementById("analiseConsulta1:experienciaMedicamentos3").value == ""){
			alert(document.getElementById("analiseConsulta1:alertExpMedicamentos").value);
			document.getElementById("analiseConsulta1:experienciaMedicamentos3").focus();
			return false;
		}
   		if (document.getElementById("analiseConsulta1:experienciaMedicamentos4").value == ""){
			alert(document.getElementById("analiseConsulta1:alertExpMedicamentos").value);
			document.getElementById("analiseConsulta1:experienciaMedicamentos4").focus();
			return false;
		}
   		if (document.getElementById("analiseConsulta1:experienciaMedicamentos5").value == ""){
			alert(document.getElementById("analiseConsulta1:alertExpMedicamentos").value);
			document.getElementById("analiseConsulta1:experienciaMedicamentos5").focus();
			return false;
		}
   		if (document.getElementById("analiseConsulta1:conclusao").value == ""){
			alert(document.getElementById("analiseConsulta1:alertConclusao").value);
			document.getElementById("analiseConsulta1:conclusao").focus();
			return false;
		}

		//validar história médica pregressa 
   		if (document.getElementById("analiseConsulta1:historiaMedicaPregressa").value == ""){
			alert(document.getElementById("analiseConsulta1:alertHistMedicaPregressa").value);
			document.getElementById("analiseConsulta1:historiaMedicaPregressa").focus();
			return false;
		}

   		//validar história familiar
   		if (document.getElementById("analiseConsulta1:historiafamiliar").value == ""){
			alert(document.getElementById("analiseConsulta1:alertHistFamiliar").value);
			document.getElementById("analiseConsulta1:historiafamiliar").focus();
			return false;
		}
		
   		//validar fuma?
		var preencheu = false;
    	var botoes = document.getElementsByName("analiseConsulta1:flFuma");
    	for(var i = 0; i < botoes.length; i++){
     	   if(botoes.item(i).checked)
      	      preencheu = true;
    	}
   		if(!preencheu){
   			alert(document.getElementById("analiseConsulta1:alertFuma").value);
       	 return false;
    	}
   		//validar bebe café?
		var preencheu = false;
    	var botoes = document.getElementsByName("analiseConsulta1:flBebeCafe");
    	for(var i = 0; i < botoes.length; i++){
     	   if(botoes.item(i).checked)
      	      preencheu = true;
    	}
   		if(!preencheu){
   			alert(document.getElementById("analiseConsulta1:alertBebeCafe").value);
       	 return false;
    	}
   		//validar bebe alcool?
		var preencheu = false;
    	var botoes = document.getElementsByName("analiseConsulta1:flBebeAlcool");
    	for(var i = 0; i < botoes.length; i++){
     	   if(botoes.item(i).checked)
      	      preencheu = true;
    	}
   		if(!preencheu){
   			alert(document.getElementById("analiseConsulta1:alertBebeAlcool").value);
       	 return false;
    	}
   		//validar peso
   		if (document.getElementById("analiseConsulta1:peso").value == ""){
			alert(document.getElementById("analiseConsulta1:alertPeso").value);
			document.getElementById("analiseConsulta1:peso").focus();
			return false;
		}
		//validar se o peso possui apenas números
		if(isNaN(document.getElementById("analiseConsulta1:peso").value)){
			alert(document.getElementById("analiseConsulta1:alertPesoNumero").value);
			document.getElementById("analiseConsulta1:peso").focus();
			return false;
		}		
   		//validar altura
   		if (document.getElementById("analiseConsulta1:altura").value == ""){
			alert(document.getElementById("analiseConsulta1:alertAltura").value);
			document.getElementById("analiseConsulta1:altura").focus();
			return false;
		}
   		//validar se a altura possui apenas números
		if(isNaN(document.getElementById("analiseConsulta1:altura").value)){
			alert(document.getElementById("analiseConsulta1:alertAlturaNumero").value);
			document.getElementById("analiseConsulta1:altura").focus();
			return false;
		}		
   		//validar imc
   		if (document.getElementById("analiseConsulta1:imc").value == ""){
			alert(document.getElementById("analiseConsulta1:alertImc").value);
			document.getElementById("analiseConsulta1:imc").focus();
			return false;
		}
   		//validar se o imc possui apenas números
		if(isNaN(document.getElementById("analiseConsulta1:imc").value)){
			alert(document.getElementById("analiseConsulta1:alertImcNumero").value);
			document.getElementById("analiseConsulta1:imc").focus();
			return false;
		}
   		//validar pressao sistólica
   		if (document.getElementById("analiseConsulta1:pressaoSist").value == ""){
			alert(document.getElementById("analiseConsulta1:alertPressaoSist").value);
			document.getElementById("analiseConsulta1:pressaoSist").focus();
			return false;
		}
   		//validar se a pressao sistólica possui apenas números
		if(isNaN(document.getElementById("analiseConsulta1:pressaoSist").value)){
			alert(document.getElementById("analiseConsulta1:alertPressaoSistNumero").value);
			document.getElementById("analiseConsulta1:pressaoSist").focus();
			return false;
		}
   		//validar pressao diastólica
   		if (document.getElementById("analiseConsulta1:pressaoDiast").value == ""){
			alert(document.getElementById("analiseConsulta1:alertPressaoDiast").value);
			document.getElementById("analiseConsulta1:pressaoDiast").focus();
			return false;
		}
   		//validar se a pressao diastólica possui apenas números
		if(isNaN(document.getElementById("analiseConsulta1:pressaoDiast").value)){
			alert(document.getElementById("analiseConsulta1:alertPressaoDiastNumero").value);
			document.getElementById("analiseConsulta1:pressaoDiast").focus();
			return false;
		}
   		//validar temperatura
   		if (document.getElementById("analiseConsulta1:temperatura").value == ""){
			alert(document.getElementById("analiseConsulta1:alertTemperatura").value);
			document.getElementById("analiseConsulta1:temperatura").focus();
			return false;
		}
   		//validar se a temperatura possui apenas números
		if(isNaN(document.getElementById("analiseConsulta1:temperatura").value)){
			alert(document.getElementById("analiseConsulta1:alertTemperaturaNumero").value);
			document.getElementById("analiseConsulta1:temperatura").focus();
			return false;
		}
   		//validar alergias
   		if (document.getElementById("analiseConsulta1:alergias").value == ""){
			alert(document.getElementById("analiseConsulta1:alertAlergias").value);
			document.getElementById("analiseConsulta1:alergias").focus();
			return false;
		}	

		return true;	
	}
</script>
</head>
<body>
<f:loadBundle basename="LocalizationResources" var="bundle" />
<f:view>
	<h:form id="analiseConsulta1" onsubmit="return validaForm()">
		<h:panelGroup layout="block" id="tudo" styleClass="tudo">
			<h:panelGroup layout="block" id="conteudo" styleClass="conteudo">
				<h:panelGroup layout="block" id="header" styleClass="header">
					<h:panelGroup>
						<h:commandLink action="#{usuarioBean.retornarMenu}"
							style="color: white; padding-right:10px;" immediate="true">
							<h:graphicImage value="/css/header.PNG" style="border: 0"
								alt="PharmaVP"></h:graphicImage>
						</h:commandLink>
					</h:panelGroup>
					<h:panelGroup layout="block" style="text-align: right;">
						<h:commandLink action="#{usuarioBean.sair}"
							style="color: white; padding-right:10px;" immediate="true">
							<h:outputText value="#{bundle.sair}"></h:outputText>
						</h:commandLink>
					</h:panelGroup>
				</h:panelGroup>
				<h:panelGroup layout="block" id="sidebar" styleClass="sidebar">
					<h:graphicImage value="#{respostaDoAlunoBean.casoEscolhido.fotoFileName}"></h:graphicImage>
					<br>
					<h:outputText value="#{bundle.casoInicial} " style="font-weight: bold;" ></h:outputText>
					<h:outputText
						value="#{respostaDoAlunoBean.casoEscolhido.relatoDeCasoPrimeiraConsulta}"></h:outputText>
				</h:panelGroup>
				<h:panelGroup layout="block" id="wraper" styleClass="wraper">
					<h:panelGroup layout="block" id="mainContent"
						styleClass="mainContent">
						<br>
						<h2><h:outputText
							value="#{bundle.analisarCasoPrimeiraConsulta}"></h:outputText></h2>
						<br>
						<h:outputText value="#{respostaDoAlunoBean.construtorFake}"></h:outputText>
						<br>
						<h:outputText value="#{bundle.tentativaNumero}"></h:outputText>
						<h:outputText value=" #{respostaDoAlunoBean.newAluno.nrTentativa}" />
						<br>
						<br>
						<h:outputText value="#{bundle.comentariosTutor}"
							style="font-weight: bold"
							rendered="#{respostaDoAlunoBean.newAluno.nrTentativa > 1}"></h:outputText>
						<br>
						<br>

						<fieldset><legend><h:outputText value="#{bundle.dadosDemAnt}"></h:outputText></legend> <h:panelGroup
							id="dados" layout="block" styleClass="field">
							<h:outputText value="#{bundle.nome}" />
							<br>
							<h:inputText id="nome" value="#{respostaDoAlunoBean.nome}"
								styleClass="field_text" />
							<br>
							<h:outputText value="#{bundle.dataNasc}"></h:outputText>
							<h:inputText id="dataNasc" value="#{respostaDoAlunoBean.dataNascimentoAux}"
								styleClass="field_text" />
							<br>
							<h:outputText value="#{bundle.genero}" />
							<br>
							<h:selectOneRadio id="genero"
								value="#{respostaDoAlunoBean.genero}">
								<f:selectItem itemValue="M" id="M"
									itemLabel="#{bundle.masculino}" />
								<f:selectItem itemValue="F" id="F"
									itemLabel="#{bundle.feminino}" />
							</h:selectOneRadio>
							<br>
							<h:outputText value="#{bundle.ocupacao}" />
							<br>
							<h:inputText id="ocupacao" value="#{respostaDoAlunoBean.ocupacao}"
								styleClass="field_text" />
							<br>
							<h:outputText value="#{bundle.escolaridade}"></h:outputText>
							<br>
							<h:selectOneMenu id="anoInitCurso"
								value="#{respostaDoAlunoBean.escolaridade}"
								styleClass="field_text">
								<f:selectItem itemLabel="#{bundle.fundamentalIncompleto}"
									itemValue="fundamental incompleto" id="fundamentalIncompleto" />
								<f:selectItem itemLabel="#{bundle.fundamentalCompleto}"
									itemValue="fundamental completo" id="fundamentalCompleto" />
								<f:selectItem itemLabel="#{bundle.medioIncompleto}"
									itemValue="medio incompleto" id="medioIncompleto" />
								<f:selectItem itemLabel="#{bundle.medioCompleto}"
									itemValue="medio completo" id="medioCompleto" />
								<f:selectItem itemLabel="#{bundle.superiorIncompleto}"
									itemValue="superior incompleto" id="superiorIncompleto" />
								<f:selectItem itemLabel="#{bundle.superiorCompleto}"
									itemValue="superior completo" id="superiorCompleto" />
							</h:selectOneMenu>
							<br>
							<h:outputText value="#{bundle.moradiaFamilia}"></h:outputText>
							<br>
							<h:inputText id="moradiaFamilia" value="#{respostaDoAlunoBean.moradiaFamilia}"
								styleClass="field_text"></h:inputText>
							<br>
							<h:outputText value="#{bundle.medicos}"></h:outputText>
							<br>
							<h:inputText id="medicos" value="#{respostaDoAlunoBean.medicosQueAtendem}"
								styleClass="field_text"></h:inputText>
							<br>
							<h:outputText value="#{bundle.planoSaude}"></h:outputText>
							<br>
							<h:inputText id="planoSaude" value="#{respostaDoAlunoBean.planoDeSaude}"
								styleClass="field_text"></h:inputText>
							<br>
						</h:panelGroup></fieldset>
						<br>

						<fieldset>
						<legend>
						<h:outputText value="#{bundle.razaoEncontro}"></h:outputText>
						</legend> 
						<h:panelGroup id="razaoEncontro" layout="block" styleClass="field">
							<h:selectOneMenu value="#{respostaDoAlunoBean.razaoEncontro}" style="width: 90%;">
								<f:selectItems value="#{opcoesBean.listaRazaoEncontro}" />
							</h:selectOneMenu>
							<br><br>
							<h:selectBooleanCheckbox value="#{respostaDoAlunoBean.outroRazaoEncontroCb}" />
							&nbsp;
							<h:outputText value="#{bundle.outro}:"></h:outputText>
						 	&nbsp;
						 	<h:inputText value="#{respostaDoAlunoBean.outroRazaoEncontroTxt}" style="width: 80%;"></h:inputText>
						</h:panelGroup>
						</fieldset>
						<br>

						<fieldset>
						<legend><h:outputText value="#{bundle.experienciaMedicamentos}"></h:outputText></legend> 
						<h:panelGroup
							id="experienciaMedicamentos" layout="block" styleClass="field"
							style="width: 100%;">
							<h:panelGrid border="0" columns="2" style="width: 100%;">
								<h:panelGrid columns="1">
									<h:outputText value="#{bundle.experienciaMedicamentos1}"></h:outputText>
									<h:selectOneMenu value="#{respostaDoAlunoBean.experienciaMedicamentos1}" style="width: 97%;">
										<f:selectItems value="#{opcoesBean.listaExperienciaMedicamentos1}" />
									</h:selectOneMenu>
									<h:panelGroup>
										<br>
										<h:selectBooleanCheckbox value="#{respostaDoAlunoBean.outroExpMed1Cb}" />
										&nbsp;
										<h:outputText value="#{bundle.outro}:"></h:outputText>
									 	&nbsp;
									 	<h:inputText value="#{respostaDoAlunoBean.outroExpMed1Txt}" style="width: 84%;"></h:inputText>
									</h:panelGroup>									
								</h:panelGrid>
								<h:panelGrid columns="1">
									<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
									<h:selectOneRadio id="necessidadeAtencao1"
										value="#{respostaDoAlunoBean.necessidadeAtencao1}">
										<f:selectItem itemLabel="#{bundle.sim}" itemValue="V"
											id="necessidade1True" />
										<f:selectItem itemLabel="#{bundle.nao}" itemValue="F"
											id="necessidade1False" />
									</h:selectOneRadio>
								</h:panelGrid>

								<h:panelGrid columns="1">
									<h:outputText value="#{bundle.experienciaMedicamentos2}"></h:outputText>
									<h:selectOneMenu value="#{respostaDoAlunoBean.experienciaMedicamentos2}" style="width: 97%;">
										<f:selectItems value="#{opcoesBean.listaExperienciaMedicamentos2}" />
									</h:selectOneMenu>
									<h:panelGroup>
										<br>
										<h:selectBooleanCheckbox value="#{respostaDoAlunoBean.outroExpMed2Cb}" />
										&nbsp;
										<h:outputText value="#{bundle.outro}:"></h:outputText>
									 	&nbsp;
									 	<h:inputText value="#{respostaDoAlunoBean.outroExpMed2Txt}" style="width: 84%;"></h:inputText>
									</h:panelGroup>	
								</h:panelGrid>
								<h:panelGrid columns="1">
									<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
									<h:selectOneRadio id="necessidadeAtencao2"
										value="#{respostaDoAlunoBean.necessidadeAtencao2}">
										<f:selectItem itemLabel="#{bundle.sim}" itemValue="V"
											id="necessidade2True" />
										<f:selectItem itemLabel="#{bundle.nao}" itemValue="F"
											id="necessidade2False" />
									</h:selectOneRadio>
								</h:panelGrid>

								<h:panelGrid columns="1">
									<h:outputText value="#{bundle.experienciaMedicamentos3}"></h:outputText>
									<h:selectOneMenu value="#{respostaDoAlunoBean.experienciaMedicamentos3}" style="width: 97%;">
										<f:selectItems value="#{opcoesBean.listaExperienciaMedicamentos3}" />
									</h:selectOneMenu>
									<h:panelGroup>
										<br>
										<h:selectBooleanCheckbox value="#{respostaDoAlunoBean.outroExpMed3Cb}" />
										&nbsp;
										<h:outputText value="#{bundle.outro}:"></h:outputText>
									 	&nbsp;
									 	<h:inputText value="#{respostaDoAlunoBean.outroExpMed3Txt}" style="width: 84%;"></h:inputText>
									</h:panelGroup>	
								</h:panelGrid>
								<h:panelGrid columns="1">
									<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
									<h:selectOneRadio id="necessidadeAtencao3"
										value="#{respostaDoAlunoBean.necessidadeAtencao3}">
										<f:selectItem itemLabel="#{bundle.sim}" itemValue="V"
											id="necessidade3True" />
										<f:selectItem itemLabel="#{bundle.nao}" itemValue="F"
											id="necessidade3False" />
									</h:selectOneRadio>
								</h:panelGrid>

								<h:panelGrid columns="1">
									<h:outputText value="#{bundle.experienciaMedicamentos4}"></h:outputText>
									<h:selectOneMenu value="#{respostaDoAlunoBean.experienciaMedicamentos4}" style="width: 97%;">
										<f:selectItems value="#{opcoesBean.listaExperienciaMedicamentos4}" />
									</h:selectOneMenu>
									<h:panelGroup>
										<br>
										<h:selectBooleanCheckbox value="#{respostaDoAlunoBean.outroExpMed4Cb}" />
										&nbsp;
										<h:outputText value="#{bundle.outro}:"></h:outputText>
									 	&nbsp;
									 	<h:inputText value="#{respostaDoAlunoBean.outroExpMed4Txt}" style="width: 84%;"></h:inputText>
									</h:panelGroup>	
								</h:panelGrid>
								<h:panelGrid columns="1">
									<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
									<h:selectOneRadio id="necessidadeAtencao4"
										value="#{respostaDoAlunoBean.necessidadeAtencao4}">
										<f:selectItem itemLabel="#{bundle.sim}" itemValue="V"
											id="necessidade4True" />
										<f:selectItem itemLabel="#{bundle.nao}" itemValue="F"
											id="necessidade4False" />
									</h:selectOneRadio>
								</h:panelGrid>

								<h:panelGrid columns="1">
									<h:outputText value="#{bundle.experienciaMedicamentos5}"></h:outputText>
									<h:selectOneMenu value="#{respostaDoAlunoBean.experienciaMedicamentos5}" style="width: 97%;">
										<f:selectItems value="#{opcoesBean.listaExperienciaMedicamentos5}" />
									</h:selectOneMenu>
									<h:panelGroup>
										<br>
										<h:selectBooleanCheckbox value="#{respostaDoAlunoBean.outroExpMed5Cb}" />
										&nbsp;
										<h:outputText value="#{bundle.outro}:"></h:outputText>
									 	&nbsp;
									 	<h:inputText value="#{respostaDoAlunoBean.outroExpMed5Txt}" style="width: 84%;"></h:inputText>
									</h:panelGroup>	
								</h:panelGrid>
								<h:panelGrid columns="1">
									<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
									<h:selectOneRadio id="necessidadeAtencao5"
										value="#{respostaDoAlunoBean.necessidadeAtencao5}">
										<f:selectItem itemLabel="#{bundle.sim}" itemValue="V"
											id="necessidade5True" />
										<f:selectItem itemLabel="#{bundle.nao}" itemValue="F"
											id="necessidade5False" />
									</h:selectOneRadio>
								</h:panelGrid>
							</h:panelGrid>
							<h:panelGrid columns="1">
								<h:outputText value="#{bundle.conclusao}"></h:outputText>
								<h:selectOneMenu value="#{respostaDoAlunoBean.conclusao}" style="width: 97%;">
									<f:selectItems value="#{opcoesBean.listaExperienciaMedicamentosConc}" />
								</h:selectOneMenu>
								<h:panelGroup>
									<br>
									<h:selectBooleanCheckbox value="#{respostaDoAlunoBean.outroExpMedConcCb}" />
									&nbsp;
									<h:outputText value="#{bundle.outro}:"></h:outputText>
								 	&nbsp;
								 	<h:inputText value="#{respostaDoAlunoBean.outroExpMedConcTxt}" style="width: 84%;"></h:inputText>
								</h:panelGroup>									
							</h:panelGrid>

						</h:panelGroup></fieldset>
						<br>

						<fieldset><legend><h:outputText
							value="#{bundle.historias}"></h:outputText></legend> <h:panelGroup
							id="historias" layout="block" styleClass="field">
							<h:outputText value="#{bundle.historiaMedicaPregressa}"></h:outputText>
							<br>
							<h:selectOneMenu value="#{respostaDoAlunoBean.historiaMedicaPregressa}" style="width: 80%;">
								<f:selectItems value="#{opcoesBean.listaHistoriaMedicaPregressa}" />
							</h:selectOneMenu>							
							<br><br>
							<h:outputText value="#{bundle.historiafamiliar}"></h:outputText>
							<br>
							<h:selectOneMenu value="#{respostaDoAlunoBean.historiafamiliar}" style="width: 80%;">
								<f:selectItems value="#{opcoesBean.listaHistoriaFamiliar}" />
							</h:selectOneMenu>
							
						</h:panelGroup></fieldset>
						<br>

						<fieldset><legend><h:outputText
							value="#{bundle.estilosVida}"></h:outputText></legend> <h:panelGroup
							id="estilosVida" layout="block" styleClass="field">
							<h:panelGrid border="1" columns="4"
								styleClass="dataTables, tableEstilosDeVida"
								rowClasses="headerDataTable, odd, even, odd">
								<h:outputText value="#{bundle.substancia}" />
								<h:outputText value="#{bundle.consumo}" />
								<h:outputText value="#{bundle.histUso}" />
								<h:outputText value="#{bundle.histUsoAnterior}" />
								<h:outputText value="#{bundle.tabaco}" />
								<h:selectOneRadio id="flFuma"
									value="#{respostaDoAlunoBean.flFuma}" required="true">
									<f:selectItem itemLabel="#{bundle.fazUso}" itemValue="V"
										id="flFumaTrue" />
									<f:selectItem itemLabel="#{bundle.naoFazUs}" itemValue="F"
										id="flFumaFalse" />
								</h:selectOneRadio>
								<h:selectOneRadio id="historiaTabacoAtual"
									value="#{respostaDoAlunoBean.historiaTabacoAtual}"
									required="false">
									<f:selectItem itemLabel="#{bundle.tabaco0a10}"
										itemValue="0-10 cigarros por dia" id="tabaco0a10" />
									<f:selectItem itemLabel="#{bundle.tabaco10a20}"
										itemValue="10-20 cigarros por dia" id="tabaco10a20" />
									<f:selectItem itemLabel="#{bundle.tabaco2ouMaisMacos}"
										itemValue="> 1 maço/dia" id="tabaco2ouMaisMacos" />
								</h:selectOneRadio>
								<h:panelGroup>
									<h:outputText value="#{bundle.tempoParou}"></h:outputText>
									<h:inputText
										value="#{respostaDoAlunoBean.historiaTabacoAnterior}" />
								</h:panelGroup>
								<h:outputText value="#{bundle.cafe}" />
								<h:selectOneRadio id="flBebeCafe"
									value="#{respostaDoAlunoBean.flBebeCafe}" required="true">
									<f:selectItem itemLabel="#{bundle.fazUso}" itemValue="V"
										id="flBebeCafeTrue" />
									<f:selectItem itemLabel="#{bundle.naoFazUs}" itemValue="F"
										id="flBebeCafeFalse" />
								</h:selectOneRadio>
								<h:selectOneRadio id="historiaCafeAtual"
									value="#{respostaDoAlunoBean.historiaCafeAtual}">
									<f:selectItem itemLabel="#{bundle.cafeMenor2}"
										itemValue="< 2 xícaras/dia" id="cafeMenor2" />
									<f:selectItem itemLabel="#{bundle.cafe2a6}"
										itemValue="2-6 xícaras/dia" id="cafe2a6" />
									<f:selectItem itemLabel="#{bundle.cafeMaior6}"
										itemValue="> 6 xícaras/dia" id="cafeMaior6" />
								</h:selectOneRadio>
								<h:panelGroup>
									<h:outputText value="#{bundle.tempoParou}"></h:outputText>
									<h:inputText
										value="#{respostaDoAlunoBean.historiaCafeAnterior}" />
								</h:panelGroup>
								<h:outputText value="#{bundle.alcool}" />
								<h:selectOneRadio id="flBebeAlcool"
									value="#{respostaDoAlunoBean.flBebeAlcool}" required="true">
									<f:selectItem itemLabel="#{bundle.fazUso}" itemValue="V"
										id="flBebeAlcoolTrue" />
									<f:selectItem itemLabel="#{bundle.naoFazUs}" itemValue="F"
										id="flBebeAlcoolFalse" />
								</h:selectOneRadio>
								<h:panelGroup>
									<h:outputText value="#{bundle.tipoBebida}"></h:outputText>
									<h:inputText value="#{respostaDoAlunoBean.tipoBebidaAlcoolica}" />
									<br />
									<h:selectOneRadio id="historiaAlcoolAtual"
										value="#{respostaDoAlunoBean.historiaAlcoolAtual}">
										<f:selectItem itemLabel="#{bundle.alcoolMenor2}"
											itemValue="< 2 copos/semana" id="alcoolMenor2" />
										<f:selectItem itemLabel="#{bundle.alcool2a6}"
											itemValue="2-6 copos/semana" id="alcool2a6" />
										<f:selectItem itemLabel="#{bundle.alcoolMaior6}"
											itemValue="> 6 copos/semana" id="alcoolMaior6" />
									</h:selectOneRadio>
								</h:panelGroup>
								<h:panelGroup>
									<h:outputText value="#{bundle.tempoParou}"></h:outputText>
									<h:inputText
										value="#{respostaDoAlunoBean.historiaAlcoolAnterior}" />
								</h:panelGroup>


							</h:panelGrid>
						</h:panelGroup></fieldset>

						<br>
						<fieldset><legend><h:outputText
							value="#{bundle.paramClinicosMedicamentos}"></h:outputText></legend> 
							<h:panelGroup id="ParamMed" layout="block" styleClass="field">

							<h:outputText value="#{bundle.medicamentosAnteriores}"
								rendered="#{not empty respostaDoAlunoBean.medicamentosAnteriores}"></h:outputText>
							<br>
							<br>
							<h:dataTable border="1"
								value="#{respostaDoAlunoBean.medicamentosAnteriores}"
								rendered="#{not empty respostaDoAlunoBean.medicamentosAnteriores}"
								var="currentParametro" styleClass="dataTables"
								headerClass="headerDataTable" rowClasses="odd, even">
								<h:column id="column1">
									<h:outputText value="#{currentParametro.descricao}" />
									<f:facet name="header">
										<h:outputText value="#{bundle.medicamento}" />
									</f:facet>
								</h:column>
								<h:column id="column2">
									<h:outputText value="#{currentParametro.indicacao}" />
									<f:facet name="header">
										<h:outputText value="#{bundle.indicacao}" />
									</f:facet>
								</h:column>
								<h:column id="column3">
									<h:outputText value="#{currentParametro.resposta}" />
									<f:facet name="header">
										<h:outputText value="#{bundle.resposta}" />
									</f:facet>
								</h:column>
								<h:column id="column4">
									<h:outputText value="#{currentParametro.periodo}" />
									<f:facet name="header">
										<h:outputText value="#{bundle.periodo}" />
									</f:facet>
								</h:column>
							</h:dataTable>
							<br>
							<br>

							<h:outputText value="#{bundle.paramClinicos}"
								rendered="#{not empty respostaDoAlunoBean.parametrosClinicos}"></h:outputText>
							<br>
							<br>
							<h:dataTable border="1"
								value="#{respostaDoAlunoBean.parametrosClinicos}"
								rendered="#{not empty respostaDoAlunoBean.parametrosClinicos}"
								var="currentParametro" styleClass="dataTables"
								headerClass="headerDataTable" rowClasses="odd, even">
								<h:column id="column1">
									<h:outputText value="#{currentParametro.descricao}" />
									<f:facet name="header">
										<h:outputText value="#{bundle.descricao}" />
									</f:facet>
								</h:column>
								<h:column id="column2">
									<h:outputText value="#{currentParametro.valor}" />
									<f:facet name="header">
										<h:outputText value="#{bundle.valor}" />
									</f:facet>
								</h:column>
								<h:column id="column3">
									<h:outputText value="#{currentParametro.unidade}" />
									<f:facet name="header">
										<h:outputText value="#{bundle.unidade}" />
									</f:facet>
								</h:column>
								<h:column id="column4">
									<h:outputText value="#{currentParametro.valorDeReferencia}" />
									<f:facet name="header">
										<h:outputText value="#{bundle.valorRef}" />
									</f:facet>
								</h:column>
							</h:dataTable>
							<br>
							<br>
							<h:outputText value="#{bundle.medicamentosPresc}"
								rendered="#{not empty respostaDoAlunoBean.medicamentosPrescritos}"></h:outputText>
							<br>
							<br>
							<h:dataTable border="1"
								value="#{respostaDoAlunoBean.medicamentosPrescritos}"
								rendered="#{not empty respostaDoAlunoBean.medicamentosPrescritos}"
								var="currentParametro" styleClass="dataTables"
								headerClass="headerDataTable" rowClasses="odd, even">
								<h:column id="column1">
									<h:outputText rendered="#{not currentParametro.flItalico}"
										value="#{currentParametro.descricao}" />
									<h:outputText rendered="#{currentParametro.flItalico}"
										value="#{currentParametro.descricao}"
										style="font-style: italic" />

									<f:facet name="header">
										<h:outputText value="#{bundle.nomeGenerico}"></h:outputText>
									</f:facet>
								</h:column>
								<h:column id="column2">
									<h:outputText value="#{currentParametro.dosagem}"></h:outputText>
									<f:facet name="header">
										<h:outputText value="#{bundle.dosagem}"></h:outputText>
									</f:facet>
								</h:column>
								<h:column id="column3">
									<h:outputText value="#{currentParametro.posologia}"></h:outputText>
									<f:facet name="header">
										<h:outputText value="#{bundle.posologia}"></h:outputText>
									</f:facet>
								</h:column>
								<h:column id="column4">
									<h:outputText value="#{currentParametro.nmMedico}"></h:outputText>
									<f:facet name="header">
										<h:outputText value="#{bundle.nomePrescritor}"></h:outputText>
									</f:facet>
								</h:column>
								<h:column id="column5">
									<h:outputText value="#{currentParametro.especialidadeMedico}"></h:outputText>
									<f:facet name="header">
										<h:outputText value="#{bundle.especialidade}"></h:outputText>
									</f:facet>
								</h:column>

							</h:dataTable>
							<br>
							<br>
							<h:outputText value="#{bundle.medicamentosNaoPresc}"
								rendered="#{not empty respostaDoAlunoBean.medicamentosNaoPrescritos}"></h:outputText>
							<br>
							<br>
							<h:dataTable border="1"
								value="#{respostaDoAlunoBean.medicamentosNaoPrescritos}"
								rendered="#{not empty respostaDoAlunoBean.medicamentosNaoPrescritos}"
								var="currentParametro" styleClass="dataTables"
								headerClass="headerDataTable" rowClasses="odd, even">
								<h:column id="column1">
									<h:outputText rendered="#{not currentParametro.flItalico}"
										value="#{currentParametro.descricao}" />
									<h:outputText rendered="#{currentParametro.flItalico}"
										value="#{currentParametro.descricao}"
										style="font-style: italic" />

									<f:facet name="header">
										<h:outputText value="#{bundle.nomeGenerico}"></h:outputText>
									</f:facet>
								</h:column>
								<h:column id="column2">
									<h:outputText value="#{currentParametro.dosagem}"></h:outputText>
									<f:facet name="header">
										<h:outputText value="#{bundle.dosagem}"></h:outputText>
									</f:facet>
								</h:column>
								<h:column id="column3">
									<h:outputText value="#{currentParametro.posologia}"></h:outputText>
									<f:facet name="header">
										<h:outputText value="#{bundle.posologia}"></h:outputText>
									</f:facet>
								</h:column>
							</h:dataTable>
						</h:panelGroup></fieldset>

						<br>

						<fieldset>
						<legend><h:outputText value="#{bundle.examesFisicos}"></h:outputText></legend> 
						<h:panelGroup id="examesFisicos" layout="block" styleClass="field">
							<h:panelGrid border="0" columns="2" style="width: 343px">
								<h:outputText value="#{bundle.peso}"></h:outputText>
								<h:panelGroup>
									<h:inputText id="peso" value="#{respostaDoAlunoBean.pesoString}" style="width: 44px" required="true"></h:inputText>
									<h:outputText value=" #{bundle.unidadePeso}"></h:outputText>
								</h:panelGroup>
								
								<h:outputText value="#{bundle.altura}"></h:outputText>
								<h:panelGroup>
									<h:inputText id="altura" value="#{respostaDoAlunoBean.alturaString}" style="width: 44px" required="true"></h:inputText>
									<h:outputText value=" #{bundle.unidadeAltura}"></h:outputText>
								</h:panelGroup>
								
								<h:outputText value="#{bundle.imc}"></h:outputText>
								<h:panelGroup>
									<h:inputText id="imc" value="#{respostaDoAlunoBean.imcString}" style="width: 44px" required="true"></h:inputText>
									<h:outputText value=" #{bundle.unidadeIMC}"></h:outputText>
								</h:panelGroup>
								
								<h:outputText value="#{bundle.pressaoArt}"></h:outputText>
								<h:panelGroup>
									<h:inputText id="pressaoSist" style="width: 44px"
										value="#{respostaDoAlunoBean.pressaoSistolicaString}"
										required="true"></h:inputText> 
									X	
									<h:inputText id="pressaoDiast" style="width: 44px"
										value="#{respostaDoAlunoBean.pressaoDiastolicaString}"
										required="true"></h:inputText>
									<h:outputText value=" #{bundle.unidadePressao}"></h:outputText>
								</h:panelGroup>
				
								<h:outputText value="#{bundle.temperatura}"></h:outputText>
								<h:panelGroup>
									<h:inputText id="temperatura" value="#{respostaDoAlunoBean.temperaturaString}" style="width: 44px" required="true"></h:inputText>
									<h:outputText value=" #{bundle.unidadeGlicemia}"></h:outputText>
								</h:panelGroup>	
								
								<h:outputText value="#{bundle.alergias}"></h:outputText>
								<h:selectOneMenu value="#{respostaDoAlunoBean.alergias}">
									<f:selectItems value="#{opcoesBean.listaAlergias}" />
								</h:selectOneMenu>								
							</h:panelGrid>
						</h:panelGroup>
						</fieldset>
						<br>

						<fieldset><legend><h:outputText
							value="#{bundle.revisaoSistemas}"></h:outputText></legend> <h:panelGroup
							layout="block" id="queixasIni" styleClass="field">
							<br>
							<h3><h:outputText value="#{bundle.sistGeral}"></h:outputText></h3>
							<br>
							<br>
							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSGeral1}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSGeral1}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSGeral2}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSGeral2}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSGeral3}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSGeral3}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSGeral4}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSGeral4}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSGeral5}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSGeral5}" />
							<br>



							<br>
							<br>
							<h3><h:outputText value="#{bundle.oonb}" /><br>
							</h3>
							<br>
							<br>
							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoOONB1}" />&nbsp;&nbsp;
		<h:outputText value="#{bundle.descricaoOONB1}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoOONB2}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoOONB2}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoOONB3}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoOONB3}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoOONB4}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoOONB4}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoOONB5}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoOONB5}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoOONB6}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoOONB6}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoOONB7}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoOONB7}" />
							<br>



							<br>
							<br>
							<h3><h:outputText value="#{bundle.cardiovascular}" /></h3>
							<br>
							<br>
							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoCardio1}" />&nbsp;&nbsp;
		<h:outputText value="#{bundle.descricaoCardio1}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoCardio2}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoCardio2}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoCardio3}" /> &nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoCardio3}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoCardio4}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoCardio4}" />
							<br>



							<br>
							<br>
							<h3><h:outputText value="#{bundle.pulmonar}" /></h3>
							<br>
							<br>
							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoPulm1}" />&nbsp;&nbsp;
		<h:outputText value="#{bundle.descricaoPulm1}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoPulm2}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoPulm2}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoPulm3}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoPulm3}" />
							<br>



							<br>
							<br>
							<h3><h:outputText value="#{bundle.tgi}" /></h3>
							<br>
							<br>
							<h:selectBooleanCheckbox value="#{respostaDoAlunoBean.ativoTGI1}" />&nbsp;&nbsp;
		<h:outputText value="#{bundle.descricaoTGI1}" />
							<br>


							<h:selectBooleanCheckbox value="#{respostaDoAlunoBean.ativoTGI2}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoTGI2}" />
							<br>


							<h:selectBooleanCheckbox value="#{respostaDoAlunoBean.ativoTGI3}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoTGI3}" />
							<br>


							<h:selectBooleanCheckbox value="#{respostaDoAlunoBean.ativoTGI4}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoTGI4}" />
							<br>


							<h:selectBooleanCheckbox value="#{respostaDoAlunoBean.ativoTGI5}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoTGI5}" />
							<br>



							<br>
							<br>
							<h3><h:outputText value="#{bundle.sistEndoc}" /></h3>
							<br>
							<br>
							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSEndoc1}" />&nbsp;&nbsp;
		<h:outputText value="#{bundle.descricaoSEndoc1}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSEndoc2}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSEndoc2}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSEndoc3}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSEndoc3}" />
							<br>



							<br>
							<br>
							<h3><h:outputText value="#{bundle.urinario}" /></h3>
							<br>
							<br>
							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSUrin1}" />&nbsp;&nbsp;
		<h:outputText value="#{bundle.descricaoSUrin1}" />
							<br>




							<br>
							<br>
							<h3><h:outputText value="#{bundle.geniRepro}" /></h3>
							<br>
							<br>
							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSGenitRepr1}" />&nbsp;&nbsp;
		<h:outputText value="#{bundle.descricaoSGenitRepr1}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSGenitRepr2}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSGenitRepr2}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSGenitRepr3}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSGenitRepr3}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSGenitRepr4}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSGenitRepr4}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSGenitRepr5}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSGenitRepr5}" />
							<br>



							<br>
							<br>
							<h3><h:outputText value="#{bundle.sintHemato}" /></h3>
							<br>
							<br>
							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSHematop1}" />&nbsp;&nbsp;
		<h:outputText value="#{bundle.descricaoSHematop1}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSHematop2}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSHematop2}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSHematop3}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSHematop3}" />
							<br>



							<br>
							<br>
							<h3><h:outputText value="#{bundle.muscEsq}" /></h3>
							<br>
							<br>
							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoMuscEsq1}" />&nbsp;&nbsp;
		<h:outputText value="#{bundle.descricaoMuscEsq1}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoMuscEsq2}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoMuscEsq2}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoMuscEsq3}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoMuscEsq3}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoMuscEsq4}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoMuscEsq4}" />
							<br>



							<br>
							<br>
							<h3><h:outputText value="#{bundle.sistNervoso}" /></h3>
							<br>
							<br>
							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSNervoso1}" />&nbsp;&nbsp;
		<h:outputText value="#{bundle.descricaoSNervoso1}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSNervoso2}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSNervoso2}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSNervoso3}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSNervoso3}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSNervoso4}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSNervoso4}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSNervoso5}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSNervoso5}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSNervoso6}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSNervoso6}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoSNervoso7}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoSNervoso7}" />
							<br>



							<br>
							<br>
							<h3><h:outputText value="#{bundle.pele}" /></h3>
							<br>
							<br>
							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoPele1}" />&nbsp;&nbsp;
		<h:outputText value="#{bundle.descricaoPele1}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoPele2}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoPele2}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoPele3}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoPele3}" />
							<br>



							<br>
							<br>
							<h3><h:outputText value="#{bundle.doencasInfec}" /></h3>
							<br>
							<br>

							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoDoencInfec1}" />&nbsp;&nbsp;
		<h:outputText value="#{bundle.descricaoDoencInfec1}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoDoencInfec2}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoDoencInfec2}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoDoencInfec3}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoDoencInfec3}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoDoencInfec4}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoDoencInfec4}" />
							<br>


							<h:selectBooleanCheckbox
								value="#{respostaDoAlunoBean.ativoDoencInfec5}" />&nbsp;&nbsp;
			<h:outputText value="#{bundle.descricaoDoencInfec5}" />
							<br>
						</h:panelGroup>
						</fieldset>

						<br>
						<h:commandButton value="OK" action="#{respostaDoAlunoBean.addRespostaPrimeira}"></h:commandButton>
							
						<h:inputText id="alertNome" style="display:none" value="#{bundle.alertNome}"></</h:inputText>			
						<h:inputText id="alertGenero" style="display:none" value="#{bundle.alertGenero}"></</h:inputText>							
						<h:inputText id="alertDataNasc" style="display:none" value="#{bundle.alertDataNasc}"></</h:inputText>
						<h:inputText id="alertDataNascFormato" style="display:none" value="#{bundle.alertDataNascFormato}"></</h:inputText>
						<h:inputText id="alertMedicos" style="display:none" value="#{bundle.alertMedicos}"></</h:inputText>
						<h:inputText id="alertOcupacao" style="display:none" value="#{bundle.alertOcupacao}"></</h:inputText>
						<h:inputText id="alertMoradiaFamilia" style="display:none" value="#{bundle.alertMoradiaFamilia}"></</h:inputText>
						<h:inputText id="alertPlanoSaude" style="display:none" value="#{bundle.alertPlanoSaude}"></</h:inputText>
						<h:inputText id="alertRazaoEnc" style="display:none" value="#{bundle.alertRazaoEnc}"></</h:inputText>
						<h:inputText id="alertExpMedicamentos" style="display:none" value="#{bundle.alertExpMedicamentos}"></</h:inputText>
						<h:inputText id="alertConclusao" style="display:none" value="#{bundle.alertConclusao}"></</h:inputText>
						<h:inputText id="alertHistMedicaPregressa" style="display:none" value="#{bundle.alertHistMedicaPregressa}"></</h:inputText>
						<h:inputText id="alertHistFamiliar" style="display:none" value="#{bundle.alertHistFamiliar}"></</h:inputText>						
						<h:inputText id="alertFuma" style="display:none" value="#{bundle.alertFuma}"></</h:inputText>
						<h:inputText id="alertBebeCafe" style="display:none" value="#{bundle.alertBebeCafe}"></</h:inputText>
						<h:inputText id="alertBebeAlcool" style="display:none" value="#{bundle.alertBebeAlcool}"></</h:inputText>
						<h:inputText id="alertPeso" style="display:none" value="#{bundle.alertPeso}"></</h:inputText>
						<h:inputText id="alertAltura" style="display:none" value="#{bundle.alertAltura}"></</h:inputText>
						<h:inputText id="alertPressaoSist" style="display:none" value="#{bundle.alertPressaoSist}"></</h:inputText>
						<h:inputText id="alertPressaoDiast" style="display:none" value="#{bundle.alertPressaoDiast}"></</h:inputText>
						<h:inputText id="alertTemperatura" style="display:none" value="#{bundle.alertTemperatura}"></</h:inputText>
						<h:inputText id="alertAlergias" style="display:none" value="#{bundle.alertAlergias}"></</h:inputText>
						<h:inputText id="alertImc" style="display:none" value="#{bundle.alertImc}"></</h:inputText>
						<h:inputText id="alertImcNumero" style="display:none" value="#{bundle.alertImcNumero}"></</h:inputText>
						<h:inputText id="alertPesoNumero" style="display:none" value="#{bundle.alertPesoNumero}"></</h:inputText>
						<h:inputText id="alertPressaoSistNumero" style="display:none" value="#{bundle.alertPressaoSistNumero}"></</h:inputText>
						<h:inputText id="alertPressaoDiastNumero" style="display:none" value="#{bundle.alertPressaoDiastNumero}"></</h:inputText>
						<h:inputText id="alertTemperaturaNumero" style="display:none" value="#{bundle.alertTemperaturaNumero}"></</h:inputText>

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