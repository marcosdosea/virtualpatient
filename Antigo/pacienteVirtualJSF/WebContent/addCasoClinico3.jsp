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
		<br>	
		</h:panelGroup>
		</fieldset>	
			
			<br>
			<h:panelGrid border="1" columns="2" id="legenda" styleClass="tableRight, tableMenorAnaliseSegundaConsulta, field" headerClass="headerDataTable" rowClasses="odd, even">
			<f:facet name="header">
				<h:outputText value="#{bundle.legenda}"></h:outputText>
			</f:facet>
			<h:outputText value="#{bundle.prm} "></h:outputText>
			<h:outputText value="#{bundle.proRelMedicamento}"></h:outputText>
		</h:panelGrid>
			<br>
			<br>
			<h:commandButton action="#{casoClinicoBean.tabelas}" value="#{bundle.avancar}"></h:commandButton>
	
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