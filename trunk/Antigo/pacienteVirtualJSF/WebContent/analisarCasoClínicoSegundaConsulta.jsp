<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%><%@taglib
	uri="http://java.sun.com/jsf/core" prefix="f"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PharmaVP</title>
<link href="${pageContext.request.contextPath}/css/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link rel="StyleSheet" type="text/css"
	href="${pageContext.request.contextPath}/css/cssAnalise.css"
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
			<h:panelGroup layout="block" id="sidebar" styleClass="sidebar">
				<h:graphicImage value="#{respostaDoAluno2Bean.alunoLogado.consultaAtual.fkCasoClinico.fotoFileName}"></h:graphicImage>
				<br>
				<h:outputText value="#{bundle.casoInicial} " style="font-weight: bold;" ></h:outputText>	
				<h:outputText value="#{respostaDoAluno2Bean.alunoLogado.consultaAtual.fkCasoClinico.relatoDeCasoPrimeiraConsulta}"/>
				<br><br>
				<h:outputText value="#{bundle.casoEvolucao} " style="font-weight: bold;" ></h:outputText>	
				<h:outputText value="#{respostaDoAluno2Bean.alunoLogado.consultaAtual.fkCasoClinico.relatoDeCasoSegundaConsulta}"/>
			</h:panelGroup>
			
			<h:panelGroup layout="block" id="wraper" styleClass="wraper">
				
		<h:panelGroup layout="block" id="mainContent" styleClass="mainContent">
		<br>
		<h2><h:outputText  value="#{bundle.analisarCasoSegundaConsulta}"></h:outputText></h2>
		<br>
		<h:outputText  value="#{bundle.tentativaNumero}"></h:outputText>
		<h:outputText value=" #{respostaDoAluno2Bean.alunoLogado.nrTentativa}"></h:outputText>
		<br><br>
					
		<fieldset>
		<legend><h:outputText value="#{bundle.paramClinicosMedicamentos}"></h:outputText></legend> 
		<h:panelGroup id="ParamMed" layout="block" styleClass="field">		
		
		<h:outputText value="#{bundle.medicamentosAnteriores}" style="font-weight: bold"
					rendered="#{not empty respostaDoAluno2Bean.listaMedicamentoAnt}"></h:outputText>
		<br>
		<h:dataTable border="1"	value="#{respostaDoAluno2Bean.listaMedicamentoAnt}"
			rendered="#{not empty respostaDoAluno2Bean.listaMedicamentoAnt}"
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
		<br>
		<h:outputText value="#{bundle.paramClinicos}" style="font-weight: bold" rendered="#{not empty respostaDoAluno2Bean.parametrosClinicos}"></h:outputText><br>
		<h:dataTable border="1" value="#{respostaDoAluno2Bean.parametrosClinicos}" rendered="#{not empty respostaDoAluno2Bean.parametrosClinicos}" var="currentParametro" 
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
		<br>
		<h:outputText value="#{bundle.medicamentosPresc}" style="font-weight: bold" rendered="#{not empty respostaDoAluno2Bean.medicamentosPrescritos}"></h:outputText><br>
		<h:dataTable border="1" value="#{respostaDoAluno2Bean.medicamentosPrescritos}" var="currentParametro" rendered="#{not empty respostaDoAluno2Bean.medicamentosPrescritos}" styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
			<h:column id="column1">
				<h:outputText rendered="#{not currentParametro.flItalico}" value="#{currentParametro.descricao}"/>
				<h:outputText rendered="#{currentParametro.flItalico}" value="#{currentParametro.descricao}" style="font-style: italic"/>

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
			
		</h:dataTable><br>
		<h:outputText value="#{bundle.medicamentosNaoPresc}" style="font-weight: bold" rendered="#{not empty respostaDoAluno2Bean.medicamentosNaoPrescritos}"></h:outputText><br>
		<h:dataTable border="1" value="#{respostaDoAluno2Bean.medicamentosNaoPrescritos}" rendered="#{not empty respostaDoAluno2Bean.medicamentosNaoPrescritos}" var="currentParametro" styleClass="dataTables" headerClass="headerDataTable" rowClasses="odd, even">
			<h:column id="column1">
				<h:outputText rendered="#{not currentParametro.flItalico}" value="#{currentParametro.descricao}"/>
				<h:outputText rendered="#{currentParametro.flItalico}" value="#{currentParametro.descricao}" style="font-style: italic"/>

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
		<legend><h:outputText value="#{bundle.queixas}"></h:outputText></legend>
		<h:panelGroup layout="block" id="queixasIni" styleClass="field">
		<h:dataTable value="#{respostaDoAluno2Bean.listaAux}" var="currentQueixaResposta" >
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
						<h:inputText value="#{currentQueixaResposta.prioridade}" style="width: 60px;" required="true"/>
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
		
		<h:panelGrid border="1" columns="2" id="legenda" styleClass="tableRight, tableMenorAnaliseSegundaConsulta" headerClass="headerDataTable" rowClasses="odd, even">
			<f:facet name="header">
				<h:outputText value="#{bundle.legenda}"></h:outputText>
			</f:facet>
			<h:outputText value="#{bundle.prm}"></h:outputText>
			<h:outputText value="#{bundle.proRelMedicamento}"></h:outputText>
		</h:panelGrid>
		</h:panelGroup>
		</fieldset>	
		
		
		<br>
		
		<fieldset><legend><h:outputText value="#{bundle.intervFarmacIniciais}"></h:outputText></legend> 
		<h:panelGroup id="intervencoesIni" layout="block" styleClass="field">	
		<h:panelGrid border="0" columns="4" columnClasses="columnsCasoClinicoP,columnsCasoClinico2, column3" rowClasses="rowCasoClinicoP">
		
			<h:outputText value=""></h:outputText>
			<h:outputText value="#{bundle.iniciarMedicamento}" style="height:30px" styleClass="headerGridQueixasMed"></h:outputText>
			<h:outputText value="#{bundle.comunicacao}" styleClass="headerGridQueixasMed"></h:outputText>
			<h:outputText value="#{bundle.justificativa}" styleClass="headerGridQueixasMed"></h:outputText>
			
			<h:selectBooleanCheckbox value="#{respostaDoAluno2Bean.ativoIntervencao1etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{respostaDoAluno2Bean.descricaoIntervencao1}"></h:outputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencao1}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />		
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencao1}"></h:inputTextarea>
			
			<h:selectBooleanCheckbox value="#{respostaDoAluno2Bean.ativoIntervencao2etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{respostaDoAluno2Bean.descricaoIntervencao2}"></h:outputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencao2}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />		
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencao2}"></h:inputTextarea>
			
			<h:outputText value=""></h:outputText>
			<h:outputText value="#{bundle.modificarFarmacoterapia}" styleClass="headerGridQueixasMed"></h:outputText>
			<h:outputText value=""></h:outputText>
			<h:outputText value=""></h:outputText>
			
			<h:selectBooleanCheckbox value="#{respostaDoAluno2Bean.ativoIntervencao3etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{respostaDoAluno2Bean.descricaoIntervencao3}"></h:outputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencao3}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />		
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencao3}"></h:inputTextarea>
			
			<h:selectBooleanCheckbox value="#{respostaDoAluno2Bean.ativoIntervencao4etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{respostaDoAluno2Bean.descricaoIntervencao4}"></h:outputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencao4}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />		
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencao4}"></h:inputTextarea>
			
			<h:selectBooleanCheckbox value="#{respostaDoAluno2Bean.ativoIntervencao5etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{respostaDoAluno2Bean.descricaoIntervencao5}"></h:outputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencao5}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />		
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencao5}"></h:inputTextarea>
			
			<h:selectBooleanCheckbox value="#{respostaDoAluno2Bean.ativoIntervencao6etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{respostaDoAluno2Bean.descricaoIntervencao6}"></h:outputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencao6}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />	
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencao6}"></h:inputTextarea>
			
			<h:outputText value=""></h:outputText>
			<h:outputText value="#{bundle.descontinuarFarmacoterapia}" styleClass="headerGridQueixasMed"></h:outputText>
			<h:outputText value=""></h:outputText>
			<h:outputText value=""></h:outputText>
			
			<h:selectBooleanCheckbox value="#{respostaDoAluno2Bean.ativoIntervencao7etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{respostaDoAluno2Bean.descricaoIntervencao7}"></h:outputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencao7}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />		
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencao7}"></h:inputTextarea>
			
			<h:selectBooleanCheckbox value="#{respostaDoAluno2Bean.ativoIntervencao8etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{respostaDoAluno2Bean.descricaoIntervencao8}"></h:outputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencao8}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />		
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencao8}"></h:inputTextarea>
			
			<h:selectBooleanCheckbox value="#{respostaDoAluno2Bean.ativoIntervencao9etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{respostaDoAluno2Bean.descricaoIntervencao9}"></h:outputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencao9}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />		
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencao9}"></h:inputTextarea>
			
			<h:outputText value=""></h:outputText>
			<h:outputText value="#{bundle.educacao}" styleClass="headerGridQueixasMed"></h:outputText>
			<h:outputText value=""></h:outputText>	
			<h:outputText value=""></h:outputText>		
			
			<h:selectBooleanCheckbox value="#{respostaDoAluno2Bean.ativoIntervencao10etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{respostaDoAluno2Bean.descricaoIntervencao10}"></h:outputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencao10}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />		
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencao10}"></h:inputTextarea>
			
			<h:selectBooleanCheckbox value="#{respostaDoAluno2Bean.ativoIntervencao11etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{respostaDoAluno2Bean.descricaoIntervencao11}"></h:outputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencao11}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />	
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencao11}"></h:inputTextarea>
			
			<h:selectBooleanCheckbox value="#{respostaDoAluno2Bean.ativoIntervencao12etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{respostaDoAluno2Bean.descricaoIntervencao12}"></h:outputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencao12}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />		
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencao12}"></h:inputTextarea>
			
			<h:outputText value=""></h:outputText>
			<h:outputText value="#{bundle.monitorizacao}" styleClass="headerGridQueixasMed"></h:outputText>
			<h:outputText value=""></h:outputText>	
			<h:outputText value=""></h:outputText>
			
			<h:selectBooleanCheckbox value="#{respostaDoAluno2Bean.ativoIntervencao13etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{respostaDoAluno2Bean.descricaoIntervencao13}"></h:outputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencao13}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />	
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencao13}"></h:inputTextarea>
			
			<h:selectBooleanCheckbox value="#{respostaDoAluno2Bean.ativoIntervencao14etapa1}"></h:selectBooleanCheckbox>
			<h:outputText value="#{respostaDoAluno2Bean.descricaoIntervencao14}"></h:outputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencao14}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />	
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencao14}"></h:inputTextarea>
			</h:panelGrid>
			
		<h:panelGrid columns="3" columnClasses="columnsCasoClinico1, column2" rowClasses="rowCasoClinicoP">			
			<h:outputText value="#{bundle.outros}" styleClass="headerGridQueixasMed"></h:outputText>
			<h:outputText value=""></h:outputText>
			<h:outputText value=""></h:outputText>
						
			<h:inputText value="#{respostaDoAluno2Bean.descricaoIntervencaoOutro1}" style="width: 220px;" styleClass="field_text"></h:inputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencaoOutro1}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />	
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencaoOutro1}"></h:inputTextarea>
						
			<h:inputText value="#{respostaDoAluno2Bean.descricaoIntervencaoOutro2}" style="width: 220px;" styleClass="field_text"></h:inputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencaoOutro2}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />	
			</h:selectOneMenu>	
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencaoOutro2}"></h:inputTextarea>	
			
			<h:inputText value="#{respostaDoAluno2Bean.descricaoIntervencaoOutro3}" style="width: 220px;" styleClass="field_text"></h:inputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencaoOutro3}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />	
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencaoOutro3}"></h:inputTextarea>
			
			<h:inputText value="#{respostaDoAluno2Bean.descricaoIntervencaoOutro4}" style="width: 220px;" styleClass="field_text"></h:inputText>
			<h:selectOneMenu value="#{respostaDoAluno2Bean.indicacaoIntervencaoOutro4}">
				<f:selectItems value="#{respostaDoAluno2Bean.indicacaoItens}" />	
			</h:selectOneMenu>
			<h:inputTextarea value="#{respostaDoAluno2Bean.justificativaIntervencaoOutro4}"></h:inputTextarea>
		</h:panelGrid>
		</h:panelGroup>
		</fieldset>
		
		<br><br>
		<h:commandButton value="Ok" action="#{respostaDoAluno2Bean.teste}"></h:commandButton>
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