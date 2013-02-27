<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PharmaVP</title>
<link href="${pageContext.request.contextPath}/css/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link rel="StyleSheet" type="text/css"
	href="${pageContext.request.contextPath}/css/cssCadastro.css"
	media="screen" />
<script language="JavaScript">
	function validarParamClinicos()
	{
		if (document.getElementById("cadastroCasoClinico:paramDesc").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertParamClinicos").value);
			document.getElementById("cadastroCasoClinico:paramDesc").focus();
			return false;
		}
		if (document.getElementById("cadastroCasoClinico:paramValor").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertParamClinicos").value);
			document.getElementById("cadastroCasoClinico:paramValor").focus();
			return false;
		}
		if (document.getElementById("cadastroCasoClinico:paramValorRef").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertParamClinicos").value);
			document.getElementById("cadastroCasoClinico:paramValorRef").focus();
			return false;
		}
		if (document.getElementById("cadastroCasoClinico:paramUnidade").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertParamClinicos").value);
			document.getElementById("cadastroCasoClinico:paramUnidade").focus();
			return false;
		}		
	
		return true;
	}

	function validarMedicamentosNP()
	{
		if (document.getElementById("cadastroCasoClinico:NPDescricao").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertMedicamentosNP").value);
			document.getElementById("cadastroCasoClinico:NPDescricao").focus();
			return false;
		}	
		if (document.getElementById("cadastroCasoClinico:NPDosagem").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertMedicamentosNP").value);
			document.getElementById("cadastroCasoClinico:NPDosagem").focus();
			return false;
		}	
		if (document.getElementById("cadastroCasoClinico:NPPosologia").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertMedicamentosNP").value);
			document.getElementById("cadastroCasoClinico:NPPosologia").focus();
			return false;
		}
	
		return true;
	}

	function validarMedicamentosP()
	{
		if (document.getElementById("cadastroCasoClinico:PDescricao").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertMedicamentosP").value);
			document.getElementById("cadastroCasoClinico:PDescricao").focus();
			return false;
		}	
		if (document.getElementById("cadastroCasoClinico:PDosagem").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertMedicamentosP").value);
			document.getElementById("cadastroCasoClinico:PDosagem").focus();
			return false;
		}
		if (document.getElementById("cadastroCasoClinico:PPosologia").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertMedicamentosP").value);
			document.getElementById("cadastroCasoClinico:PPosologia").focus();
			return false;
		}
		if (document.getElementById("cadastroCasoClinico:pnmMedico").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertMedicamentosP").value);
			document.getElementById("cadastroCasoClinico:pnmMedico").focus();
			return false;
		}	
		if (document.getElementById("cadastroCasoClinico:PEspecializacaoMedico").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertMedicamentosP").value);
			document.getElementById("cadastroCasoClinico:PEspecializacaoMedico").focus();
			return false;
		}	
	
		return true;
	}


	function validaMedicamentosAnteriores()
	{
		if (document.getElementById("cadastroCasoClinico:antDescricao").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertMedicamentosAnteriores").value);
			document.getElementById("cadastroCasoClinico:antDescricao").focus();
			return false;
		}
		if (document.getElementById("cadastroCasoClinico:antIndicacao").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertMedicamentosAnteriores").value);
			document.getElementById("cadastroCasoClinico:antIndicacao").focus();
			return false;
		}
		if (document.getElementById("cadastroCasoClinico:antResposta").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertMedicamentosAnteriores").value);
			document.getElementById("cadastroCasoClinico:antResposta").focus();
			return false;
		}
		if (document.getElementById("cadastroCasoClinico:antPeriodo").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertMedicamentosAnteriores").value);
			document.getElementById("cadastroCasoClinico:antPeriodo").focus();
			return false;
		}

		return true;
	}

	function validaForm(){
		//validar relato de caso inicial
		if (document.getElementById("cadastroCasoClinico:relatoDeCasoPrimeiraConsulta").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertRelatoDeCasoPrimeiraConsulta").value);
			document.getElementById("cadastroCasoClinico:relatoDeCasoPrimeiraConsulta").focus();
			return false;
		}
		//validar relato de caso com evolução
		if (document.getElementById("cadastroCasoClinico:relatoDeCasoSegundaConsulta").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertRelatoDeCasoSegundaConsulta").value);
			document.getElementById("cadastroCasoClinico:relatoDeCasoSegundaConsulta").focus();
			return false;
		}		
		//validar relato de caso com evolução
		if (document.getElementById("cadastroCasoClinico:relatoDeCasoTerceiraConsulta").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertRelatoDeCasoTerceiraConsulta").value);
			document.getElementById("cadastroCasoClinico:relatoDeCasoTerceiraConsulta").focus();
			return false;
		}
		//validar nome
		if (document.getElementById("cadastroCasoClinico:nome").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertNome").value);
			document.getElementById("cadastroCasoClinico:nome").focus();
			return false;
		}
		//validar gênero
		var preencheu = false;
    	var botoes = document.getElementsByName("cadastroCasoClinico:genero");
    	for(var i = 0; i < botoes.length; i++){
     	   if(botoes.item(i).checked)
      	      preencheu = true;
    	}
   		if(!preencheu){
   			alert(document.getElementById("cadastroCasoClinico:alertGenero").value);
   			document.getElementById("cadastroCasoClinico:nome").focus();
       	 	return false;
    	}
		//validar data de nascimento
   		if (document.getElementById("cadastroCasoClinico:dataNasc").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertDataNasc").value);
			document.getElementById("cadastroCasoClinico:dataNasc").focus();
			return false;
		}
   		//validar o formato da data de nascimento
		var data = document.getElementById("cadastroCasoClinico:dataNasc").value;
		var dia = data.substr(0,2);
		var mes = data.substr (3,2);
		var ano = data.substr (6,4);
		var b1 = data.substr(2,1);
		var b2 = data.substr(5,1);
		
		if(isNaN(dia) || isNaN(mes) || isNaN(ano) || b1 != "/" || b2 != "/"){
			alert(document.getElementById("cadastroCasoClinico:alertDataNascFormato").value);
			document.getElementById("cadastroCasoClinico:dataNasc").focus();
			return false;
		}		
   		//validar medicos quem atendem
   		if (document.getElementById("cadastroCasoClinico:medicos").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertMedicos").value);
			document.getElementById("cadastroCasoClinico:medicos").focus();
			return false;
		}
   		//validar ocupação
   		if (document.getElementById("cadastroCasoClinico:ocupacao").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertOcupacao").value);
			document.getElementById("cadastroCasoClinico:ocupacao").focus();
			return false;
		}
   		//validar moradia/família
   		if (document.getElementById("cadastroCasoClinico:moradiaFamilia").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertMoradiaFamilia").value);
			document.getElementById("cadastroCasoClinico:moradiaFamilia").focus();
			return false;
		}
   		//validar plano de saúde
   		if (document.getElementById("cadastroCasoClinico:planoSaude").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertPlanoSaude").value);
			document.getElementById("cadastroCasoClinico:planoSaude").focus();
			return false;
		}
		//validar razão do encontro 
   		if (document.getElementById("cadastroCasoClinico:razaoEnc").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertRazaoEnc").value);
			document.getElementById("cadastroCasoClinico:razaoEnc").focus();
			return false;
		}
		//validar todos os campos de experiência com medicamentos 
   		if (document.getElementById("cadastroCasoClinico:experienciaMedicamentos1").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertExpMedicamentos").value);
			document.getElementById("cadastroCasoClinico:experienciaMedicamentos1").focus();
			return false;
		}
   		if (document.getElementById("cadastroCasoClinico:experienciaMedicamentos2").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertExpMedicamentos").value);
			document.getElementById("cadastroCasoClinico:experienciaMedicamentos2").focus();
			return false;
		}
   		if (document.getElementById("cadastroCasoClinico:experienciaMedicamentos3").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertExpMedicamentos").value);
			document.getElementById("cadastroCasoClinico:experienciaMedicamentos3").focus();
			return false;
		}
   		if (document.getElementById("cadastroCasoClinico:experienciaMedicamentos4").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertExpMedicamentos").value);
			document.getElementById("cadastroCasoClinico:experienciaMedicamentos4").focus();
			return false;
		}
   		if (document.getElementById("cadastroCasoClinico:experienciaMedicamentos5").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertExpMedicamentos").value);
			document.getElementById("cadastroCasoClinico:experienciaMedicamentos5").focus();
			return false;
		}

		//validar história médica pregressa 
   		if (document.getElementById("cadastroCasoClinico:historiaMedicaPregressa").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertHistMedicaPregressa").value);
			document.getElementById("cadastroCasoClinico:historiaMedicaPregressa").focus();
			return false;
		}

   		//validar história familiar
   		if (document.getElementById("cadastroCasoClinico:historiafamiliar").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertHistFamiliar").value);
			document.getElementById("cadastroCasoClinico:historiafamiliar").focus();
			return false;
		}
		
   		//validar fuma?
		var preencheu = false;
    	var botoes = document.getElementsByName("cadastroCasoClinico:flFuma");
    	for(var i = 0; i < botoes.length; i++){
     	   if(botoes.item(i).checked)
      	      preencheu = true;
    	}
   		if(!preencheu){
   			alert(document.getElementById("cadastroCasoClinico:alertFuma").value);
       	 return false;
    	}
   		//validar bebe café?
		var preencheu = false;
    	var botoes = document.getElementsByName("cadastroCasoClinico:flBebeCafe");
    	for(var i = 0; i < botoes.length; i++){
     	   if(botoes.item(i).checked)
      	      preencheu = true;
    	}
   		if(!preencheu){
   			alert(document.getElementById("cadastroCasoClinico:alertBebeCafe").value);
       	 return false;
    	}
   		//validar bebe alcool?
		var preencheu = false;
    	var botoes = document.getElementsByName("cadastroCasoClinico:flBebeAlcool");
    	for(var i = 0; i < botoes.length; i++){
     	   if(botoes.item(i).checked)
      	      preencheu = true;
    	}
   		if(!preencheu){
   			alert(document.getElementById("cadastroCasoClinico:alertBebeAlcool").value);
       	 return false;
    	}
   		//validar peso
   		if (document.getElementById("cadastroCasoClinico:peso").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertPeso").value);
			document.getElementById("cadastroCasoClinico:peso").focus();
			return false;
		}
   		//validar altura
   		if (document.getElementById("cadastroCasoClinico:altura").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertAltura").value);
			document.getElementById("cadastroCasoClinico:altura").focus();
			return false;
		}
   		//validar pressao sistólica
   		if (document.getElementById("cadastroCasoClinico:pressaoSist").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertPressaoSist").value);
			document.getElementById("cadastroCasoClinico:pressaoSist").focus();
			return false;
		}
   		//validar pressao diastólica
   		if (document.getElementById("cadastroCasoClinico:pressaoDiast").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertPressaoDiast").value);
			document.getElementById("cadastroCasoClinico:pressaoDiast").focus();
			return false;
		}
   		//validar temperatura
   		if (document.getElementById("cadastroCasoClinico:temperatura").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertTemperatura").value);
			document.getElementById("cadastroCasoClinico:temperatura").focus();
			return false;
		}
   		//validar alergias
   		if (document.getElementById("cadastroCasoClinico:alergias").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertAlergias").value);
			document.getElementById("cadastroCasoClinico:alergias").focus();
			return false;
		}
   		//validar peso evolução
   		if (document.getElementById("cadastroCasoClinico:pesoEvolu").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertPesoEvolu").value);
			document.getElementById("cadastroCasoClinico:pesoEvolu").focus();
			return false;
		}
   		//validar pressao sistólica evolução
   		if (document.getElementById("cadastroCasoClinico:pressaoSistEvolu").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertPressaoSistEvolu").value);
			document.getElementById("cadastroCasoClinico:pressaoSistEvolu").focus();
			return false;
		}
   		//validar pressao diastólica evolução
   		if (document.getElementById("cadastroCasoClinico:pressaoDiastEvolu").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertPressaoDiastEvolu").value);
			document.getElementById("cadastroCasoClinico:pressaoDiastEvolu").focus();
			return false;
		}
   		//validar temperatura evolução
   	 	//não está validando a temperatura, pois quando adiciona-se o id="temperaturaEvolu"
   	 	//no campo de temperatura não funciona
   		if (document.getElementById("cadastroCasoClinico:tempEvolu").value == ""){
			alert(document.getElementById("cadastroCasoClinico:alertTemperaturaEvolu").value);
			document.getElementById("cadastroCasoClinico:tempEvolu").focus();
			return false;
		}   	

		
		return true;
	}
