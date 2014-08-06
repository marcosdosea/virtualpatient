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
			<h:outputText value="#{avaliarConsultaBean.fake}"></h:outputText>
			
			<h:panelGroup layout="block" id="sidebar" styleClass="sidebar">
				<h:graphicImage value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.fotoFileName}"></h:graphicImage>
				<br>
				<h:outputText value="#{bundle.casoInicial} " style="font-weight: bold;" ></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.relatoDeCasoPrimeiraConsulta}"></h:outputText>
			</h:panelGroup>
			
			<h:panelGroup layout="block" id="wraper" styleClass="wraper">
				
				<h:panelGroup layout="block" id="mainContent" styleClass="mainContent">
						
					
			<br><h2><h:outputText value="#{bundle.avaliacaoPrimeiraConsulta}"></h:outputText></h2>
			<br><br>			
			<h:outputText value="#{bundle.dataRealizacao}: "></h:outputText>
			<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.dataDeRealizacao}"><f:convertDateTime pattern="dd/MM/yyyy"/></h:outputText>
			<br>
			<br>
			<br>
			<fieldset>
			<legend><h:outputText value="#{bundle.dadosDemAnt}"></h:outputText></legend> 
			<h:panelGroup id="demoAntro" layout="block" styleClass="field">
			<h:panelGrid border="1" columns="3" styleClass="dataTables" headerClass="headerDataTable" rowClasses="headerDataTable,odd, even,odd, even,odd, even,odd, even">
				<h:outputText value="-----" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{bundle.nome}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.nome}"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.nome}"></h:outputText>
				<h:outputText value="#{bundle.genero}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.genero}"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.genero}"></h:outputText>
				<h:outputText value="#{bundle.dataNasc}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.dataNascimento}">
					<f:convertDateTime pattern="dd/MM/yyyy"/>
				</h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.dataNascimento}">
					<f:convertDateTime pattern="dd/MM/yyyy"/>
				</h:outputText>
				<h:outputText value="#{bundle.medicos}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.medicosQueAtendem}"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.medicosQueAtendem}"></h:outputText>
				<h:outputText value="#{bundle.ocupacao}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.ocupacao}"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.ocupacao}"></h:outputText>
				<h:outputText value="#{bundle.escolaridade}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.escolaridadeTraduzida}"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.escolaridadeTraduzidaAluno}"></h:outputText>
				<h:outputText value="#{bundle.moradiaFamilia}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.moradiaFamilia}"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.moradiaFamilia}"></h:outputText>					
				<h:outputText value="#{bundle.planoSaude}" style="font-weight: bold"/>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.planoDeSaude}"/>			
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.planoDeSaude}"/>
			</h:panelGrid>
			</h:panelGroup>
			</fieldset>
			<br>
			
			<fieldset>
			<legend><h:outputText value="#{bundle.razaoEncontro}"></h:outputText></legend> 
			<h:panelGroup id="razaoEnc" layout="block" styleClass="field">
				<h:panelGroup>
					<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
					<br><br>
					<h:dataTable border="1" value="#{avaliarConsultaBean.listaRazaoEncontroCaso}" var="currentParametro">
						<h:column id="column1">
							<h:outputText value="#{currentParametro.descricao}"></h:outputText>							
						</h:column>
					</h:dataTable>
					<br><br>
					<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
					<br><br>
					<h:inputText value="#{avaliarConsultaBean.respostaPrimeira.razaoEncontro}" disabled="true" 
						rendered="#{avaliarConsultaBean.respostaPrimeira.outroRazaoEncontroTxt == ''}" style="width: 90%"></h:inputText>
					<h:panelGroup rendered="#{avaliarConsultaBean.respostaPrimeira.outroRazaoEncontroTxt != ''}">
						<h:outputText value="#{bundle.outro}:"></h:outputText>
						&nbsp;
						<h:inputText value="#{avaliarConsultaBean.respostaPrimeira.outroRazaoEncontroTxt}" style="width: 80%"></h:inputText>
						&nbsp;&nbsp;
						<h:commandButton action="#{avaliarConsultaBean.addRazaoEncontroCaso}" value="#{bundle.salvar}"></h:commandButton>
					</h:panelGroup>										
				</h:panelGroup>
			</h:panelGroup>
			</fieldset>
			<br>
			
			<fieldset>
			<legend><h:outputText value="#{bundle.experienciaMedicamentos}"></h:outputText></legend> 
			<h:panelGroup id="experienciaMedicamentos" layout="block" styleClass="field"  style="width: 100%;">
						
				<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
				<br><br>
				<h:panelGrid border="0" columns="2" style="width: 100%;">
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos1}"></h:outputText>
						<h:dataTable border="1" value="#{avaliarConsultaBean.listaExperienciaMedicamentos1Caso}" var="currentParametro">
							<h:column id="column1">
								<h:outputText value="#{currentParametro.descricao}"></h:outputText>							
							</h:column>
						</h:dataTable>
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.necessidadeAtencao1}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos2}"></h:outputText>
						<h:dataTable border="1" value="#{avaliarConsultaBean.listaExperienciaMedicamentos2Caso}" var="currentParametro">
							<h:column id="column1">
								<h:outputText value="#{currentParametro.descricao}"></h:outputText>							
							</h:column>
						</h:dataTable>
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.necessidadeAtencao2}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos3}"></h:outputText>
						<h:dataTable border="1" value="#{avaliarConsultaBean.listaExperienciaMedicamentos3Caso}" var="currentParametro">
							<h:column id="column1">
								<h:outputText value="#{currentParametro.descricao}"></h:outputText>							
							</h:column>
						</h:dataTable>
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.necessidadeAtencao3}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos4}"></h:outputText>
						<h:dataTable border="1" value="#{avaliarConsultaBean.listaExperienciaMedicamentos4Caso}" var="currentParametro">
							<h:column id="column1">
								<h:outputText value="#{currentParametro.descricao}"></h:outputText>							
							</h:column>
						</h:dataTable>
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.necessidadeAtencao4}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos5}"></h:outputText>
						<h:dataTable border="1" value="#{avaliarConsultaBean.listaExperienciaMedicamentos5Caso}" var="currentParametro">
							<h:column id="column1">
								<h:outputText value="#{currentParametro.descricao}"></h:outputText>							
							</h:column>
						</h:dataTable>
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.necessidadeAtencao5}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.conclusao}"></h:outputText>
						<h:dataTable border="1" value="#{avaliarConsultaBean.listaExperienciaMedicamentosConcCaso}" var="currentParametro">
							<h:column id="column1">
								<h:outputText value="#{currentParametro.descricao}"></h:outputText>							
							</h:column>
						</h:dataTable>
					</h:panelGrid>
				</h:panelGrid>
				
				<br>
				
				<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
				<br><br>
				<h:panelGrid border="0" columns="2" style="width: 100%;">
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos1}"></h:outputText>
						<h:inputText value="#{avaliarConsultaBean.respostaPrimeira.experienciaMedicamentos1}" disabled="true" 
							rendered="#{avaliarConsultaBean.respostaPrimeira.outroExpMed1Txt == ''}" style="width: 90%"></h:inputText>
						<h:panelGroup rendered="#{avaliarConsultaBean.respostaPrimeira.outroExpMed1Txt != ''}">
							<h:outputText value="#{bundle.outro}:"></h:outputText>
							&nbsp;
							<h:inputText value="#{avaliarConsultaBean.respostaPrimeira.outroExpMed1Txt}" style="width: 80%"></h:inputText>
							&nbsp;&nbsp;
							<h:commandButton action="#{avaliarConsultaBean.addExperienciaMedicamentos1Caso}" value="#{bundle.salvar}"></h:commandButton>
						</h:panelGroup>	
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.necessidadeAtencao1}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos2}"></h:outputText>
						<h:inputText value="#{avaliarConsultaBean.respostaPrimeira.experienciaMedicamentos2}" disabled="true" 
							rendered="#{avaliarConsultaBean.respostaPrimeira.outroExpMed2Txt == ''}" style="width: 90%"></h:inputText>
						<h:panelGroup rendered="#{avaliarConsultaBean.respostaPrimeira.outroExpMed2Txt != ''}">
							<h:outputText value="#{bundle.outro}:"></h:outputText>
							&nbsp;
							<h:inputText value="#{avaliarConsultaBean.respostaPrimeira.outroExpMed2Txt}" style="width: 80%"></h:inputText>
							&nbsp;&nbsp;
							<h:commandButton action="#{avaliarConsultaBean.addExperienciaMedicamentos2Caso}" value="#{bundle.salvar}"></h:commandButton>
						</h:panelGroup>
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.necessidadeAtencao2}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos3}"></h:outputText>
						<h:inputText value="#{avaliarConsultaBean.respostaPrimeira.experienciaMedicamentos3}" disabled="true" 
							rendered="#{avaliarConsultaBean.respostaPrimeira.outroExpMed3Txt == ''}" style="width: 90%"></h:inputText>
						<h:panelGroup rendered="#{avaliarConsultaBean.respostaPrimeira.outroExpMed3Txt != ''}">
							<h:outputText value="#{bundle.outro}:"></h:outputText>
							&nbsp;
							<h:inputText value="#{avaliarConsultaBean.respostaPrimeira.outroExpMed3Txt}" style="width: 80%"></h:inputText>
							&nbsp;&nbsp;
							<h:commandButton action="#{avaliarConsultaBean.addExperienciaMedicamentos3Caso}" value="#{bundle.salvar}"></h:commandButton>
						</h:panelGroup>
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.necessidadeAtencao3}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos4}"></h:outputText>
						<h:inputText value="#{avaliarConsultaBean.respostaPrimeira.experienciaMedicamentos4}" disabled="true" 
							rendered="#{avaliarConsultaBean.respostaPrimeira.outroExpMed4Txt == ''}" style="width: 90%"></h:inputText>
						<h:panelGroup rendered="#{avaliarConsultaBean.respostaPrimeira.outroExpMed4Txt != ''}">
							<h:outputText value="#{bundle.outro}:"></h:outputText>
							&nbsp;
							<h:inputText value="#{avaliarConsultaBean.respostaPrimeira.outroExpMed4Txt}" style="width: 80%"></h:inputText>
							&nbsp;&nbsp;
							<h:commandButton action="#{avaliarConsultaBean.addExperienciaMedicamentos4Caso}" value="#{bundle.salvar}"></h:commandButton>
						</h:panelGroup>
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.necessidadeAtencao4}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos5}"></h:outputText>
						<h:inputText value="#{avaliarConsultaBean.respostaPrimeira.experienciaMedicamentos5}" disabled="true" 
							rendered="#{avaliarConsultaBean.respostaPrimeira.outroExpMed5Txt == ''}" style="width: 90%"></h:inputText>
						<h:panelGroup rendered="#{avaliarConsultaBean.respostaPrimeira.outroExpMed5Txt != ''}">
							<h:outputText value="#{bundle.outro}:"></h:outputText>
							&nbsp;
							<h:inputText value="#{avaliarConsultaBean.respostaPrimeira.outroExpMed5Txt}" style="width: 80%"></h:inputText>
							&nbsp;&nbsp;
							<h:commandButton action="#{avaliarConsultaBean.addExperienciaMedicamentos5Caso}" value="#{bundle.salvar}"></h:commandButton>
						</h:panelGroup>
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.necessidadeAtencao5}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
				</h:panelGrid>
				<h:panelGrid columns="1">
					<h:outputText value="#{bundle.conclusao}"></h:outputText>
					<h:inputText value="#{avaliarConsultaBean.respostaPrimeira.conclusao}" disabled="true" 
						rendered="#{avaliarConsultaBean.respostaPrimeira.outroExpMedConcTxt == ''}" style="width: 90%"></h:inputText>
					<h:panelGroup rendered="#{avaliarConsultaBean.respostaPrimeira.outroExpMedConcTxt != ''}">
						<h:outputText value="#{bundle.outro}:"></h:outputText>
						&nbsp;
						<h:inputText value="#{avaliarConsultaBean.respostaPrimeira.outroExpMedConcTxt}" style="width: 80%"></h:inputText>
						&nbsp;&nbsp;
						<h:commandButton action="#{avaliarConsultaBean.addExperienciaMedicamentosConcCaso}" value="#{bundle.salvar}"></h:commandButton>
					</h:panelGroup>
				</h:panelGrid>
			</h:panelGroup>
			</fieldset>
			<br>
			
			<fieldset>
			<legend><h:outputText value="#{bundle.historias}"></h:outputText></legend> 
			<h:panelGroup id="historias" layout="block" styleClass="field">
				<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
				<br><br>
				<h:outputText value="#{bundle.historiaMedicaPregressa}"></h:outputText>
				<br>
				<h:inputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.historiaMedicaPregressa}" 
					styleClass="field_text" disabled="true"></h:inputText>
				<br>
				<h:outputText value="#{bundle.historiafamiliar}"></h:outputText>
				<br>
				<h:inputText styleClass="field_text" disabled="true"
					value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.historiafamiliar}">
				</h:inputText>
				
				<br><br>
				<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
				<br><br>
				<h:outputText value="#{bundle.historiaMedicaPregressa}"></h:outputText>
				<br>
				<h:inputText value="#{avaliarConsultaBean.respostaPrimeira.historiaMedicaPregressa}"
					styleClass="field_text" disabled="true">
				</h:inputText>
				<br>
				<h:outputText value="#{bundle.historiafamiliar}"></h:outputText>
				<br>
				<h:inputText disabled="true" styleClass="field_text"
					value="#{avaliarConsultaBean.respostaPrimeira.historiafamiliar}">
				</h:inputText>
			</h:panelGroup>
			</fieldset>
			<br>
			
			<fieldset>
			<legend> <h:outputText value="#{bundle.estilosVida}"></h:outputText></legend> 
			<h:panelGroup id="estilosVida" layout="block" styleClass="field">
			<h:panelGrid columns="2" >				
				<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>				
				
				<h:panelGrid border="1" columns="4"  styleClass="dataTables" headerClass="headerDataTable" rowClasses="headerDataTable, odd, even, odd">
				<h:outputText value="#{bundle.substancia}"/>
				<h:outputText value="#{bundle.consumo}"/>
				<h:outputText value="#{bundle.histUso}"/>
				<h:outputText value="#{bundle.histUsoAnterior}"/>
				<h:outputText value="#{bundle.tabaco}"/>
					<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.flFuma}">
						<f:converter converterId="flagConverter" />
					</h:outputText>
					<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.historiaTabacoAtual}"></h:outputText>
				<h:panelGroup>
					<h:outputText value="#{bundle.tempoParou}"/>
					<h:outputText value=" #{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.historiaTabacoAnterior}"></h:outputText>
	
				</h:panelGroup>
				<h:outputText value="#{bundle.cafe}"/>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.flBebeCafe}">
						<f:converter converterId="flagConverter" />
					</h:outputText>
					<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.historiaCafeAtual}"></h:outputText>
	
				<h:panelGroup>
					<h:outputText value="#{bundle.tempoParou}"/> 	
					<h:outputText value=" #{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.historiaCafeAnterior}"></h:outputText>
	
				</h:panelGroup>
				<h:outputText value="#{bundle.alcool}"/>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.flBebeAlcool}">
						<f:converter converterId="flagConverter" />
					</h:outputText>
				<h:panelGroup>
					<h:outputText value="#{bundle.tipoBebida}"/> 	
					<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.tipoBebidaAlcoolica}"></h:outputText>
	
					<br/><h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.historiaAlcoolAtual}"></h:outputText>
	
				</h:panelGroup>
				<h:panelGroup>
					<h:outputText value="#{bundle.tempoParou}"/> 	
					<h:outputText value=" #{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.historiaAlcoolAnterior}"></h:outputText>
	
				</h:panelGroup>					
	
			</h:panelGrid>
			<h:panelGrid border="1" columns="4" styleClass="dataTables" headerClass="headerDataTable" rowClasses="headerDataTable, odd, even, odd">
				<h:outputText value="#{bundle.substancia}"/>
				<h:outputText value="#{bundle.consumo}"/>
				<h:outputText value="#{bundle.histUso}"/>
				<h:outputText value="#{bundle.histUsoAnterior}"/>
				<h:outputText value="#{bundle.tabaco}"/>
					<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.flFuma}">
						<f:converter converterId="flagConverter"/>
					</h:outputText>
					<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.historiaTabacoAtual}"/>
				<h:panelGroup>
					<h:outputText value="#{bundle.tempoParou}"/> 	
					<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.historiaTabacoAnterior}"/>
	
				</h:panelGroup>
				<h:outputText value="#{bundle.cafe}"/>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.flBebeCafe}">
						<f:converter converterId="flagConverter"/>
					</h:outputText>
					<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.historiaCafeAtual}"/>
	
				<h:panelGroup>
					<h:outputText value="#{bundle.tempoParou}"/> 	
					<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.historiaCafeAnterior}"/>
	
				</h:panelGroup>
				<h:outputText value="#{bundle.alcool}"/>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.flBebeAlcool}">
						<f:converter converterId="flagConverter"/>
					</h:outputText>
				<h:panelGroup>
					<h:outputText value="#{bundle.tipoBebida}"/> 
					<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.tipoBebidaAlcoolica}"/>
	
					<br/><h:outputText value="#{avaliarConsultaBean.respostaPrimeira.historiaAlcoolAtual}"/>
	
				</h:panelGroup>
				<h:panelGroup>
					<h:outputText value="#{bundle.tempoParou}"/> 	
					<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.historiaAlcoolAnterior}"/>
	
				</h:panelGroup>			
			</h:panelGrid>
			</h:panelGrid>
			</h:panelGroup>
			</fieldset>		
			
			<br>
			<fieldset>
			<legend><h:outputText value="#{bundle.paramClinicosMedicamentos}"></h:outputText></legend>			
			<h:panelGroup id="ParamMed" layout="block" styleClass="field">
				<h:outputText value="#{bundle.medicamentosAnteriores}" style="font-weight: bold"></h:outputText>
				<br>
				<h:dataTable border="1"	value="#{avaliarConsultaBean.listaMedicamentoAnt}"
					rendered="#{not empty avaliarConsultaBean.listaMedicamentoAnt}"
					var="currentParametro" styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
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
			<br>
			
			<h:panelGroup id="paramClin" layout="block" styleClass="field">			
				<h:outputText value="#{bundle.paramClinicos}" style="font-weight: bold"></h:outputText>		
				<br>	
				<h:dataTable border="1" value="#{avaliarConsultaBean.listaParametros}" var="currentParametro" 
					styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
					<h:column id="column1">
						<h:outputText value="#{currentParametro.descricao}"/>
						<f:facet name="header">
							<h:outputText value="#{bundle.descricao}"/>
						</f:facet>
					</h:column>
					<h:column id="column2">
						<h:outputText value="#{currentParametro.valor}"/>
						<f:facet name="header">
							<h:outputText value="#{bundle.valor}"/>
						</f:facet>
					</h:column>
					<h:column id="column3">
						<h:outputText value="#{currentParametro.unidade}"/>
						<f:facet name="header">
							<h:outputText value="#{bundle.unidade}"/>
						</f:facet>
					</h:column>
					<h:column id="column4">
						<h:outputText value="#{currentParametro.valorDeReferencia}"/>
						<f:facet name="header">
							<h:outputText value="#{bundle.valorRef}"/>
						</f:facet>
					</h:column>
				</h:dataTable>
			</h:panelGroup>
			
			<br>			
			<h:panelGroup id="medP" layout="block" styleClass="field">			
			<h:outputText value="#{bundle.medicamentosPresc}" style="font-weight: bold"></h:outputText>
			<br>
			<h:dataTable border="1" value="#{avaliarConsultaBean.listaMedicamentoP}" var="currentParametro" style="width: 759px"
				styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
				<h:column id="column1">
					<h:outputText value="#{currentParametro.descricao}"/>
					<f:facet name="header">
						<h:outputText value="#{bundle.nomeGenerico}"/>
					</f:facet>
				</h:column>
				<h:column id="column2">
					<h:outputText value="#{currentParametro.dosagem}"/>
					<f:facet name="header">
						<h:outputText value="#{bundle.dosagem}"/>
					</f:facet>
				</h:column>
				<h:column id="column3">
					<h:outputText value="#{currentParametro.posologia}"/>
					<f:facet name="header">
						<h:outputText value="#{bundle.posologia}"/>
					</f:facet>
				</h:column>
				<h:column id="column4">
					<h:outputText value="#{currentParametro.nmMedico}"/>
					<f:facet name="header">
						<h:outputText value="#{bundle.nomePrescritor}"/>
					</f:facet>
				</h:column>
				<h:column id="column5">
					<h:outputText value="#{currentParametro.especialidadeMedico}"/>
					<f:facet name="header">
						<h:outputText value="#{bundle.especialidade}"/>
					</f:facet>
				</h:column>				
			</h:dataTable>
			</h:panelGroup>
						
			<br>			
			<h:panelGroup id="medNP" layout="block" styleClass="field">			
			<h:outputText value="#{bundle.medicamentosNaoPresc}" style="font-weight: bold"></h:outputText>
			<br>
			<h:dataTable border="1" value="#{avaliarConsultaBean.listaMedicamentoNP}" var="currentParametro"
				styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
				<h:column id="column1">
					<h:outputText value="#{currentParametro.descricao}"/>
					<f:facet name="header">
						<h:outputText value="#{bundle.nomeGenerico}"/>
					</f:facet>
				</h:column>
				<h:column id="column2">
					<h:outputText value="#{currentParametro.dosagem}"/>
					<f:facet name="header">
						<h:outputText value="#{bundle.dosagem}"/>
					</f:facet>
				</h:column>
				<h:column id="column3">
					<h:outputText value="#{currentParametro.posologia}"/>
					<f:facet name="header">
						<h:outputText value="#{bundle.posologia}"/>
					</f:facet>
				</h:column>			
			</h:dataTable>
			</h:panelGroup>
			</fieldset>
			
			<br>
			<fieldset>
			<legend><h:outputText value="#{bundle.examesFisicos}"></h:outputText></legend> 
			<h:panelGroup id="examesFisicos" layout="block" styleClass="field">
			<h:panelGrid border="1" columns="3" styleClass="dataTables" 
				headerClass="headerDataTable" rowClasses="headerDataTable, odd, even, odd, even, odd, even">
				<h:outputText value="-----" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
				
				<h:outputText value="#{bundle.peso}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.peso}"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.peso}"></h:outputText>
				
				<h:outputText value="#{bundle.altura}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.altura}"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.altura}"></h:outputText>
				
				<h:outputText value="#{bundle.imc}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.imcCorreto}"><f:convertNumber maxFractionDigits="1" /></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.imc}"><f:convertNumber maxFractionDigits="1" /></h:outputText>
				
				<h:outputText value="#{bundle.pressaoArt}" style="font-weight: bold"></h:outputText>
				<h:panelGrid border="" columns="3">
					<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.pressaoSistolica}"></h:outputText>
					/
					<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.pressaoDiastolica}"></h:outputText>
				</h:panelGrid>
				<h:panelGrid border="" columns="3">
					<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.pressaoSistolica}"></h:outputText>
					/
					<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.pressaoDiastolica}"></h:outputText>
				</h:panelGrid>
				
				<h:outputText value="#{bundle.temperatura}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.temperatura}"><f:convertNumber maxFractionDigits="1" /></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.temperatura}"><f:convertNumber maxFractionDigits="1" /></h:outputText>
				
				<h:outputText value="#{bundle.alergias}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.consulta.fkCasoClinico.alergias}"></h:outputText>
				<h:outputText value="#{avaliarConsultaBean.respostaPrimeira.alergias}"></h:outputText>			
			</h:panelGrid>
			</h:panelGroup>
			</fieldset>			
	
			<br>
			<fieldset><legend><h:outputText value="#{bundle.revisaoSistemas}"></h:outputText></legend>
			<h:panelGroup id="revisaoSistemas" layout="block" styleClass="field">			
			<h:panelGrid border="0" columns="2">
				<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
				<h:dataTable border="1" value="#{avaliarConsultaBean.listaQueixa1}" 
					var="currentParametro" styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
					<h:column id="column1">
						<h:outputText value="#{currentParametro.descricao}"></h:outputText>
						<f:facet name="header">
							<h:outputText value="#{bundle.descricao}"></h:outputText>
						</f:facet>
					</h:column>
				</h:dataTable>
				<h:dataTable border="1" value="#{avaliarConsultaBean.listaQueixaResposta1}" 
					var="currentParametro" styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
					<h:column id="column1">
						<h:outputText value="#{currentParametro.descricao}"></h:outputText>
						<f:facet name="header">
							<h:outputText value="#{bundle.descricao}"></h:outputText>
						</f:facet>
					</h:column>
				</h:dataTable>
			</h:panelGrid>
			</h:panelGroup>
			</fieldset>
	
			<br>
			<fieldset>
			<legend><h:outputText value="#{bundle.avaliacao}"></h:outputText></legend> 
			<h:panelGroup id="avaliacao" layout="block" styleClass="field">				
				<br>
				<h:outputText value="#{bundle.nota}:"></h:outputText>
				<h:inputText value="#{avaliarConsultaBean.nota}"></h:inputText>
				<br><br>
				<h:outputText value="#{bundle.comentariosAluno}:"></h:outputText>
				<br>
				<h:inputTextarea style="height: 143px; width: 100%; background-color: AntiqueWhite" value="#{avaliarConsultaBean.comentariosAluno}"></h:inputTextarea><br><br>
			</h:panelGroup>
			</fieldset>			
			
			<p align="center">
			<h:commandButton action="#{avaliarConsultaBean.correto1}" value="#{bundle.correto}"></h:commandButton>
			<h:commandButton action="#{avaliarConsultaBean.inCorreto1}" value="#{bundle.refazer}"></h:commandButton>
			</p>	
	
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