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
				<h:graphicImage value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.fotoFileName}"></h:graphicImage>
				<br>
				<h:outputText value="#{bundle.casoInicial} " style="font-weight: bold;" ></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.relatoDeCasoPrimeiraConsulta}"></h:outputText>
			</h:panelGroup>
			<h:panelGroup layout="block" id="wraper" styleClass="wraper">
				
			<h:panelGroup layout="block" id="mainContent" styleClass="mainContent">
			<br>
			<h:outputText value="#{bundle.comentariosTutor}" style="font-weight: bold"></h:outputText>
			<br>
			<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.comentarioAluno}"></h:outputText>
		
			<br><br>
			<fieldset>
			<legend><h:outputText value="#{bundle.dadosDemAnt}"></h:outputText></legend> 
			<h:panelGroup id="demoAntro" layout="block" styleClass="field">
			<h:panelGrid border="1" columns="3" styleClass="dataTables" headerClass="headerDataTable" rowClasses="headerDataTable,odd, even,odd, even,odd, even,odd, even">
				<h:outputText value="-----" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{bundle.nome}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.nome}"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.nome}"></h:outputText>
				<h:outputText value="#{bundle.genero}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.genero}"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.genero}"></h:outputText>
				<h:outputText value="#{bundle.dataNasc}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.dataNascimento}">
					<f:convertDateTime pattern="dd/MM/yyyy"/>
				</h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.dataNascimento}">
					<f:convertDateTime pattern="dd/MM/yyyy"/>
				</h:outputText>
				<h:outputText value="#{bundle.medicos}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.medicosQueAtendem}"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.medicosQueAtendem}"></h:outputText>
				<h:outputText value="#{bundle.ocupacao}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.ocupacao}"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.ocupacao}"></h:outputText>
				<h:outputText value="#{bundle.escolaridade}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.escolaridadeTraduzida}"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.escolaridadeTraduzidaAluno}"></h:outputText>
				<h:outputText value="#{bundle.moradiaFamilia}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.moradiaFamilia}"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.moradiaFamilia}"></h:outputText>					
				<h:outputText value="#{bundle.planoSaude}" style="font-weight: bold"/>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.planoDeSaude}"/>			
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.planoDeSaude}"/>
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
					<h:dataTable border="1" value="#{respostasAlunoFinalizadoBean.listaRazaoEncontroCaso}" var="currentParametro">
						<h:column id="column1">
							<h:outputText value="#{currentParametro.descricao}"></h:outputText>							
						</h:column>
					</h:dataTable>
					<br><br>
					<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
					<br><br>
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.razaoEncontro}" 
						rendered="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroRazaoEncontroTxt == ''}"></h:outputText>
					<h:panelGroup rendered="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroRazaoEncontroTxt != ''}">
						<h:outputText value="#{bundle.outro}:"></h:outputText>
						&nbsp;
						<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroRazaoEncontroTxt}"></h:outputText>					
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
						<h:dataTable border="1" value="#{respostasAlunoFinalizadoBean.listaExperienciaMedicamentos1Caso}" var="currentParametro">
							<h:column id="column1">
								<h:outputText value="#{currentParametro.descricao}"></h:outputText>							
							</h:column>
						</h:dataTable>
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.necessidadeAtencao1}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos2}"></h:outputText>
						<h:dataTable border="1" value="#{respostasAlunoFinalizadoBean.listaExperienciaMedicamentos2Caso}" var="currentParametro">
							<h:column id="column1">
								<h:outputText value="#{currentParametro.descricao}"></h:outputText>							
							</h:column>
						</h:dataTable>
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.necessidadeAtencao2}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos3}"></h:outputText>
						<h:dataTable border="1" value="#{respostasAlunoFinalizadoBean.listaExperienciaMedicamentos3Caso}" var="currentParametro">
							<h:column id="column1">
								<h:outputText value="#{currentParametro.descricao}"></h:outputText>							
							</h:column>
						</h:dataTable>
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.necessidadeAtencao3}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos4}"></h:outputText>
						<h:dataTable border="1" value="#{respostasAlunoFinalizadoBean.listaExperienciaMedicamentos4Caso}" var="currentParametro">
							<h:column id="column1">
								<h:outputText value="#{currentParametro.descricao}"></h:outputText>							
							</h:column>
						</h:dataTable>
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.necessidadeAtencao4}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos5}"></h:outputText>
						<h:dataTable border="1" value="#{respostasAlunoFinalizadoBean.listaExperienciaMedicamentos5Caso}" var="currentParametro">
							<h:column id="column1">
								<h:outputText value="#{currentParametro.descricao}"></h:outputText>							
							</h:column>
						</h:dataTable>
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.necessidadeAtencao5}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
				</h:panelGrid>				
				<h:panelGrid columns="1">
						<h:outputText value="#{bundle.conclusao}"></h:outputText>
						<h:dataTable border="1" value="#{respostasAlunoFinalizadoBean.listaExperienciaMedicamentosConcCaso}" var="currentParametro">
							<h:column id="column1">
								<h:outputText value="#{currentParametro.descricao}"></h:outputText>							
							</h:column>
						</h:dataTable>
					</h:panelGrid>
				
				<br>
				<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
				<br><br>
				<h:panelGrid border="0" columns="2" style="width: 100%;">
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos1}"></h:outputText>
						<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.experienciaMedicamentos1}"
							rendered="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMed1Txt == ''}"></h:outputText>
						<h:panelGroup rendered="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMed1Txt != ''}">
							<h:outputText value="#{bundle.outro}:"></h:outputText>
							&nbsp;
							<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMed1Txt}" style="width: 80%"></h:outputText>
						</h:panelGroup>	
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.necessidadeAtencao1}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos2}"></h:outputText>
						<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.experienciaMedicamentos2}"
							rendered="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMed2Txt == ''}"></h:outputText>
						<h:panelGroup rendered="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMed2Txt != ''}">
							<h:outputText value="#{bundle.outro}:"></h:outputText>
							&nbsp;
							<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMed2Txt}" style="width: 80%"></h:outputText>
						</h:panelGroup>	
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.necessidadeAtencao2}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos3}"></h:outputText>
						<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.experienciaMedicamentos3}"
							rendered="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMed3Txt == ''}"></h:outputText>
						<h:panelGroup rendered="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMed3Txt != ''}">
							<h:outputText value="#{bundle.outro}:"></h:outputText>
							&nbsp;
							<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMed3Txt}" style="width: 80%"></h:outputText>
						</h:panelGroup>	
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.necessidadeAtencao3}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos4}"></h:outputText>
						<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.experienciaMedicamentos4}"
							rendered="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMed4Txt == ''}"></h:outputText>
						<h:panelGroup rendered="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMed4Txt != ''}">
							<h:outputText value="#{bundle.outro}:"></h:outputText>
							&nbsp;
							<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMed4Txt}" style="width: 80%"></h:outputText>
						</h:panelGroup>	
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.necessidadeAtencao4}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
					
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.experienciaMedicamentos5}"></h:outputText>
						<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.experienciaMedicamentos5}"
							rendered="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMed5Txt == ''}"></h:outputText>
						<h:panelGroup rendered="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMed5Txt != ''}">
							<h:outputText value="#{bundle.outro}:"></h:outputText>
							&nbsp;
							<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMed5Txt}" style="width: 80%"></h:outputText>
						</h:panelGroup>	
					</h:panelGrid>
					<h:panelGrid columns="1">
						<h:outputText value="#{bundle.necessidadeAtencao}"></h:outputText>
						<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.necessidadeAtencao5}">
							<f:converter converterId="flagConverter" />
						</h:outputText>					
					</h:panelGrid>
				</h:panelGrid>
				<h:panelGrid columns="1">
					<h:outputText value="#{bundle.conclusao}"></h:outputText>
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.conclusao}"
							rendered="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMedConcTxt == ''}"></h:outputText>
						<h:panelGroup rendered="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMedConcTxt != ''}">
							<h:outputText value="#{bundle.outro}:"></h:outputText>
							&nbsp;
							<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.outroExpMedConcTxt}" style="width: 80%"></h:outputText>
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
				<h:inputText readonly="true"
					value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.historiaMedicaPregressa}"
					styleClass="field_text"></h:inputText>
				<br><br>
				<h:outputText value="#{bundle.historiafamiliar}"></h:outputText>
				<br>
				<h:inputText styleClass="field_text" readonly="true"
					value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.historiafamiliar}">
				</h:inputText>
				
				<br><br>
				<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
				<br><br>
				<h:outputText value="#{bundle.historiaMedicaPregressa}"></h:outputText>
				<br>
				<h:inputText readonly="true"
					value="#{respostasAlunoFinalizadoBean.respostaPrimeira.historiaMedicaPregressa}"
					styleClass="field_text"></h:inputText>
				<br><br>
				<h:outputText value="#{bundle.historiafamiliar}"></h:outputText>
				<br>
				<h:inputText styleClass="field_text" readonly="true"
					value="#{respostasAlunoFinalizadoBean.respostaPrimeira.historiafamiliar}">
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
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.flFuma}">
						<f:converter converterId="flagConverter" />
					</h:outputText>
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.historiaTabacoAtual}"></h:outputText>
				<h:panelGroup>
					<h:outputText value="#{bundle.tempoParou}"/>
					<h:outputText value=" #{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.historiaTabacoAnterior}"></h:outputText>
	
				</h:panelGroup>
				<h:outputText value="#{bundle.cafe}"/>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.flBebeCafe}">
						<f:converter converterId="flagConverter" />
					</h:outputText>
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.historiaCafeAtual}"></h:outputText>
	
				<h:panelGroup>
					<h:outputText value="#{bundle.tempoParou}"/> 	
					<h:outputText value=" #{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.historiaCafeAnterior}"></h:outputText>
	
				</h:panelGroup>
				<h:outputText value="#{bundle.alcool}"/>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.flBebeAlcool}">
						<f:converter converterId="flagConverter" />
					</h:outputText>
				<h:panelGroup>
					<h:outputText value="#{bundle.tipoBebida}"/> 	
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.tipoBebidaAlcoolica}"></h:outputText>
	
					<br/><h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.historiaAlcoolAtual}"></h:outputText>
	
				</h:panelGroup>
				<h:panelGroup>
					<h:outputText value="#{bundle.tempoParou}"/> 	
					<h:outputText value=" #{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.historiaAlcoolAnterior}"></h:outputText>
	
				</h:panelGroup>					
	
			</h:panelGrid>
			<h:panelGrid border="1" columns="4" styleClass="dataTables" headerClass="headerDataTable" rowClasses="headerDataTable, odd, even, odd">
				<h:outputText value="#{bundle.substancia}"/>
				<h:outputText value="#{bundle.consumo}"/>
				<h:outputText value="#{bundle.histUso}"/>
				<h:outputText value="#{bundle.histUsoAnterior}"/>
				<h:outputText value="#{bundle.tabaco}"/>
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.flFuma}">
						<f:converter converterId="flagConverter"/>
					</h:outputText>
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.historiaTabacoAtual}"/>
				<h:panelGroup>
					<h:outputText value="#{bundle.tempoParou}"/> 	
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.historiaTabacoAnterior}"/>
	
				</h:panelGroup>
				<h:outputText value="#{bundle.cafe}"/>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.flBebeCafe}">
						<f:converter converterId="flagConverter"/>
					</h:outputText>
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.historiaCafeAtual}"/>
	
				<h:panelGroup>
					<h:outputText value="#{bundle.tempoParou}"/> 	
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.historiaCafeAnterior}"/>
	
				</h:panelGroup>
				<h:outputText value="#{bundle.alcool}"/>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.flBebeAlcool}">
						<f:converter converterId="flagConverter"/>
					</h:outputText>
				<h:panelGroup>
					<h:outputText value="#{bundle.tipoBebida}"/> 
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.tipoBebidaAlcoolica}"/>
	
					<br/><h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.historiaAlcoolAtual}"/>
	
				</h:panelGroup>
				<h:panelGroup>
					<h:outputText value="#{bundle.tempoParou}"/> 	
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.historiaAlcoolAnterior}"/>
	
				</h:panelGroup>			
			</h:panelGrid>
			</h:panelGrid>
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
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.peso}"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.peso}"></h:outputText>
				
				<h:outputText value="#{bundle.altura}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.altura}"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.altura}"></h:outputText>
				
				<h:outputText value="#{bundle.imc}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.imcCorreto}"><f:convertNumber maxFractionDigits="1" /></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.imc}"><f:convertNumber maxFractionDigits="1" /></h:outputText>
				
				<h:outputText value="#{bundle.pressaoArt}" style="font-weight: bold"></h:outputText>
				<h:panelGrid columns="3">
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.pressaoSistolica}"></h:outputText>
					/
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.pressaoDiastolica}"></h:outputText>
				</h:panelGrid>
				<h:panelGrid columns="3">
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.pressaoSistolica}"></h:outputText>
					/
					<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.pressaoDiastolica}"></h:outputText>
				</h:panelGrid>
				
				<h:outputText value="#{bundle.temperatura}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.temperatura}"><f:convertNumber maxFractionDigits="1" /></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.temperatura}"><f:convertNumber maxFractionDigits="1" /></h:outputText>
				
				<h:outputText value="#{bundle.alergias}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.consulta.fkCasoClinico.alergias}"></h:outputText>
				<h:outputText value="#{respostasAlunoFinalizadoBean.respostaPrimeira.alergias}"></h:outputText>			
			</h:panelGrid>
			</h:panelGroup>
			</fieldset>			
	
			<br>
			<fieldset><legend><h:outputText value="#{bundle.revisaoSistemas}"></h:outputText></legend>
			<h:panelGroup id="revisaoSistemas" layout="block" styleClass="field">			
			<h:panelGrid border="0" columns="2">
				<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
				<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
				<h:dataTable border="1" value="#{respostasAlunoFinalizadoBean.listaQueixa1}" 
					var="currentParametro" styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
					<h:column id="column1">
						<h:outputText value="#{currentParametro.descricao}"></h:outputText>
						<f:facet name="header">
							<h:outputText value="#{bundle.descricao}"></h:outputText>
						</f:facet>
					</h:column>
				</h:dataTable>
				<h:dataTable border="1" value="#{respostasAlunoFinalizadoBean.listaQueixaResposta1}" 
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