</script>
</head>
<body>

<f:loadBundle basename="LocalizationResources" var="bundle"/>
<f:view>
<h:form id="cadastroCasoClinico" onsubmit="return validaForm()">
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
						<h:commandLink action="upload" immediate="true">
							<h:graphicImage value="#{bundle.bntAdicionarFoto}" style="border: 0"></h:graphicImage>
						</h:commandLink>
						<br><br>
						<h2><h:outputText value="#{bundle.tituloAddCasoClinico}"></h:outputText></h2>
						<br>
						<br>
						<fieldset>
						<legend><h:outputText value="#{bundle.relatoCasos}"></h:outputText></legend> 
						<h:panelGroup id="relatos" layout="block" styleClass="field">
							<h:outputText value="#{bundle.casoInicial}"></h:outputText>
							<br>
							<h:inputTextarea id="relatoDeCasoPrimeiraConsulta" style="height: 140px"
								value="#{casoClinicoBean.relatoDeCasoPrimeiraConsulta}"
								required="true" styleClass="field_text"></h:inputTextarea>
							<br><br>
							<h:outputText value="#{bundle.casoEvolucao}"></h:outputText>
							<br>
							<h:inputTextarea id="relatoDeCasoSegundaConsulta" style="height: 140px"
								value="#{casoClinicoBean.relatoDeCasoSegundaConsulta}"
								required="true" styleClass="field_text"></h:inputTextarea>
							<br><br>
							<h:outputText value="#{bundle.casoEvolucao3}"></h:outputText>
							<br>
							<h:inputTextarea id="relatoDeCasoTerceiraConsulta" style="height: 140px"
								value="#{casoClinicoBean.relatoDeCasoTerceiraConsulta}"
								required="true" styleClass="field_text"></h:inputTextarea>
							<br><br>
							<h:outputText value="#{bundle.casoEvolucao4}"></h:outputText>
							<br>
							<h:inputTextarea id="relatoDeCasoQuartaConsulta" style="height: 140px"
								value="#{casoClinicoBean.relatoDeCasoQuartaConsulta}"
								required="true" styleClass="field_text"></h:inputTextarea>
							<br>
						</h:panelGroup>
						</fieldset>
						<br>
						<fieldset>
						<legend><h:outputText value="#{bundle.dadosDemAnt}"></h:outputText></legend> 
						<h:panelGroup id="demoAntro" layout="block" styleClass="field">
							<h:outputText value="#{bundle.nome}"></h:outputText>
							<br>
							<h:inputText id="nome" value="#{casoClinicoBean.nome}" required="true"
								styleClass="field_text"></h:inputText>
							<br>
							<h:outputText value="#{bundle.genero}"></h:outputText>
							<br>
							<h:selectOneRadio id="genero" value="#{casoClinicoBean.genero}"
								required="true">
								<f:selectItem itemValue="M" id="M" itemLabel="#{bundle.masculino}" />
								<f:selectItem itemValue="F" id="F" itemLabel="#{bundle.feminino}" />
							</h:selectOneRadio>
							<br>
							<h:outputText value="#{bundle.dataNasc}"></h:outputText>
							<br>
							<h:inputText id="dataNasc" value="#{casoClinicoBean.dataNascimentoAuxiliar}"
								required="true" styleClass="field_text"></h:inputText>
							<br>
							<h:outputText value="#{bundle.medicos}"></h:outputText>
							<br>
							<h:inputText id="medicos" value="#{casoClinicoBean.medicosQueAtendem}"
								required="true" styleClass="field_text"></h:inputText>
							<br>
							<h:outputText value="#{bundle.ocupacao}"></h:outputText>
							<br>
							<h:inputText id="ocupacao" value="#{casoClinicoBean.ocupacao}" required="true"
								styleClass="field_text"></h:inputText>
							<br>
							<h:outputText value="#{bundle.escolaridade}"></h:outputText>
							<br>
							<h:selectOneMenu id="anoInitCurso"
								value="#{casoClinicoBean.escolaridade}" required="true"
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
							<h:inputText id="moradiaFamilia" value="#{casoClinicoBean.moradiaFamilia}"
								required="true" styleClass="field_text"></h:inputText>
							<br>
							<h:outputText value="#{bundle.planoSaude}"></h:outputText>
							<br>
							<h:inputText id="planoSaude" value="#{casoClinicoBean.planoDeSaude}"
								required="true" styleClass="field_text"></h:inputText>
							<br>
						</h:panelGroup>
						</fieldset>
						<br>
						
						<fieldset>
						<legend><h:outputText value="#{bundle.razaoEncontro}"></h:outputText></legend> 
						<h:panelGroup id="razaoEnc" layout="block" styleClass="field">
							<h:selectOneMenu value="#{casoClinicoBean.razaoEncontro}" style="width: 90%;">
								<f:selectItems value="#{opcoesBean.listaRazaoEncontro}" />
							</h:selectOneMenu>																				
						</h:panelGroup>
						</fieldset>
						<br>
						
						<fieldset>
						<legend><h:outputText value="#{bundle.experienciaMedicamentos}"></h:outputText></legend> 
						<h:panelGroup id="experienciaMedicamentos" layout="block" styleClass="field" style="width: 100%;">	
						<h:panelGrid border="0" columns="2" style="width: 100%;">
							<h:panelGrid columns="1">
								<h:outputText value="#{bundle.experienciaMedicamentos1}"></h:outputText>
								<h:selectOneMenu value="#{casoClinicoBean.experienciaMedicamentos1}" style="width: 97%;">
									<f:selectItems value="#{opcoesBean.listaExperienciaMedicamentos1}" />
								</h:selectOneMenu>	
							</h:panelGrid>
							<h:panelGrid columns="1">
								<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>								
								<h:selectOneRadio id="necessidadeAtencao1" value="#{casoClinicoBean.necessidadeAtencao1}">
									<f:selectItem itemLabel="#{bundle.sim}" itemValue="V" id="necessidade1True" />
									<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="necessidade1False" />
								</h:selectOneRadio>								
							</h:panelGrid>
							
							<h:panelGrid columns="1">
								<h:outputText value="#{bundle.experienciaMedicamentos2}"></h:outputText>								
								<h:selectOneMenu value="#{casoClinicoBean.experienciaMedicamentos2}" style="width: 97%;">
									<f:selectItems value="#{opcoesBean.listaExperienciaMedicamentos2}" />
								</h:selectOneMenu>	
							</h:panelGrid>
							<h:panelGrid columns="1">
								<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>								
								<h:selectOneRadio id="necessidadeAtencao2" value="#{casoClinicoBean.necessidadeAtencao2}">
									<f:selectItem itemLabel="#{bundle.sim}" itemValue="V" id="necessidade2True" />
									<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="necessidade2False" />
								</h:selectOneRadio>								
							</h:panelGrid>							
							
							<h:panelGrid columns="1">
								<h:outputText value="#{bundle.experienciaMedicamentos3}"></h:outputText>								
								<h:selectOneMenu value="#{casoClinicoBean.experienciaMedicamentos3}" style="width: 97%;">
									<f:selectItems value="#{opcoesBean.listaExperienciaMedicamentos3}" />
								</h:selectOneMenu>	
							</h:panelGrid>
							<h:panelGrid columns="1">
								<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>								
								<h:selectOneRadio id="necessidadeAtencao3" value="#{casoClinicoBean.necessidadeAtencao3}">
									<f:selectItem itemLabel="#{bundle.sim}" itemValue="V" id="necessidade3True" />
									<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="necessidade3False" />
								</h:selectOneRadio>								
							</h:panelGrid>
							
							<h:panelGrid columns="1">
								<h:outputText value="#{bundle.experienciaMedicamentos4}"></h:outputText>								
								<h:selectOneMenu value="#{casoClinicoBean.experienciaMedicamentos4}" style="width: 97%;">
									<f:selectItems value="#{opcoesBean.listaExperienciaMedicamentos4}" />
								</h:selectOneMenu>	
							</h:panelGrid>
							<h:panelGrid columns="1">
								<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>								
								<h:selectOneRadio id="necessidadeAtencao4" value="#{casoClinicoBean.necessidadeAtencao4}">
									<f:selectItem itemLabel="#{bundle.sim}" itemValue="V" id="necessidade4True" />
									<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="necessidade4False" />
								</h:selectOneRadio>								
							</h:panelGrid>
							
							<h:panelGrid columns="1">
								<h:outputText value="#{bundle.experienciaMedicamentos5}"></h:outputText>								
								<h:selectOneMenu value="#{casoClinicoBean.experienciaMedicamentos5}" style="width: 97%;">
									<f:selectItems value="#{opcoesBean.listaExperienciaMedicamentos5}" />
								</h:selectOneMenu>	
							</h:panelGrid>
							<h:panelGrid columns="1">
								<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>								
								<h:selectOneRadio id="necessidadeAtencao5" value="#{casoClinicoBean.necessidadeAtencao5}">
									<f:selectItem itemLabel="#{bundle.sim}" itemValue="V" id="necessidade5True" />
									<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="necessidade5False" />
								</h:selectOneRadio>								
							</h:panelGrid>
							
							<h:panelGrid columns="1">
								<h:outputText value="#{bundle.conclusao}"></h:outputText>								
								<h:selectOneMenu value="#{casoClinicoBean.experienciaMedicamentosConc}" style="width: 97%;">
									<f:selectItems value="#{opcoesBean.listaExperienciaMedicamentosConc}" />
								</h:selectOneMenu>	
							</h:panelGrid>							
						</h:panelGrid>											
						</h:panelGroup>
						</fieldset>
						<br>
																
						<fieldset>
						<legend> <h:outputText value="#{bundle.medicamentosAnteriores}"></h:outputText></legend> 
						<h:panelGroup id="medAnt" layout="block" styleClass="field">
						<h:panelGrid border="0" columns="2">
							<h:panelGroup>
								<h:panelGrid border="0" columns="2" style="width: 343px">
									<h:outputText value="#{bundle.medicamento}:"></h:outputText>
									<h:selectOneMenu value="#{casoClinicoBean.antDescricao}">
										<f:selectItems value="#{opcoesBean.listaMedicamentos}" />
									</h:selectOneMenu>			
									
									<h:outputText value="#{bundle.indicacao}:"></h:outputText>
									<h:inputText id="antIndicacao" value="#{casoClinicoBean.antIndicacao}" />
									
									<h:outputText value="#{bundle.resposta}:"></h:outputText>
									<h:inputText id="antResposta" value="#{casoClinicoBean.antResposta}" />
									
									<h:outputText value="#{bundle.periodo}:"></h:outputText>
									<h:inputText id="antPeriodo" value="#{casoClinicoBean.antPeriodo}" />
								</h:panelGrid>
								<h:commandButton value="#{bundle.bntAdicionar}" onclick="return validaMedicamentosAnteriores()"
									 action="#{casoClinicoBean.addMedicamentoAnterior}"></h:commandButton>
							</h:panelGroup>
							<h:dataTable title="teste" styleClass="dataTables"
								rendered="#{not empty casoClinicoBean.listaMedicamentoAnt}"
								border="1" value="#{casoClinicoBean.listaMedicamentoAnt}"
								var="currentParametro" headerClass="headerDataTable" rowClasses="odd, even">
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
								<h:column id="column5">
									<h:commandLink
										actionListener="#{casoClinicoBean.removeMedicamentoAnt}">
										<h:outputText value="#{bundle.remover}" />
										<f:param id="removeAnt" name="obj" value="#{currentParametro}" />
									</h:commandLink>
								</h:column>
							</h:dataTable>						
						
						</h:panelGrid>
						</h:panelGroup>
						</fieldset>
						<br>
						
						<fieldset>
						<legend><h:outputText value="#{bundle.historias}"></h:outputText></legend> 
						<h:panelGroup id="historias" layout="block" styleClass="field">
							<h:outputText value="#{bundle.historiaMedicaPregressa}"></h:outputText>
							<br>
							<h:selectOneMenu value="#{casoClinicoBean.historiaMedicaPregressa}" style="width: 80%;">
								<f:selectItems value="#{opcoesBean.listaHistoriaMedicaPregressa}" />
							</h:selectOneMenu>			
							<br><br>
							<h:outputText value="#{bundle.historiafamiliar}"></h:outputText>
							<br>
							<h:selectOneMenu value="#{casoClinicoBean.historiafamiliar}" style="width: 80%;">
								<f:selectItems value="#{opcoesBean.listaHistoriaFamiliar}" />
							</h:selectOneMenu>								
							<br>
						</h:panelGroup>
						</fieldset>
						<br>
						<fieldset>
						<legend><h:outputText value="#{bundle.estilosVida}"></h:outputText></legend> 
						<h:panelGroup
							id="estilosVida" layout="block" styleClass="field">
							<h:panelGrid border="1" columns="4" styleClass="dataTables, tableEstilosDeVida" rowClasses="headerDataTable, odd, even, odd">
								<h:outputText value="#{bundle.substancia}"></h:outputText>
								<h:outputText value="#{bundle.consumo}"></h:outputText>
								<h:outputText value="#{bundle.histUso}"></h:outputText>
								<h:outputText value="#{bundle.histUsoAnterior}"></h:outputText>
								<h:outputText value="#{bundle.tabaco}"></h:outputText>
								<h:selectOneRadio id="flFuma" value="#{casoClinicoBean.flFuma}"
									required="true">
									<f:selectItem itemLabel="#{bundle.fazUso}" itemValue="V" id="flFumaTrue" />
									<f:selectItem itemLabel="#{bundle.naoFazUs}" itemValue="F" id="flFumaFalse" />
								</h:selectOneRadio>
								<h:selectOneRadio id="historiaTabacoAtual"
									value="#{casoClinicoBean.historiaTabacoAtual}" required="false">
									<f:selectItem itemLabel="#{bundle.tabaco0a10}" itemValue="0-10 cigarros por dia" id="tabaco0a10" />
									<f:selectItem itemLabel="#{bundle.tabaco10a20}" itemValue="10-20 cigarros por dia" id="tabaco10a20" />
									<f:selectItem itemLabel="#{bundle.tabaco2ouMaisMacos}" itemValue="> 1 maço/dia"
										id="tabaco2ouMaisMacos" />
								</h:selectOneRadio>
								<h:panelGroup> 
				<h:outputText value="#{bundle.tempoParou}"></h:outputText>
								<h:inputText value="#{casoClinicoBean.historiaTabacoAnterior}"></h:inputText>
								</h:panelGroup>
								<h:outputText value="#{bundle.cafe}"></h:outputText>
								<h:selectOneRadio id="flBebeCafe" value="#{casoClinicoBean.flBebeCafe}" required="true">
									<f:selectItem itemLabel="#{bundle.fazUso}" itemValue="V" id="flBebeCafeTrue" />
									<f:selectItem itemLabel="#{bundle.naoFazUs}" itemValue="F" id="flBebeCafeFalse" />
								</h:selectOneRadio>
								<h:selectOneRadio id="historiaCafeAtual" value="#{casoClinicoBean.historiaCafeAtual}">
									<f:selectItem itemLabel="#{bundle.cafeMenor2}" itemValue="< 2 xícaras/dia" id="cafeMenor2" />
									<f:selectItem itemLabel="#{bundle.cafe2a6}" itemValue="2-6 xícaras/dia" id="cafe2a6" />
									<f:selectItem itemLabel="#{bundle.cafeMaior6}" itemValue="> 6 xícaras/dia" id="cafeMaior6" />
								</h:selectOneRadio>
								<h:panelGroup>
				<h:outputText value="#{bundle.tempoParou}"></h:outputText>
								 <h:inputText
										value="#{casoClinicoBean.historiaCafeAnterior}"></h:inputText>
								</h:panelGroup>
								<h:outputText value="#{bundle.alcool}"></h:outputText>
								<h:selectOneRadio id="flBebeAlcool" value="#{casoClinicoBean.flBebeAlcool}" required="true">
									<f:selectItem itemLabel="#{bundle.fazUso}" itemValue="V" id="flBebeAlcoolTrue" />
									<f:selectItem itemLabel="#{bundle.naoFazUs}" itemValue="F" id="flBebeAlcoolFalse" />
								</h:selectOneRadio>
								<h:panelGroup>
				<h:outputText value="#{bundle.tipoBebida}"></h:outputText>
									<h:inputText
										value="#{casoClinicoBean.tipoBebidaAlcoolica}"></h:inputText>
									<br>
									<h:selectOneRadio id="historiaAlcoolAtual" value="#{casoClinicoBean.historiaAlcoolAtual}">
										<f:selectItem itemLabel="#{bundle.alcoolMenor2}" itemValue="< 2 copos/semana" id="alcoolMenor2" />
										<f:selectItem itemLabel="#{bundle.alcool2a6}" itemValue="2-6 copos/semana" id="alcool2a6" />
										<f:selectItem itemLabel="#{bundle.alcoolMaior6}"itemValue="> 6 copos/semana" id="alcoolMaior6" />
									</h:selectOneRadio>
								</h:panelGroup>
								<h:panelGroup>
				<h:outputText value="#{bundle.tempoParou}"></h:outputText>
								<h:inputText
										value="#{casoClinicoBean.historiaAlcoolAnterior}"></h:inputText>
								</h:panelGroup>
							</h:panelGrid>
						</h:panelGroup>
						</fieldset>		
						
						<br>
						<fieldset>
						<legend><h:outputText value="#{bundle.paramClinicos}"></h:outputText></legend>
						 <h:panelGroup id="paramClin" layout="block" styleClass="field">
		
						<h:panelGrid border="0" columns="2">
		
							<h:panelGroup>
								<h:panelGrid border="0" columns="2" style="width: 343px">
									<h:outputText value="#{bundle.descricao}:"></h:outputText>									
									<h:selectOneMenu id="paramDesc" value="#{casoClinicoBean.descricao}">
										<f:selectItems value="#{casoClinicoBean.paramClinicosItens}"/>
									</h:selectOneMenu>															
									<h:outputText value="#{bundle.valor}:"></h:outputText>
									<h:inputText id="paramValor" style="width: 83px"
										value="#{casoClinicoBean.valorString}"></h:inputText>
									<h:outputText value="#{bundle.valorRef}:"></h:outputText>
									<h:inputText id="paramValorRef" style="width: 83px"
										value="#{casoClinicoBean.valorDeReferencia}"></h:inputText>
									<h:outputText value="#{bundle.unidade}:"></h:outputText>
									<h:inputText id="paramUnidade" style="width: 83px"
										value="#{casoClinicoBean.unidade}"></h:inputText>
								</h:panelGrid>
								<h:commandButton id="add" value="#{bundle.bntAdicionar}" onclick="return validarParamClinicos()"
									action="#{casoClinicoBean.addParam}"></h:commandButton>
							</h:panelGroup>
							<h:dataTable
								rendered="#{not empty casoClinicoBean.listaParametros}" border="1" styleClass="dataTables"
								value="#{casoClinicoBean.listaParametros}" var="currentParametro"  headerClass="headerDataTable" rowClasses="odd, even">
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
								<h:column id="column5">
									<h:commandLink
										actionListener="#{casoClinicoBean.removeParametro}">
										<h:outputText value="#{bundle.remover}" />
										<f:param id="removePa" name="obj" value="#{currentParametro}" />
									</h:commandLink>
								</h:column>
		
							</h:dataTable>
						</h:panelGrid>
						</h:panelGroup>
						</fieldset>
						
						<br>
						<fieldset>
						<legend><h:outputText value="#{bundle.examesFisicos}"></h:outputText></legend> 
						<h:panelGroup id="examesFisicos" layout="block" styleClass="field">
							<h:panelGrid border="0" columns="2" style="width: 343px">
								<h:outputText value="#{bundle.peso}"></h:outputText>
								<h:panelGroup>
									<h:inputText id="peso" value="#{casoClinicoBean.pesoString}" style="width: 44px" required="true"></h:inputText>
									<h:outputText value=" #{bundle.unidadePeso}"></h:outputText>
								</h:panelGroup>
								
								<h:outputText value="#{bundle.altura}"></h:outputText>
								<h:panelGroup>
									<h:inputText id="altura" value="#{casoClinicoBean.alturaString}" style="width: 44px" required="true"></h:inputText>
									<h:outputText value=" #{bundle.unidadeAltura}"></h:outputText>
								</h:panelGroup>
								
								<h:outputText value="#{bundle.pressaoArt}"></h:outputText>
								<h:panelGroup>
									<h:inputText id="pressaoSist" style="width: 44px"
										value="#{casoClinicoBean.pressaoSistolicaString}"
										required="true"></h:inputText> 
									X	
									<h:inputText id="pressaoDiast" style="width: 44px"
										value="#{casoClinicoBean.pressaoDiastolicaString}"
										required="true"></h:inputText>
									<h:outputText value=" #{bundle.unidadePressao}"></h:outputText>
								</h:panelGroup>

								<h:outputText value="#{bundle.temperatura}"></h:outputText>
								<h:panelGroup>
									<h:inputText id="temperatura" value="#{casoClinicoBean.temperaturaString}" style="width: 44px" required="true"></h:inputText>
									<h:outputText value=" #{bundle.unidadeGlicemia}"></h:outputText>
								</h:panelGroup>	
								
								<h:outputText value="#{bundle.alergias}"></h:outputText>
								<h:selectOneMenu value="#{casoClinicoBean.alergias}">
									<f:selectItems value="#{opcoesBean.listaAlergias}" />
								</h:selectOneMenu>									
							</h:panelGrid>
				</h:panelGroup>
				</fieldset>

				<br>
				<fieldset>
				<legend>
				<h:outputText value="#{bundle.examesFisicosEvolu}"></h:outputText></legend>
				 <h:panelGroup id="examesFisicosEvol" layout="block" styleClass="field">
				<h:panelGrid border="0" columns="2" style="width: 300px">
					<h:outputText value="#{bundle.peso}"></h:outputText>
					<h:panelGroup>
						<h:inputText id="pesoEvolu" value="#{casoClinicoBean.peso2String}" style="width: 44px" required="true"></h:inputText>
						<h:outputText value=" #{bundle.unidadePeso}"></h:outputText>
					</h:panelGroup>
					<h:outputText value="#{bundle.pressaoArt}"></h:outputText>
					<h:panelGroup>
						<h:inputText id="pressaoSistEvolu" style="width: 44px"
							value="#{casoClinicoBean.pressaoSistolica2String}"
							required="true"></h:inputText>
						X
						<h:inputText id="pressaoDiastEvolu" style="width: 44px"
							value="#{casoClinicoBean.pressaoDiastolica2String}"
							required="true"></h:inputText>
						<h:outputText value=" #{bundle.unidadePressao}"></h:outputText>
					</h:panelGroup>
					<h:outputText value="#{bundle.temperatura}"></h:outputText>
					<h:panelGroup>					
						<h:inputText value="#{casoClinicoBean.temperatura2String}" style="width: 44px"></h:inputText>
						<h:outputText value=" #{bundle.unidadeGlicemia}"></h:outputText>
					</h:panelGroup>
				</h:panelGrid>
				</h:panelGroup>
				</fieldset>
				
				<br>
				
				
				<fieldset>
				<legend> <h:outputText value="#{bundle.medicamentosNaoPresc}"></h:outputText></legend> 
				<h:panelGroup id="medNP" layout="block" styleClass="field">

				<h:panelGrid border="0" columns="2">
					<h:panelGroup>
						<h:panelGrid border="0" columns="2" style="width: 343px">
							<h:outputText value="#{bundle.nomeGenerico}:"></h:outputText>
							<h:selectOneMenu value="#{casoClinicoBean.NPDescricao}">
								<f:selectItems value="#{opcoesBean.listaMedicamentos}" />
							</h:selectOneMenu>								
							<h:outputText value="#{bundle.fitoterapico}"></h:outputText>
							<h:selectBooleanCheckbox value="#{casoClinicoBean.flItalicoNP}"></h:selectBooleanCheckbox>
							<h:outputText value="#{bundle.dosagem}:"></h:outputText>
							<h:inputText id="NPDosagem" value="#{casoClinicoBean.NPDosagem}"></h:inputText>
							<h:outputText value="#{bundle.posologia}:"></h:outputText>
							<h:inputText id="NPPosologia" value="#{casoClinicoBean.NPPosologia}"></h:inputText>
						</h:panelGrid>
						<h:commandButton value="#{bundle.bntAdicionar}" onclick="return validarMedicamentosNP()"
							action="#{casoClinicoBean.addMedicamentoNPre}"></h:commandButton>
					</h:panelGroup>
					<h:dataTable title="teste" styleClass="dataTables"
						rendered="#{not empty casoClinicoBean.listaMedicamentoNP}"
						border="1" value="#{casoClinicoBean.listaMedicamentoNP}"
						var="currentParametro" headerClass="headerDataTable" rowClasses="odd, even">
						<h:column id="column1">
							<h:outputText rendered="#{not currentParametro.flItalico}"
								value="#{currentParametro.descricao}" />
							<h:outputText rendered="#{currentParametro.flItalico}"
								value="#{currentParametro.descricao}" style="font-style: italic" />
							<f:facet name="header">
								<h:outputText value="#{bundle.nomeGenerico}" />
							</f:facet>
						</h:column>
						<h:column id="column2">
							<h:outputText value="#{currentParametro.dosagem}" />
							<f:facet name="header">
								<h:outputText value="#{bundle.dosagem}" />
							</f:facet>
						</h:column>
						<h:column id="column3">
							<h:outputText value="#{currentParametro.posologia}" />
							<f:facet name="header">
								<h:outputText value="#{bundle.posologia}" />
							</f:facet>
						</h:column>
						<h:column id="column4">
							<h:commandLink
								actionListener="#{casoClinicoBean.removeMedicamentoNP}">
								<h:outputText value="#{bundle.remover}" />
								<f:param id="removeMNP" name="obj" value="#{currentParametro}" />
							</h:commandLink>
						</h:column>

					</h:dataTable>
				</h:panelGrid>
				</h:panelGroup>
				</fieldset>

				<br>
				<fieldset>
				<legend><h:outputText value="#{bundle.medicamentosPresc}"></h:outputText></legend> 
				<h:panelGroup id="medP" layout="block" styleClass="field">

				<h:panelGrid border="0" columns="2">

					<h:panelGroup>
						<h:panelGrid border="0" columns="2" style="width: 343px">
							<h:outputText value="#{bundle.nomeGenerico}:"></h:outputText>
							<h:selectOneMenu value="#{casoClinicoBean.PDescricao}">
								<f:selectItems value="#{opcoesBean.listaMedicamentos}" />
							</h:selectOneMenu>
							<h:outputText value="#{bundle.fitoterapico}"></h:outputText>
							<h:selectBooleanCheckbox value="#{casoClinicoBean.flItalicoP}"></h:selectBooleanCheckbox>
							<h:outputText value="#{bundle.dosagem}:"></h:outputText>
							<h:inputText id="PDosagem" value="#{casoClinicoBean.PDosagem}"></h:inputText>
							<h:outputText value="#{bundle.posologia}:"></h:outputText>
							<h:inputText id="PPosologia" value="#{casoClinicoBean.PPosologia}"></h:inputText>
							<h:outputText value="#{bundle.nomePrescritor}:"></h:outputText>
							<h:inputText id="pnmMedico" value="#{casoClinicoBean.pnmMedico}"></h:inputText>
							<h:outputText value="#{bundle.especialidade}:"></h:outputText>
							<h:inputText id="PEspecializacaoMedico" value="#{casoClinicoBean.PEspecializacaoMedico}"></h:inputText>
						</h:panelGrid>
						<h:commandButton value="#{bundle.bntAdicionar}" onclick="return validarMedicamentosP()"
							action="#{casoClinicoBean.addMedicamentoPre}"></h:commandButton>
					</h:panelGroup>
					<h:dataTable
						rendered="#{not empty casoClinicoBean.listaMedicamentoP}" styleClass="dataTables"
						border="1" value="#{casoClinicoBean.listaMedicamentoP}"
						var="currentParametro"  headerClass="headerDataTable" rowClasses="odd, even">
						<h:column id="column1">
							<h:outputText rendered="#{not currentParametro.flItalico}"
								value="#{currentParametro.descricao}" />
							<h:outputText rendered="#{currentParametro.flItalico}"
								value="#{currentParametro.descricao}" style="font-style: italic" />

							<f:facet name="header">
								<h:outputText value="#{bundle.nomeGenerico}" />
							</f:facet>
						</h:column>
						<h:column id="column2">
							<h:outputText value="#{currentParametro.dosagem}" />
							<f:facet name="header">
								<h:outputText value="#{bundle.dosagem}" />
							</f:facet>
						</h:column>
						<h:column id="column3">
							<h:outputText value="#{currentParametro.posologia}" />
							<f:facet name="header">
								<h:outputText value="#{bundle.posologia}" />
							</f:facet>
						</h:column>
						<h:column id="column4">
							<h:outputText value="#{currentParametro.nmmedico}" />
							<f:facet name="header">
								<h:outputText value="#{bundle.nomePrescritor}" />
							</f:facet>
						</h:column>
						<h:column id="column5">
							<h:outputText value="#{currentParametro.especialidademedico}" />
							<f:facet name="header">
								<h:outputText value="#{bundle.especialidade}" />
							</f:facet>
						</h:column>
						<h:column id="column6">
							<h:commandLink
								actionListener="#{casoClinicoBean.removeMedicamentoP}">
								<h:outputText value="#{bundle.remover}" />
								<f:param id="removeMP" name="obj" value="#{currentParametro}" />
							</h:commandLink>
						</h:column>

					</h:dataTable>
				</h:panelGrid>
				</h:panelGroup>
				</fieldset>
				
				<br>	
				<fieldset>
				<legend><h:outputText value="#{bundle.proxEncontro}"></h:outputText></legend>
				<h:panelGroup layout="block" styleClass="field">
				<h:inputTextarea value="#{casoClinicoBean.proxEncontro}" style="height: 140px;"
								styleClass="field_text"> </h:inputTextarea>
				</h:panelGroup>
				</fieldset>
				<br>
				
				<fieldset>
				<legend><h:outputText value="#{bundle.diarioPessoalMed}"></h:outputText></legend>
				<h:panelGroup layout="block" id="diarioMedicamentos" styleClass="field">
				<h:panelGrid border="0" columns="2">
					<h:panelGroup>
						<h:panelGrid border="0" columns="2" style="width: 343px">
							<h:outputText value="#{bundle.periodo}:"></h:outputText>
							<h:selectOneMenu value="#{casoClinicoBean.diarioMedPeriodo}">
								<f:selectItems value="#{casoClinicoBean.periodoItens}"/>
							</h:selectOneMenu>						
							<h:outputText value="#{bundle.horario}:"></h:outputText>
							<h:inputText value="#{casoClinicoBean.diarioMedHorario}"></h:inputText>
							
							<h:outputText value="#{bundle.quantidade}:"></h:outputText>
							<h:inputText value="#{casoClinicoBean.diarioMedQuantidade}"></h:inputText>
							
							<h:outputText value="#{bundle.medicamento}:"></h:outputText>
							<h:selectOneMenu value="#{casoClinicoBean.diarioMedDesc}">
								<f:selectItems value="#{opcoesBean.listaMedicamentos}" />
							</h:selectOneMenu>
							
							<h:outputText value="#{bundle.tipoBebida}"></h:outputText>
							<h:selectOneMenu value="#{casoClinicoBean.diarioMedBebida}">
								<f:selectItems value="#{casoClinicoBean.tipoBebidaItens}"/>
							</h:selectOneMenu>										
						</h:panelGrid>
						<h:commandButton value="#{bundle.bntAdicionar}" action="#{casoClinicoBean.addDiarioMedicamento}"></h:commandButton>
					</h:panelGroup>
					<h:dataTable title="teste" styleClass="dataTables"
						rendered="#{not empty casoClinicoBean.listaDiarioMed}"
						border="1" value="#{casoClinicoBean.listaDiarioMed}"
						var="currentParametro" headerClass="headerDataTable" rowClasses="odd, even">
						<h:column id="column1">
							<h:outputText value="#{currentParametro.periodo}" />
							<f:facet name="header">
								<h:outputText value="#{bundle.periodo}" />
							</f:facet>
						</h:column>
						<h:column id="column2">
							<h:outputText value="#{currentParametro.horario}" />
							<f:facet name="header">
								<h:outputText value="#{bundle.horario}" />
							</f:facet>
						</h:column>
						<h:column id="column3">
							<h:outputText value="#{currentParametro.quantidade}" />
							<f:facet name="header">
								<h:outputText value="#{bundle.quantidade}" />
							</f:facet>
						</h:column>
						<h:column id="column4">
							<h:outputText value="#{currentParametro.medicamento}" />
							<f:facet name="header">
								<h:outputText value="#{bundle.medicamento}" />
							</f:facet>
						</h:column>
						<h:column id="column5">
							<h:outputText value="#{currentParametro.tipoBebida}" />
							<f:facet name="header">
								<h:outputText value="#{bundle.tipoBebida}" />
							</f:facet>
						</h:column>
						<h:column id="column6">
							<h:commandLink
								actionListener="#{casoClinicoBean.removeDiarioMed}">
								<h:outputText value="#{bundle.remover}" />
								<f:param id="removeDiarioMed" name="obj" value="#{currentParametro}" />
							</h:commandLink>
						</h:column>
					</h:dataTable>	
				</h:panelGrid>
				</h:panelGroup>
				</fieldset>								

				<br>
				<h:commandButton action="#{casoClinicoBean.pagina2}" value="#{bundle.avancar}"></h:commandButton>
				
				<h:inputText id="alertNome" style="display:none" value="#{bundle.alertNome}"></</h:inputText>			
				<h:inputText id="alertGenero" style="display:none" value="#{bundle.alertGenero}"></</h:inputText>	
				<h:inputText id="alertRelatoDeCasoPrimeiraConsulta" style="display:none" value="#{bundle.alertRelatoDeCasoPrimeiraConsulta}"></</h:inputText>
				<h:inputText id="alertRelatoDeCasoSegundaConsulta" style="display:none" value="#{bundle.alertRelatoDeCasoSegundaConsulta}"></</h:inputText>
				<h:inputText id="alertRelatoDeCasoTerceiraConsulta" style="display:none" value="#{bundle.alertRelatoDeCasoTerceiraConsulta}"></</h:inputText>
				<h:inputText id="alertDataNasc" style="display:none" value="#{bundle.alertDataNasc}"></</h:inputText>
				<h:inputText id="alertDataNascFormato" style="display:none" value="#{bundle.alertDataNascFormato}"></</h:inputText>
				<h:inputText id="alertMedicos" style="display:none" value="#{bundle.alertMedicos}"></</h:inputText>
				<h:inputText id="alertOcupacao" style="display:none" value="#{bundle.alertOcupacao}"></</h:inputText>
				<h:inputText id="alertMoradiaFamilia" style="display:none" value="#{bundle.alertMoradiaFamilia}"></</h:inputText>
				<h:inputText id="alertPlanoSaude" style="display:none" value="#{bundle.alertPlanoSaude}"></</h:inputText>
				<h:inputText id="alertRazaoEnc" style="display:none" value="#{bundle.alertRazaoEnc}"></</h:inputText>
				<h:inputText id="alertExpMedicamentos" style="display:none" value="#{bundle.alertExpMedicamentos}"></</h:inputText>
				<h:inputText id="alertMedicamentosAnteriores" style="display:none" value="#{bundle.alertMedicamentosAnteriores}"></</h:inputText>
				<h:inputText id="alertParamClinicos" style="display:none" value="#{bundle.alertParamClinicos}"></</h:inputText>
				<h:inputText id="alertMedicamentosNP" style="display:none" value="#{bundle.alertMedicamentosNP}"></</h:inputText>
				<h:inputText id="alertMedicamentosP" style="display:none" value="#{bundle.alertMedicamentosP}"></</h:inputText>
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
				<h:inputText id="alertPesoEvolu" style="display:none" value="#{bundle.alertPesoEvolu}"></</h:inputText>
				<h:inputText id="alertPressaoSistEvolu" style="display:none" value="#{bundle.alertPressaoSistEvolu}"></</h:inputText>
				<h:inputText id="alertPressaoDiastEvolu" style="display:none" value="#{bundle.alertPressaoDiastEvolu}"></</h:inputText>
				<h:inputText id="alertTemperaturaEvolu" style="display:none" value="#{bundle.alertTemperaturaEvolu}"></</h:inputText>
			
			
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