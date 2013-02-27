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
		<h:outputText value="#{avaliarConsulta2Bean.fake}"></h:outputText>
		
		<h:panelGroup layout="block" id="sidebar" styleClass="sidebar">
			<h:graphicImage value="#{avaliarConsulta2Bean.respostaSegunda.consulta.fkCasoClinico.fotoFileName}"></h:graphicImage>
			<br>
			<h:outputText value="#{bundle.casoInicial} " style="font-weight: bold;" ></h:outputText>
			<h:outputText value="#{avaliarConsulta2Bean.respostaSegunda.consulta.fkCasoClinico.relatoDeCasoPrimeiraConsulta}"/>
			<br><br>
			<h:outputText value="#{bundle.casoEvolucao} " style="font-weight: bold;" ></h:outputText>
			<h:outputText value="#{avaliarConsulta2Bean.respostaSegunda.consulta.fkCasoClinico.relatoDeCasoSegundaConsulta}"/>
		
		</h:panelGroup>
		
	    <h:panelGroup layout="block" id="wraper" styleClass="wraper">				
		<h:panelGroup layout="block" id="mainContent" styleClass="mainContent">	

		
		<br><h2><h:outputText value="#{bundle.avaliacaoSegundaConsulta}"></h:outputText></h2>
		<br><br>
		<h:outputText value="#{bundle.dataRealizacao}: "></h:outputText>
		<h:outputText value="#{avaliarConsulta2Bean.respostaSegunda.dataRealizacao}"><f:convertDateTime pattern="dd/MM/yyyy"/></h:outputText>
		<br>
		<br>
		<br>	
		<fieldset>
		<legend><h:outputText value="#{bundle.queixas}"></h:outputText></legend> 
		<h:panelGroup id="queixas" layout="block" styleClass="field">					
		<h:panelGrid columns="1">
			<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
			
		<h:dataTable value="#{avaliarConsulta2Bean.listaGabarito}" var="currentQueixaResposta" >
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
				
		<br>		
		<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>			
		<h:dataTable value="#{avaliarConsulta2Bean.listaAluno}" var="currentQueixaResposta" >
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
						<h:panelGroup>
							<h:outputText value="#{bundle.suspeitaPRM}"  rendered="#{currentQueixaResposta.tipo == 'P'}"></h:outputText>
							<h:outputText value="#{bundle.doencaAgravo}"  rendered="#{currentQueixaResposta.tipo == 'D'}"></h:outputText>														
						</h:panelGroup>
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
		
		</h:panelGrid>
		<br>
		
		<h:panelGrid border="1" columns="2" id="legenda" styleClass="tableRight, tableMenorAnaliseSegundaConsulta" headerClass="headerDataTable" rowClasses="odd, even">
			<f:facet name="header">
				<h:outputText value="#{bundle.legenda}"></h:outputText>
			</f:facet>
			<h:outputText value="#{bundle.prm}"></h:outputText>
			<h:outputText value="#{bundle.proRelMedicamento}"></h:outputText>		
			<h:outputText value="#{bundle.n}"></h:outputText>
			<h:outputText value="#{bundle.necessario}"></h:outputText>
			<h:outputText value="#{bundle.e}"></h:outputText>
			<h:outputText value="#{bundle.efetivo}"></h:outputText>
			<h:outputText value="#{bundle.s}"></h:outputText>
			<h:outputText value="#{bundle.seguro}"></h:outputText>
			<h:outputText value="#{bundle.c}"></h:outputText>
			<h:outputText value="#{bundle.cumprimento}"></h:outputText>
		</h:panelGrid>	
		<br>
		<br>
		</h:panelGroup>
		</fieldset>
		<br>
				
		
		<fieldset>
		<legend><h:outputText value="#{bundle.intervencoes}"></h:outputText></legend> 
		<h:panelGroup id="intervencoes" layout="block" styleClass="field">				
			<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>			
			<h:dataTable border="1" value="#{avaliarConsulta2Bean.listaIntervencaoGabarito}" var="currentParametro"
				styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
				
				<h:column>
					<h:outputText value="#{currentParametro.descricao}"></h:outputText>
					<f:facet name="header">
						<h:outputText value="#{bundle.descricao}"></h:outputText>
					</f:facet>
				</h:column>
				<h:column>
					<h:outputText value="#{currentParametro.indicacao}"></h:outputText>
					<f:facet name="header">
						<h:outputText value="#{bundle.comunicacao}"></h:outputText>
					</f:facet>
				</h:column>
			</h:dataTable>
			<br>
			<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
			<h:dataTable border="1" value="#{avaliarConsulta2Bean.listaIntervencaoAluno}" var="currentParametro"
				styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
				
				<h:column id="column1">
					<h:outputText value="#{currentParametro.descricao}"></h:outputText>
					<f:facet name="header">
						<h:outputText value="#{bundle.descricao}"></h:outputText>
					</f:facet>
				</h:column>
				<h:column>
					<h:outputText value="#{currentParametro.indicacao}"></h:outputText>
					<f:facet name="header">
						<h:outputText value="#{bundle.comunicacao}"></h:outputText>
					</f:facet>
				</h:column>
				<h:column id="column2">
					<h:outputText value="#{currentParametro.justificativa}"></h:outputText>
					<f:facet name="header">
						<h:outputText value="#{bundle.justificativa}"></h:outputText>
					</f:facet>
				</h:column>
			</h:dataTable>		
		<br/>
		</h:panelGroup>
		</fieldset>

		
		<br>
		<fieldset>
		<legend><h:outputText value="#{bundle.avaliacao}"></h:outputText></legend> 
		<h:panelGroup id="avaliacao" layout="block" styleClass="field">
			<br>
			<h:outputText value="#{bundle.nota}:"></h:outputText>
			<h:inputText value="#{avaliarConsulta2Bean.nota}"/>
			<br><br>
			<h:outputText value="#{bundle.comentariosAluno}:"></h:outputText>
			<br>
			<h:inputTextarea  style="height: 143px; width: 100%; background-color: AntiqueWhite" value="#{avaliarConsulta2Bean.comentariosAluno}"/>
		</h:panelGroup>
		</fieldset>
		
		<p align="center">
		<h:commandButton action="#{avaliarConsulta2Bean.correto1}" value="#{bundle.correto}"/>
		<h:commandButton action="#{avaliarConsulta2Bean.inCorreto1}" value="#{bundle.refazer}"/></p>
	
	
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