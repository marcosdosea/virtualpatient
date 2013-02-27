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
		<h:graphicImage value="#{casoClinicoBean.casoConsultado.fotoFileName}"></h:graphicImage>
		<br>
		<br>
		<fieldset>
		<legend><h:outputText value="#{bundle.relatoCasos}"></h:outputText></legend> 
		<h:panelGroup id="relatos" layout="block" styleClass="field">
			<h:outputText value="#{bundle.casoInicial}"></h:outputText>
			<br>
			<h:inputTextarea style="height: 177px; width: 100%" 
				value="#{casoClinicoBean.casoConsultado.relatoDeCasoPrimeiraConsulta}"
				styleClass="field_text" readonly="true"></h:inputTextarea>
			<br>
			<h:outputText value="#{bundle.casoEvolucao}"></h:outputText>
			<br>
			<h:inputTextarea style="height: 177px; width: 100%" 
				value="#{casoClinicoBean.casoConsultado.relatoDeCasoSegundaConsulta}"
				styleClass="field_text" readonly="true"></h:inputTextarea>	
			<br>
			<h:outputText value="#{bundle.casoEvolucao3}"></h:outputText>
			<br>
			<h:inputTextarea style="height: 177px; width: 100%" 
				value="#{casoClinicoBean.casoConsultado.relatoDeCasoTerceiraConsulta}"
				styleClass="field_text" readonly="true"></h:inputTextarea>	
			<br>			
			<h:outputText value="#{bundle.casoEvolucao4}"></h:outputText>
			<br>
			<h:inputTextarea id="relatoDeCasoQuartaConsulta" style="height: 140px"
				value="#{casoClinicoBean.casoConsultado.relatoDeCasoQuartaConsulta}"
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
			<h:inputText value="#{casoClinicoBean.casoConsultado.nome}"
				styleClass="field_text" readonly="true"></h:inputText>
			<br>
			<h:outputText value="#{bundle.genero}"></h:outputText>
			<br>
			<h:selectOneRadio id="genero" value="#{casoClinicoBean.casoConsultado.genero}" disabled="true">
				<f:selectItem itemValue="M" id="M" itemLabel="#{bundle.masculino}" />
				<f:selectItem itemValue="F" id="F" itemLabel="#{bundle.feminino}" />
			</h:selectOneRadio>
			<br>
			<h:outputText value="#{bundle.dataNasc}"></h:outputText>
			<br>
			<h:inputText value="#{casoClinicoBean.casoConsultado.dataNascimento}"
				styleClass="field_text" readonly="true">
				<f:convertDateTime pattern="dd/MM/yyyy"/>
			</h:inputText>		
			<br>
			<h:outputText value="#{bundle.medicos}"></h:outputText>
			<br>	
			<h:inputText value="#{casoClinicoBean.casoConsultado.medicosQueAtendem}"
				styleClass="field_text" readonly="true"></h:inputText>
			<br>
			<h:outputText value="#{bundle.ocupacao}"></h:outputText>
			<br>
			<h:inputText value="#{casoClinicoBean.casoConsultado.ocupacao}"
				styleClass="field_text" readonly="true"></h:inputText>
			<br>
			<h:outputText value="#{bundle.escolaridade}  "></h:outputText>			
			<br>
			<h:inputText id="anoInitCurso" value="#{casoClinicoBean.escolaridadeTraduzidaById}" 
							styleClass="field_text" readonly="true"></h:inputText>
			<br>
			<h:outputText value="#{bundle.moradiaFamilia}"></h:outputText>
			<br>
			<h:inputText value="#{casoClinicoBean.casoConsultado.moradiaFamilia}" 
				styleClass="field_text" readonly="true"></h:inputText>
			<br>
			<h:outputText value="#{bundle.planoSaude}"></h:outputText>
			<br>
			<h:inputText value="#{casoClinicoBean.casoConsultado.planoDeSaude}" 
				styleClass="field_text" readonly="true"></h:inputText>
			
		</h:panelGroup>
		</fieldset>	
		<br>
						
		<fieldset>
		<legend><h:outputText value="#{bundle.razaoEncontro}"></h:outputText></legend> 
		<h:panelGroup id="razaoEnc" layout="block" styleClass="field">							
			<h:inputTextarea id="razaoEncontro" style="height: 140px"
				value="#{casoClinicoBean.casoConsultado.razaoEncontro}" 
				readonly="true" styleClass="field_text"></h:inputTextarea>							
		</h:panelGroup>
		</fieldset>
		<br>
		
		<fieldset>
		<legend><h:outputText value="#{bundle.experienciaMedicamentos}"></h:outputText></legend> 
		<h:panelGroup id="experienciaMedicamentos" layout="block" styleClass="field" style="width: 100%;">	
		<h:panelGrid border="0" columns="2" style="width: 100%;">
			<h:panelGrid columns="1">
				<h:outputText value="#{bundle.experienciaMedicamentos1}"></h:outputText>								
				<h:inputTextarea id="experienciaMedicamentos1" style="height: 50px"
				value="#{casoClinicoBean.casoConsultado.experienciaMedicamentos1}" 
				styleClass="field_text" readonly="true">
				</h:inputTextarea>	
			</h:panelGrid>
			<h:panelGrid columns="1">
				<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>								
				<h:selectOneRadio id="necessidadeAtencao1" disabled="true" value="#{casoClinicoBean.casoConsultado.necessidadeAtencao1}">
					<f:selectItem itemLabel="#{bundle.sim}" itemValue="V" id="necessidade1True" />
					<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="necessidade1False" />
				</h:selectOneRadio>								
			</h:panelGrid>
			
			<h:panelGrid columns="1">
				<h:outputText value="#{bundle.experienciaMedicamentos2}"></h:outputText>								
				<h:inputTextarea id="experienciaMedicamentos2" style="height: 50px"
				value="#{casoClinicoBean.casoConsultado.experienciaMedicamentos2}" 
				styleClass="field_text" readonly="true">
				</h:inputTextarea>	
			</h:panelGrid>
			<h:panelGrid columns="1">
				<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>								
				<h:selectOneRadio id="necessidadeAtencao2" disabled="true" value="#{casoClinicoBean.casoConsultado.necessidadeAtencao2}">
					<f:selectItem itemLabel="#{bundle.sim}" itemValue="V" id="necessidade2True" />
					<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="necessidade2False" />
				</h:selectOneRadio>								
			</h:panelGrid>							
			
			<h:panelGrid columns="1">
				<h:outputText value="#{bundle.experienciaMedicamentos3}"></h:outputText>								
				<h:inputTextarea id="experienciaMedicamentos3" style="height: 50px"
				value="#{casoClinicoBean.casoConsultado.experienciaMedicamentos3}" 
				styleClass="field_text" readonly="true">
				</h:inputTextarea>	
			</h:panelGrid>
			<h:panelGrid columns="1">
				<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>								
				<h:selectOneRadio id="necessidadeAtencao3" disabled="true" value="#{casoClinicoBean.casoConsultado.necessidadeAtencao3}">
					<f:selectItem itemLabel="#{bundle.sim}" itemValue="V" id="necessidade3True" />
					<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="necessidade3False" />
				</h:selectOneRadio>								
			</h:panelGrid>
			
			<h:panelGrid columns="1">
				<h:outputText value="#{bundle.experienciaMedicamentos4}"></h:outputText>								
				<h:inputTextarea id="experienciaMedicamentos4" style="height: 50px"
				value="#{casoClinicoBean.casoConsultado.experienciaMedicamentos4}" 
				styleClass="field_text" readonly="true">
				</h:inputTextarea>	
			</h:panelGrid>
			<h:panelGrid columns="1">
				<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>								
				<h:selectOneRadio id="necessidadeAtencao4" disabled="true" value="#{casoClinicoBean.casoConsultado.necessidadeAtencao4}">
					<f:selectItem itemLabel="#{bundle.sim}" itemValue="V" id="necessidade4True" />
					<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="necessidade4False" />
				</h:selectOneRadio>								
			</h:panelGrid>
			
			<h:panelGrid columns="1">
				<h:outputText value="#{bundle.experienciaMedicamentos5}"></h:outputText>								
				<h:inputTextarea id="experienciaMedicamentos5" style="height: 50px"
				value="#{casoClinicoBean.casoConsultado.experienciaMedicamentos5}" 
				styleClass="field_text" readonly="true">
				</h:inputTextarea>	
			</h:panelGrid>
			<h:panelGrid columns="1">
				<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>								
				<h:selectOneRadio id="necessidadeAtencao5" disabled="true" value="#{casoClinicoBean.casoConsultado.necessidadeAtencao5}">
					<f:selectItem itemLabel="#{bundle.sim}" itemValue="V" id="necessidade5True" />
					<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="necessidade5False" />
				</h:selectOneRadio>								
			</h:panelGrid>
		</h:panelGrid>		
		</h:panelGroup>
		</fieldset>
		<br>
		
		<fieldset>
		<legend> <h:outputText value="#{bundle.medicamentosAnteriores}"></h:outputText></legend>		
		<h:panelGroup id="medAnt" layout="block" styleClass="field">
			<h:dataTable title="teste" styleClass="dataTables"
				rendered="#{not empty casoClinicoBean.listaMedicamentoAntConsulta}"
				border="1" value="#{casoClinicoBean.listaMedicamentoAntConsulta}"
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
			</h:dataTable>	
		</h:panelGroup>
		</fieldset>
		<br>
		
		<fieldset>
		<legend><h:outputText value="#{bundle.historias}"></h:outputText></legend> 
		<h:panelGroup id="historias" layout="block" styleClass="field">
			<h:outputText value="#{bundle.historiaMedicaPregressa}"></h:outputText>
			<br>
			<h:inputTextarea id="historiaMedicaPregressa" style="height: 90px"
				value="#{casoClinicoBean.casoConsultado.historiaMedicaPregressa}"
				readonly="true" styleClass="field_text"></h:inputTextarea>
			<br>
			<h:outputText value="#{bundle.historiafamiliar}"></h:outputText>
			<br>
			<h:inputTextarea id="historiafamiliar" style="height: 90px"
				value="#{casoClinicoBean.casoConsultado.historiafamiliar}"
				readonly="true" styleClass="field_text"></h:inputTextarea>
			<br>
		</h:panelGroup>
		</fieldset>
		<br>
		
		<fieldset>
		<legend><h:outputText value="#{bundle.estilosVida}"></h:outputText></legend> 
		<h:panelGroup id="estilosVida" layout="block" styleClass="field">
			<h:panelGrid border="1" columns="4" styleClass="dataTables" headerClass="headerDataTable" rowClasses="headerDataTable, odd, even, odd">
				<h:outputText value="#{bundle.substancia}"/>
				<h:outputText value="#{bundle.consumo}"/>
				<h:outputText value="#{bundle.histUso}"/>
				<h:outputText value="#{bundle.histUsoAnterior}"/>
				<h:outputText value="#{bundle.tabaco}"/>
					<h:outputText value="#{casoClinicoBean.casoConsultado.flFuma}">
						<f:converter converterId="flagConverter"/>
					</h:outputText>
					<h:outputText value="#{casoClinicoBean.casoConsultado.historiaTabacoAtual}"/>
				<h:panelGroup>
					<h:outputText value="#{bundle.tempoParou}"/> 	
					<h:outputText value="#{casoClinicoBean.casoConsultado.historiaTabacoAnterior}"/>
	
				</h:panelGroup>
				<h:outputText value="#{bundle.cafe}"/>
				<h:outputText value="#{casoClinicoBean.casoConsultado.flBebeCafe}">
						<f:converter converterId="flagConverter"/>
					</h:outputText>
					<h:outputText value="#{casoClinicoBean.casoConsultado.historiaCafeAtual}"/>
	
				<h:panelGroup>
					<h:outputText value="#{bundle.tempoParou}"/> 	
					<h:outputText value="#{casoClinicoBean.casoConsultado.historiaCafeAnterior}"/>
	
				</h:panelGroup>
				<h:outputText value="#{bundle.alcool}"/>
				<h:outputText value="#{casoClinicoBean.casoConsultado.flBebeAlcool}">
						<f:converter converterId="flagConverter"/>
					</h:outputText>
				<h:panelGroup>
					<h:outputText value="#{bundle.tipoBebida}"/> 
					<h:outputText value="#{casoClinicoBean.casoConsultado.tipoBebidaAlcoolica}"/>
	
					<br/><h:outputText value="#{casoClinicoBean.casoConsultado.historiaAlcoolAtual}"/>
	
				</h:panelGroup>
				<h:panelGroup>
					<h:outputText value="#{bundle.tempoParou}"/> 	
					<h:outputText value="#{casoClinicoBean.casoConsultado.historiaAlcoolAnterior}"/>
				</h:panelGroup>			
			</h:panelGrid>
		</h:panelGroup>
		</fieldset>
		
		<br>
		<fieldset><legend><h:outputText value="#{bundle.paramClinicos}"></h:outputText></legend>
		<h:panelGroup id="paramClin" layout="block" styleClass="field">			
			<h:dataTable border="1" rendered="#{not empty casoClinicoBean.listaParametrosConsulta}" 
				value="#{casoClinicoBean.listaParametrosConsulta}" var="currentParametro" 
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
					<h:outputText id="peso" value="#{casoClinicoBean.casoConsultado.peso} "></h:outputText>
					<h:outputText value=" #{bundle.unidadePeso}"></h:outputText>
				</h:panelGroup>
				
				<h:outputText value="#{bundle.altura}"></h:outputText>
				<h:panelGroup>
					<h:outputText id="altura" value="#{casoClinicoBean.casoConsultado.altura} "></h:outputText>
					<h:outputText value=" #{bundle.unidadeAltura}"></h:outputText>
				</h:panelGroup>
				
				<h:outputText value="#{bundle.pressaoArt}"></h:outputText>
				<h:panelGroup>
					<h:outputText id="pressaoSist" 
						value="#{casoClinicoBean.casoConsultado.pressaoSistolica} "></h:outputText> 
					X	
					<h:outputText id="pressaoDiast"
						value="#{casoClinicoBean.casoConsultado.pressaoDiastolica} "></h:outputText>
					<h:outputText value=" #{bundle.unidadePressao}"></h:outputText>
				</h:panelGroup>

				<h:outputText value="#{bundle.temperatura}"></h:outputText>
				<h:panelGroup>
					<h:outputText id="temperatura" value="#{casoClinicoBean.casoConsultado.temperatura} "></h:outputText>
					<h:outputText value=" #{bundle.unidadeGlicemia}"></h:outputText>
				</h:panelGroup>	
				
				<h:outputText value="#{bundle.alergias}"></h:outputText>
				<h:outputText id="alergias" value="#{casoClinicoBean.casoConsultado.alergias}"></h:outputText>
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
				<h:outputText id="pesoEvolu" value="#{casoClinicoBean.casoConsultado.peso2} "></h:outputText>
				<h:outputText value=" #{bundle.unidadePeso}"></h:outputText>
			</h:panelGroup>
			<h:outputText value="#{bundle.pressaoArt}"></h:outputText>
			<h:panelGroup>
				<h:outputText id="pressaoSistEvolu"
					value="#{casoClinicoBean.casoConsultado.pressaoSistolica2} "></h:outputText>
				X
				<h:outputText id="pressaoDiastEvolu"
					value="#{casoClinicoBean.casoConsultado.pressaoDiastolica2} "></h:outputText>
				<h:outputText value=" #{bundle.unidadePressao}"></h:outputText>
			</h:panelGroup>
			<h:outputText value="#{bundle.temperatura}"></h:outputText>
			<h:panelGroup>					
				<h:outputText value="#{casoClinicoBean.casoConsultado.temperatura2} "></h:outputText>
				<h:outputText value=" #{bundle.unidadeGlicemia}"></h:outputText>
			</h:panelGroup>
		</h:panelGrid>
		</h:panelGroup>
		</fieldset>	
		<br>
		
		<br>
		<fieldset>
		<legend><h:outputText value="#{bundle.medicamentosNaoPresc}"></h:outputText></legend> 
		<h:panelGroup id="medNP" layout="block" styleClass="field">
			<h:dataTable border="1" rendered="#{not empty casoClinicoBean.listaMedicamentoNPConsulta}" 
				value="#{casoClinicoBean.listaMedicamentoNPConsulta}" var="currentParametro" 
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
			<h:dataTable border="1" rendered="#{not empty casoClinicoBean.listaMedicamentoPConsulta}" 
				value="#{casoClinicoBean.listaMedicamentoPConsulta}" var="currentParametro" 
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
		</h:panelGroup>
		</fieldset>	
		
		<br>	
		<fieldset>
		<legend><h:outputText value="#{bundle.proxEncontro}"></h:outputText></legend>
		<h:panelGroup layout="block" styleClass="field">
		<h:inputTextarea value="#{casoClinicoBean.casoConsultado.proxEncontro}" style="height: 140px;"
						styleClass="field_text" readonly="true"> </h:inputTextarea>
		</h:panelGroup>
		</fieldset>
		<br>
				
		<fieldset>
		<legend><h:outputText value="#{bundle.diarioPessoalMed}"></h:outputText></legend>
		<h:panelGroup layout="block" id="diarioMedicamentos" styleClass="field">
		<h:panelGrid border="0" columns="1">
			<h:dataTable title="teste" styleClass="dataTables"
				rendered="#{not empty casoClinicoBean.listaDiarioMedConsulta}"
				border="1" value="#{casoClinicoBean.listaDiarioMedConsulta}"
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
		<legend><h:outputText value="#{bundle.queixasIniciais}"></h:outputText></legend>	
		<h:panelGroup id="queixasIniciais" layout="block" styleClass="field">	
			<h:dataTable value="#{casoClinicoBean.listaQueixasIniciaisConsulta}" var="currentQueixaResposta" >
			<h:column>
			<h:panelGrid columns="1">
			
				<h:panelGrid columns="4" styleClass="headerDataTableQueixas">				
					<h:outputText value="#{bundle.problemaSaude} -  #{currentQueixaResposta.descricao}"/>
					<h:panelGrid columns="2">
						<h:outputText value="#{bundle.desde}: " styleClass="headerDataTableQueixas"/>
						<h:outputText value="#{currentQueixaResposta.periodoSurgimento}"/>	
					</h:panelGrid>
					<h:panelGrid columns="2">
						<h:outputText value="#{bundle.tipo}: "  styleClass="headerDataTableQueixas"></h:outputText>
						<h:outputText value="#{bundle.suspeitaPRM}"  rendered="#{currentQueixaResposta.tipo == 'P'}"></h:outputText>
						<h:outputText value="#{bundle.doencaAgravo}"  rendered="#{currentQueixaResposta.tipo == 'D'}"></h:outputText>							
					</h:panelGrid>
					<h:panelGrid columns="2">
						<h:outputText value="#{bundle.prioridade}: "  styleClass="headerDataTableQueixas"/>
						<h:outputText value="#{currentQueixaResposta.prioridade}" />
					</h:panelGrid>
				</h:panelGrid>
				
				<h:panelGrid border="1" columns="1" styleClass="dataTables" headerClass="headerGridQueixasMed">
				 	<f:facet name="header">
				 		<h:panelGrid columns="2">
							<h:outputText value="#{bundle.medicamentos}"/>														
						</h:panelGrid>
					</f:facet>
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
							<h:outputText value="#{bundle.n}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.necessario}"><f:converter converterId="flagConverter"/></h:outputText>
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.e}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.efetivo}"><f:converter converterId="flagConverter"/></h:outputText>
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.s}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.seguro}"><f:converter converterId="flagConverter"/></h:outputText>
					</h:column>
					<h:outputText value="outputText"/>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.c}"/>
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
				</h:dataTable>						
				</h:panelGrid>				
			</h:panelGrid>
			</h:column>
			</h:dataTable>
		</h:panelGroup>
		</fieldset>
		<br>
		<fieldset>
		<legend><h:outputText value="#{bundle.queixasEvolucao}"/></legend>
		<h:panelGroup id="queixasEvolucao" layout="block" styleClass="field">
			<h:dataTable value="#{casoClinicoBean.listaQueixasEvolucaoConsulta}" var="currentQueixaResposta" >
			<h:column>
			<h:panelGrid columns="1">
			
				<h:panelGrid columns="4" styleClass="headerDataTableQueixas">				
					<h:outputText value="#{bundle.problemaSaude} -  #{currentQueixaResposta.descricao}"/>
					<h:panelGrid columns="2">
						<h:outputText value="#{bundle.desde}: " styleClass="headerDataTableQueixas"/>
						<h:outputText value="#{currentQueixaResposta.periodoSurgimento}"/>	
					</h:panelGrid>
					<h:panelGrid columns="2">
						<h:outputText value="#{bundle.tipo}: "  styleClass="headerDataTableQueixas"></h:outputText>
						<h:outputText value="#{bundle.suspeitaPRM}"  rendered="#{currentQueixaResposta.tipo == 'P'}"></h:outputText>
						<h:outputText value="#{bundle.doencaAgravo}"  rendered="#{currentQueixaResposta.tipo == 'D'}"></h:outputText>							
					</h:panelGrid>
					<h:panelGrid columns="2">
						<h:outputText value="#{bundle.prioridade}: "  styleClass="headerDataTableQueixas"/>
						<h:outputText value="#{currentQueixaResposta.prioridade}" />
					</h:panelGrid>
				</h:panelGrid>
				
				<h:panelGrid border="1" columns="1" styleClass="dataTables" headerClass="headerGridQueixasMed">
				 	<f:facet name="header">
				 		<h:panelGrid columns="2">
							<h:outputText value="#{bundle.medicamentos}"/>														
						</h:panelGrid>
					</f:facet>
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
							<h:outputText value="#{bundle.n}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.necessario}"><f:converter converterId="flagConverter"/></h:outputText>
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.e}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.efetivo}"><f:converter converterId="flagConverter"/></h:outputText>
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.s}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.seguro}"><f:converter converterId="flagConverter"/></h:outputText>
					</h:column>
					<h:outputText value="outputText"/>
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.c}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.cumprimento}"><f:converter converterId="flagConverter"/></h:outputText>
					</h:column>	
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.situacao}"/>
						</f:facet>
						<h:outputText value="#{currentMedicamento.situacao}"></h:outputText>
					</h:column>		
					<h:column>
						<f:facet name="header">
							<h:outputText value="#{bundle.alternativas}"/>
						</f:facet>
						<h:outputText value="1: #{currentMedicamento.alternativa1}"></h:outputText>
						<br>
						<h:outputText value="2: #{currentMedicamento.alternativa2}"></h:outputText>
					</h:column>							
				</h:dataTable>						
				</h:panelGrid>				
			</h:panelGrid>
			</h:column>
		</h:dataTable>
		</h:panelGroup>
		</fieldset>		
		
		<br>					
		<fieldset>
		<legend><h:outputText value="#{bundle.intervFarmacIniciais}"></h:outputText></legend> 
		<h:panelGroup id="intervencoes" layout="block" styleClass="field">			
		<h:panelGrid border="0" columns="1" style="vertical-align: top">							
			<h:dataTable border="1" value="#{casoClinicoBean.listaIntervencoesIniciaisConsulta}" var="currentParametro"
				styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">				
				<h:column id="column1">
					<h:outputText value="#{currentParametro.descricao}"></h:outputText>
					<f:facet name="header">
						<h:outputText value="#{bundle.descricao}"></h:outputText>
					</f:facet>
				</h:column>
				<h:column id="column2">
					<h:outputText value="#{currentParametro.indicacao}"></h:outputText>
					<f:facet name="header">
						<h:outputText value="#{bundle.comunicacao}"></h:outputText>
					</f:facet>
				</h:column>
			</h:dataTable>			
		</h:panelGrid>
		</h:panelGroup>
		</fieldset>	
		<br>	
		
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