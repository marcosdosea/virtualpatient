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
	<h:panelGroup layout="block" id="mainContent" styleClass="mainContent">	
		<br>	
					
		<h2><h:outputText value="#{bundle.revisaoDadosCadastrados}"></h:outputText></h2>
		<br>
		<br>
		<h:panelGroup>
			<h:graphicImage value="#{casoClinicoBean.fotoFileName}"></h:graphicImage>
		</h:panelGroup>
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
			<br>
			<h:outputText value="#{bundle.casoEvolucao}"></h:outputText>
			<br>
			<h:inputTextarea id="relatoDeCasoSegundaConsulta" style="height: 140px"
				value="#{casoClinicoBean.relatoDeCasoSegundaConsulta}"
				required="true" styleClass="field_text"></h:inputTextarea>
			<br>
			<h:outputText value="#{bundle.casoEvolucao3}"></h:outputText>
			<br>
			<h:inputTextarea id="relatoDeCasoTerceiraConsulta" style="height: 140px"
				value="#{casoClinicoBean.relatoDeCasoTerceiraConsulta}"
				required="true" styleClass="field_text"></h:inputTextarea>
			<br>			
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
			<h:inputText value="#{casoClinicoBean.nome}"
				styleClass="field_text"></h:inputText>
			<br>
			<h:outputText value="#{bundle.genero}"></h:outputText>
			<br>
			<h:selectOneRadio id="genero" value="#{casoClinicoBean.genero}">
				<f:selectItem itemValue="M" id="M" itemLabel="#{bundle.masculino}" />
				<f:selectItem itemValue="F" id="F" itemLabel="#{bundle.feminino}" />
			</h:selectOneRadio>
			<br>
			<h:outputText value="#{bundle.dataNasc}"></h:outputText>
			<br>
			<h:inputText value="#{casoClinicoBean.dataNascimentoAuxiliar}"
				styleClass="field_text"></h:inputText>					
			<br>
			<h:outputText value="#{bundle.medicos}"></h:outputText>
			<br>	
			<h:inputText value="#{casoClinicoBean.medicosQueAtendem}"
				styleClass="field_text"></h:inputText>
			<br>
			<h:outputText value="#{bundle.ocupacao}"></h:outputText>
			<br>
			<h:inputText value="#{casoClinicoBean.ocupacao}"
				styleClass="field_text"></h:inputText>
			<br>
			<h:outputText value="#{bundle.escolaridade}  "></h:outputText>
			<h:outputText id="anoInitCurso" value="#{casoClinicoBean.escolaridadeTraduzida}"></h:outputText>
			<br>
			<br>
			<h:outputText value="#{bundle.moradiaFamilia}"></h:outputText>
			<br>
			<h:inputText value="#{casoClinicoBean.moradiaFamilia}" 
				styleClass="field_text"></h:inputText>
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
		<fieldset><legend><h:outputText value="#{bundle.paramClinicos}"></h:outputText></legend>
		<h:panelGroup id="paramClin" layout="block" styleClass="field">			
			<h:dataTable border="1" rendered="#{not empty casoClinicoBean.listaParametros}" 
				value="#{casoClinicoBean.listaParametros}" var="currentParametro" 
				styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
				<h:column id="column1">
					<h:outputText value="#{currentParametro.descricao}"></h:outputText>
					<f:facet name="header">
						<h:outputText value="#{bundle.descricao}"></h:outputText>
					</f:facet>
				</h:column>
				<h:column id="column2">
					<h:outputText value="#{currentParametro.valor}"></h:outputText>
					<f:facet name="header">
						<h:outputText value="#{bundle.valor}"></h:outputText>
					</f:facet>
				</h:column>
				<h:column id="column3">
					<h:outputText value="#{currentParametro.unidade}"></h:outputText>
					<f:facet name="header">
						<h:outputText value="#{bundle.unidade}"></h:outputText>
					</f:facet>
				</h:column>
				<h:column id="column4">
					<h:outputText value="#{currentParametro.valorDeReferencia}"></h:outputText>
					<f:facet name="header">
						<h:outputText value="#{bundle.valorRef}"></h:outputText>
					</f:facet>
				</h:column>
			</h:dataTable>
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
		<legend><h:outputText value="#{bundle.medicamentosNaoPresc}"></h:outputText></legend> 
		<h:panelGroup id="medNP" layout="block" styleClass="field">
			<h:dataTable border="1" rendered="#{not empty casoClinicoBean.listaMedicamentoNP}" 
				value="#{casoClinicoBean.listaMedicamentoNP}" var="currentParametro" 
				styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
				<h:column id="column1">
					<h:outputText value="#{currentParametro.descricao}"></h:outputText>
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
		</h:panelGroup>
		</fieldset>
		<br>
		
		<fieldset>
		<legend><h:outputText value="#{bundle.medicamentosPresc}"></h:outputText></legend> 
		<h:panelGroup id="medP" layout="block" styleClass="field">			
			<h:dataTable border="1" rendered="#{not empty casoClinicoBean.listaMedicamentoP}" 
				value="#{casoClinicoBean.listaMedicamentoP}" var="currentParametro" 
				styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
				
				<h:column id="column1">
					<h:outputText value="#{currentParametro.descricao}"></h:outputText>
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
					<h:outputText value="#{currentParametro.nmmedico}"></h:outputText>
					<f:facet name="header">
						<h:outputText value="#{bundle.nomePrescritor}"></h:outputText>
					</f:facet>
				</h:column>
				<h:column id="column5">
					<h:outputText value="#{currentParametro.especialidademedico}"></h:outputText>
					<f:facet name="header">
						<h:outputText value="#{bundle.especialidade}"></h:outputText>
					</f:facet>
				</h:column>				
			</h:dataTable>
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
		<h:panelGrid border="0" columns="1">
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
			</h:dataTable>	
		</h:panelGrid>
		</h:panelGroup>
		</fieldset>		
		
		<br>
		
		<fieldset>
		<legend><h:outputText value="#{bundle.avaliacaoQueixasIni}"></h:outputText></legend>
		<h:panelGroup layout="block" id="queixasIni" styleClass="field">
		<h:dataTable value="#{casoClinicoBean.queixasPRMPrimeiraEtapa}" var="currentQueixaResposta" >
			<h:column>
			<h:panelGrid columns="1">
			
				<h:panelGrid columns="4" styleClass="headerDataTableQueixas">				
					<h:outputText value="#{bundle.problemaSaude} -  #{currentQueixaResposta.descricao}"/>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.desde}" styleClass="headerDataTableQueixas"/>
						<h:inputText value="#{currentQueixaResposta.periodoSurgimento}"/>	
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="Tipo"  styleClass="headerDataTableQueixas"></h:outputText>
						<h:selectOneRadio id="DAorPRMPA" value="#{currentQueixaResposta.tipo}">
							<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="D" id="DAPA"/>
							<f:selectItem itemLabel="#{bundle.suspeitaPRM}" itemValue="P" id="PRMPA"/>
						</h:selectOneRadio>
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.prioridade}"  styleClass="headerDataTableQueixas"/>
						<h:inputText value="#{currentQueixaResposta.prioridade}" style="width: 55px;" required="true"/>
					</h:panelGrid>
				</h:panelGrid>
				<h:panelGrid columns="1">
				 	<f:facet name="header">							
						<h:panelGrid columns="1">								
							<h:outputText value="#{bundle.medicamentos}" style="width: 300px; border: 5px solid #FFFFFF;"/>
						</h:panelGrid>	
					</f:facet>
					
					<h:panelGrid border="1" columns="1"  styleClass="dataTables" headerClass="headerGridQueixasMed" 
								rowClasses="oddQueixas, evenQueixas">
						<h:outputText value="#{bundle.descricao}" styleClass="headerDataTable"/>	
						<h:selectOneMenu value="#{currentQueixaResposta.descricaoMedicamento}" style="width: 95%;">
							<f:selectItems value="#{opcoesBean.listaMedicamentos}" />
						</h:selectOneMenu>										
					</h:panelGrid>
					
					<h:panelGrid border="1" columns="3"  styleClass="dataTables" headerClass="headerGridQueixasMed" 
								rowClasses="oddQueixas, evenQueixas" columnClasses="column1row2, column2row2, column3row2">
						<h:outputText value="#{bundle.dose}" style="width: 60px;" styleClass="headerDataTable"/>	
						<h:outputText value="#{bundle.desde}" style="width: 60px;" styleClass="headerDataTable"/>	
						<h:outputText value="#{bundle.suspeitaPRM}" styleClass="headerDataTable"/>
						
						<h:inputText value="#{currentQueixaResposta.dose}" style="width:90%; border: 5px solid #E4E5F9;"/>
						<h:inputText value="#{currentQueixaResposta.periodoMedicamento}" style="width:90%; border: 5px solid #E4E5F9;"/>
						<h:selectOneMenu value="#{currentQueixaResposta.numeroPRMMed}" style="font-size: small; border: 8px solid #E4E5F9;">
							<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
						</h:selectOneMenu>		
					</h:panelGrid>	
					
					<h:panelGrid border="1" columns="4"  styleClass="dataTables" headerClass="headerGridQueixasMed" rowClasses="oddQueixas, evenQueixas">
						<h:outputText value="#{bundle.necessario}" style="height: 100%;" styleClass="headerDataTable"/>
						<h:outputText value="#{bundle.efetivo}" styleClass="headerDataTable"/>
						<h:outputText value="#{bundle.seguro}" styleClass="headerDataTable"/>
						<h:outputText value="#{bundle.cumprimento}" styleClass="headerDataTable"/>
														
						<h:selectOneRadio value="#{currentQueixaResposta.necessario}" style="height: 100%;">
							<f:selectItem itemLabel="#{bundle.sim}" itemValue="V"/>
							<f:selectItem itemLabel="#{bundle.nao}" itemValue="F"/>
						</h:selectOneRadio>			
						<h:selectOneRadio value="#{currentQueixaResposta.efetivo}">
							<f:selectItem itemLabel="#{bundle.sim}" itemValue="V"/>
							<f:selectItem itemLabel="#{bundle.nao}" itemValue="F"/>
						</h:selectOneRadio>
						<h:selectOneRadio value="#{currentQueixaResposta.seguro}">
							<f:selectItem itemLabel="#{bundle.sim}" itemValue="V"/>
							<f:selectItem itemLabel="#{bundle.nao}" itemValue="F"/>
						</h:selectOneRadio>
						<h:selectOneRadio value="#{currentQueixaResposta.cumprimento}">
							<f:selectItem itemLabel="#{bundle.sim}" itemValue="V"/>
							<f:selectItem itemLabel="#{bundle.nao}" itemValue="F"/>
						</h:selectOneRadio>
					</h:panelGrid>		
					
					<h:panelGrid border="1" columns="1"  styleClass="dataTables" 
								headerClass="headerGridQueixasMed" rowClasses="oddQueixas, evenQueixas, evenQueixas">						
						<h:outputText value="#{bundle.alternativas}" styleClass="headerDataTable"/>						
						<h:panelGrid columns="4" columnClasses="column1row3, column2row3, column3row3, column4row3">
							<h:outputText value="1: "/>	
							<h:selectOneMenu value="#{currentQueixaResposta.alternativa1}" style="width: 95%;">
								<f:selectItems value="#{opcoesBean.listaAlternativas}" />
							</h:selectOneMenu>
							<h:outputText value="2: "/>					
							<h:selectOneMenu value="#{currentQueixaResposta.alternativa2}" style="width: 95%;">
								<f:selectItems value="#{opcoesBean.listaAlternativas}" />
							</h:selectOneMenu>
						</h:panelGrid>
					</h:panelGrid>		
					
					<h:panelGroup>	
						&nbsp;&nbsp;
						<h:commandButton value="#{bundle.bntAdicionar}" action="#{currentQueixaResposta.addMedicamento}"/>
					</h:panelGroup>
				</h:panelGrid>
				<h:dataTable var="currentMedicamento" border="1" value="#{currentQueixaResposta.listaMedicamentos}" rendered="#{not empty currentQueixaResposta.listaMedicamentos}" 
					styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
					
					<h:column id="column2">
						<f:facet name="header">
							<h:outputText value="#{bundle.descricao}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.descrição}"/>
					</h:column>					
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.dose}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.dose}"/>
					</h:column>	
					<h:column id="column1">
						<f:facet name="header">
							<h:outputText value="#{bundle.desde}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.periodo}"/>
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.suspeitaPRM}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.numeroPRM}"><f:converter converterId="PRMConverter"/></h:outputText>
					</h:column>									
									
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.necessario}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.necessario}"><f:converter converterId="flagConverter"/></h:outputText>
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.efetivo}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.efetivo}"><f:converter converterId="flagConverter"/></h:outputText>
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.seguro}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.seguro}"><f:converter converterId="flagConverter"/></h:outputText>
					</h:column>
					<h:outputText value="outputText"/>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.cumprimento}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.cumprimento}"><f:converter converterId="flagConverter"/></h:outputText>
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.alternativas}"/>
						</f:facet>
						<h:outputText value="1: #{currentMedicamento.alternativa1}"></h:outputText>
						<br>
						<h:outputText value="2: #{currentMedicamento.alternativa2}"></h:outputText>
					</h:column>
					<h:column>
						<h:commandLink actionListener="#{casoClinicoBean.removeMedicamentoQueixa}">
							<h:outputText value="#{bundle.remover}"/>
							<f:param id="removeMQ" name="obj" value="#{currentMedicamento}"/>
							<f:param id="queixaParam" value="#{currentQueixaResposta}"/>
						</h:commandLink>
					</h:column>
				</h:dataTable>	
			</h:panelGrid>
			</h:column>
		</h:dataTable>			
		</h:panelGroup>
		</fieldset>	
		
		<br>
		<fieldset>
		<legend><h:outputText value="#{bundle.avaliacaoQueixasEvolu}"></h:outputText></legend>
				<h:panelGroup layout="block" id="queixasEvolu" styleClass="field">
		<h:dataTable value="#{casoClinicoBean.queixasPRMSegundaEtapa}" var="currentQueixaResposta" >
			<h:column>
			<h:panelGrid columns="1">
			
				<h:panelGrid columns="4" styleClass="headerDataTableQueixas">				
					<h:outputText value="#{bundle.problemaSaude} -  #{currentQueixaResposta.descricao}"/>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.desde}" styleClass="headerDataTableQueixas"/>
						<h:inputText value="#{currentQueixaResposta.periodoSurgimento}"/>	
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="Tipo"  styleClass="headerDataTableQueixas"></h:outputText>
						<h:selectOneRadio id="DAorPRMPA" value="#{currentQueixaResposta.tipo}">
							<f:selectItem itemLabel="#{bundle.doencaAgravo}" itemValue="doenca" id="DAPA"/>
							<f:selectItem itemLabel="#{bundle.suspeitaPRM}" itemValue="prm" id="PRMPA"/>
						</h:selectOneRadio>
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.prioridade}"  styleClass="headerDataTableQueixas"/>
						<h:inputText value="#{currentQueixaResposta.prioridade}" style="width: 55px;" required="true"/>
					</h:panelGrid>
				</h:panelGrid>			
				<h:panelGrid columns="1">
				 	<f:facet name="header">							
						<h:panelGrid columns="1">								
							<h:outputText value="#{bundle.medicamentos}" style="width: 300px; border: 5px solid #FFFFFF;"/>
						</h:panelGrid>	
					</f:facet>
					
					<h:panelGrid border="1" columns="2"  styleClass="dataTables" headerClass="headerGridQueixasMed" 
								rowClasses="oddQueixas, evenQueixas" columnClasses="column1row1, column2row1">
						<h:outputText value="#{bundle.descricao}" styleClass="headerDataTable"/>
						<h:outputText value="#{bundle.situacao}" styleClass="headerDataTable"/>
						
						<h:selectOneMenu value="#{currentQueixaResposta.descricaoMedicamento}" style="width: 95%;">
							<f:selectItems value="#{opcoesBean.listaMedicamentos}" />
						</h:selectOneMenu>
						<h:selectOneMenu value="#{currentQueixaResposta.situacao}" style="width: 95%; border: 5px solid #E4E5F9;">
							<f:selectItems value="#{casoClinicoBean.situacaoItens}"/>							 
						</h:selectOneMenu>
					</h:panelGrid>
					
					<h:panelGrid border="1" columns="3"  styleClass="dataTables" headerClass="headerGridQueixasMed" 
								rowClasses="oddQueixas, evenQueixas" columnClasses="column1row2, column2row2, column3row2">
						<h:outputText value="#{bundle.dose}" style="width: 60px;" styleClass="headerDataTable"/>	
						<h:outputText value="#{bundle.desde}" style="width: 60px;" styleClass="headerDataTable"/>	
						<h:outputText value="#{bundle.suspeitaPRM}" styleClass="headerDataTable"/>
						
						<h:inputText value="#{currentQueixaResposta.dose}" style="width:90%; border: 5px solid #E4E5F9;"/>
						<h:inputText value="#{currentQueixaResposta.periodoMedicamento}" style="width:90%; border: 5px solid #E4E5F9;"/>
						<h:selectOneMenu value="#{currentQueixaResposta.numeroPRMMed}" style="font-size: small; border: 8px solid #E4E5F9;">
							<f:selectItems value="#{casoClinicoBean.PRMsItens}"/>
						</h:selectOneMenu>		
					</h:panelGrid>	
					
					<h:panelGrid border="1" columns="4"  styleClass="dataTables" headerClass="headerGridQueixasMed" rowClasses="oddQueixas, evenQueixas">
						<h:outputText value="#{bundle.necessario}" style="height: 100%;" styleClass="headerDataTable"/>
						<h:outputText value="#{bundle.efetivo}" styleClass="headerDataTable"/>
						<h:outputText value="#{bundle.seguro}" styleClass="headerDataTable"/>
						<h:outputText value="#{bundle.cumprimento}" styleClass="headerDataTable"/>
														
						<h:selectOneRadio value="#{currentQueixaResposta.necessario}" style="height: 100%;">
							<f:selectItem itemLabel="#{bundle.sim}" itemValue="V"/>
							<f:selectItem itemLabel="#{bundle.nao}" itemValue="F"/>
						</h:selectOneRadio>			
						<h:selectOneRadio value="#{currentQueixaResposta.efetivo}">
							<f:selectItem itemLabel="#{bundle.sim}" itemValue="V"/>
							<f:selectItem itemLabel="#{bundle.nao}" itemValue="F"/>
						</h:selectOneRadio>
						<h:selectOneRadio value="#{currentQueixaResposta.seguro}">
							<f:selectItem itemLabel="#{bundle.sim}" itemValue="V"/>
							<f:selectItem itemLabel="#{bundle.nao}" itemValue="F"/>
						</h:selectOneRadio>
						<h:selectOneRadio value="#{currentQueixaResposta.cumprimento}">
							<f:selectItem itemLabel="#{bundle.sim}" itemValue="V"/>
							<f:selectItem itemLabel="#{bundle.nao}" itemValue="F"/>
						</h:selectOneRadio>
					</h:panelGrid>		
					
					<h:panelGrid border="1" columns="1"  styleClass="dataTables" 
								headerClass="headerGridQueixasMed" rowClasses="oddQueixas, evenQueixas, evenQueixas">						
						<h:outputText value="#{bundle.alternativas}" styleClass="headerDataTable"/>						
						<h:panelGrid columns="4" columnClasses="column1row3, column2row3, column3row3, column4row3">
							<h:outputText value="1: "/>	
							<h:selectOneMenu value="#{currentQueixaResposta.alternativa1}" style="width: 95%;">
								<f:selectItems value="#{opcoesBean.listaAlternativas}" />
							</h:selectOneMenu>
							<h:outputText value="2: "/>					
							<h:selectOneMenu value="#{currentQueixaResposta.alternativa2}" style="width: 95%;">
								<f:selectItems value="#{opcoesBean.listaAlternativas}" />
							</h:selectOneMenu>
						</h:panelGrid>
					</h:panelGrid>		
					
					<h:panelGroup>	
						&nbsp;&nbsp;
						<h:commandButton value="#{bundle.bntAdicionar}" action="#{currentQueixaResposta.addMedicamento}"/>
					</h:panelGroup>
				</h:panelGrid>
				<h:dataTable var="currentMedicamento" border="1" value="#{currentQueixaResposta.listaMedicamentos}" rendered="#{not empty currentQueixaResposta.listaMedicamentos}" 
					styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
					
					<h:column id="column2">
						<f:facet name="header">
							<h:outputText value="#{bundle.descricao}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.descrição}"/>
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.situacao}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.situacao}"/>
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.dose}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.dose}"/>
					</h:column>	
					<h:column id="column1">
						<f:facet name="header">
							<h:outputText value="#{bundle.desde}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.periodo}"/>
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.suspeitaPRM}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.numeroPRM}"><f:converter converterId="PRMConverter"/></h:outputText>
					</h:column>									
									
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.necessario}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.necessario}"><f:converter converterId="flagConverter"/></h:outputText>
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.efetivo}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.efetivo}"><f:converter converterId="flagConverter"/></h:outputText>
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.seguro}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.seguro}"><f:converter converterId="flagConverter"/></h:outputText>
					</h:column>
					<h:outputText value="outputText"/>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.cumprimento}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.cumprimento}"><f:converter converterId="flagConverter"/></h:outputText>
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.alternativas}"/>
						</f:facet>
						<h:outputText value="1: #{currentMedicamento.alternativa1}"></h:outputText>
						<br>
						<h:outputText value="2: #{currentMedicamento.alternativa2}"></h:outputText>
					</h:column>
					<h:column>
						<h:commandLink actionListener="#{casoClinicoBean.removeMedicamentoQueixa}">
							<h:outputText value="#{bundle.remover}"/>
							<f:param id="removeMQ" name="obj" value="#{currentMedicamento}"/>
							<f:param id="queixaParam" value="#{currentQueixaResposta}"/>
						</h:commandLink>
					</h:column>
				</h:dataTable>	
			</h:panelGrid>
			</h:column>
		</h:dataTable>		
		<br>	
		</h:panelGroup>
		</fieldset>				
			
		<br>
		<fieldset>
		<legend><h:outputText value="#{bundle.intervFarmacIniciais}"/></legend>
		<h:panelGroup id="intervFarmacIniciais" layout="block" styleClass="field">			
		<h:dataTable border="1" rendered="#{not empty casoClinicoBean.intervencoesPrimeiraEtapa}" 
			var="f" value="#{casoClinicoBean.intervencoesPrimeiraEtapa}"
			styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">			
			<h:column id="column2">
				<f:facet name="header">
					<h:outputText value="#{bundle.descricao}"></h:outputText>
				</f:facet>
				<h:outputText value="#{f.descricao}"></h:outputText>
			</h:column>
			<h:column id="column1">
				<f:facet name="header">
					<h:outputText value="#{bundle.indicacao}"></h:outputText>
				</f:facet>
				<h:outputText value="#{f.indicacao}"></h:outputText>
			</h:column>
		</h:dataTable>
		</h:panelGroup>
		</fieldset>
		<br>
		<br>					
	
		<h:commandButton action="#{casoClinicoBean.add}" value="#{bundle.confirmar}"/>		
	
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