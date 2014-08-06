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
<script language="JavaScript">
	function validaForm(){
		
		//validar peso
   		if (document.getElementById("analiseConsulta3:pesoEvolu").value == ""){
			alert(document.getElementById("analiseConsulta3:alertPeso").value);
			document.getElementById("analiseConsulta3:pesoEvolu").focus();
			return false;
		}
		//validar se o peso possui apenas números
		if(isNaN(document.getElementById("analiseConsulta3:pesoEvolu").value)){
			alert(document.getElementById("analiseConsulta3:alertPesoNumero").value);
			document.getElementById("analiseConsulta3:pesoEvolu").focus();
			return false;
		}			
   		//validar imc
   		if (document.getElementById("analiseConsulta3:imcEvolu").value == ""){
			alert(document.getElementById("analiseConsulta3:alertImc").value);
			document.getElementById("analiseConsulta3:imcEvolu").focus();
			return false;
		}
   		//validar se o imc possui apenas números
		if(isNaN(document.getElementById("analiseConsulta3:imcEvolu").value)){
			alert(document.getElementById("analiseConsulta3:alertImcNumero").value);
			document.getElementById("analiseConsulta3:imcEvolu").focus();
			return false;
		}
   		//validar pressao sistólica
   		if (document.getElementById("analiseConsulta3:pressaoSistEvolu").value == ""){
			alert(document.getElementById("analiseConsulta3:alertPressaoSist").value);
			document.getElementById("analiseConsulta3:pressaoSistEvolu").focus();
			return false;
		}
   		//validar se a pressao sistólica possui apenas números
		if(isNaN(document.getElementById("analiseConsulta3:pressaoSistEvolu").value)){
			alert(document.getElementById("analiseConsulta3:alertPressaoSistNumero").value);
			document.getElementById("analiseConsulta3:pressaoSistEvolu").focus();
			return false;
		}
   		//validar pressao diastólica
   		if (document.getElementById("analiseConsulta3:pressaoDiastEvolu").value == ""){
			alert(document.getElementById("analiseConsulta3:alertPressaoDiast").value);
			document.getElementById("analiseConsulta3:pressaoDiastEvolu").focus();
			return false;
		}
   		//validar se a pressao diastólica possui apenas números
		if(isNaN(document.getElementById("analiseConsulta3:pressaoDiastEvolu").value)){
			alert(document.getElementById("analiseConsulta3:alertPressaoDiastNumero").value);
			document.getElementById("analiseConsulta3:pressaoDiastEvolu").focus();
			return false;
		}
   		//validar temperatura
   		if (document.getElementById("analiseConsulta3:temperaturaEvolu").value == ""){
			alert(document.getElementById("analiseConsulta3:alertTemperatura").value);
			document.getElementById("analiseConsulta3:temperaturaEvolu").focus();
			return false;
		}
   		//validar se a temperatura possui apenas números
		if(isNaN(document.getElementById("analiseConsulta3:temperaturaEvolu").value)){
			alert(document.getElementById("analiseConsulta3:alertTemperaturaNumero").value);
			document.getElementById("analiseConsulta3:temperaturaEvolu").focus();
			return false;
		}

		return true;
	}
</script>
</head>
<body>
<f:loadBundle basename="LocalizationResources" var="bundle"/>
<f:view>
<h:form id="analiseConsulta3" onsubmit="return validaForm()">	
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
			<h:graphicImage value="#{respostaDoAluno3Bean.respostaPrimeira.consulta.fkCasoClinico.fotoFileName}"></h:graphicImage>
			<br>
			<h:outputText value="#{bundle.casoInicial} " style="font-weight: bold;" ></h:outputText>
			<h:outputText value="#{respostaDoAluno3Bean.respostaPrimeira.consulta.fkCasoClinico.relatoDeCasoPrimeiraConsulta}"/>
			<br><br>
			<h:outputText value="#{bundle.casoEvolucao} " style="font-weight: bold;" ></h:outputText>
			<h:outputText value="#{respostaDoAluno3Bean.respostaPrimeira.consulta.fkCasoClinico.relatoDeCasoSegundaConsulta}"/>
			<br><br>
			<h:outputText value="#{bundle.casoEvolucao3} " style="font-weight: bold;" ></h:outputText>		
			<h:outputText value="#{respostaDoAluno3Bean.respostaPrimeira.consulta.fkCasoClinico.relatoDeCasoTerceiraConsulta}"></h:outputText>
		</h:panelGroup>
	    <h:panelGroup layout="block" id="wraper" styleClass="wraper">					
			<h:panelGroup layout="block" id="mainContent" styleClass="mainContent">
				<br>
				<h2><h:outputText  value="#{bundle.analisarCasoTerceiraConsulta}"></h:outputText></h2>
				<br>
				<br>
				<h:outputText  value="#{bundle.tentativaNumero}"></h:outputText>
				<h:outputText value=" #{respostaDoAluno3Bean.alunoLogado.nrTentativa}"></h:outputText>
				<br>			
				
				<br>											
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
				<legend><h:outputText  value="#{bundle.examesFisicosEvolu}"></h:outputText>	</legend> 
				<h:panelGroup id="medEvolu" layout="block" styleClass="field">	
				<h:panelGrid border="0" columns="2">
					<h:outputText value="#{bundle.peso}"></h:outputText>
					<h:panelGroup>
						<h:inputText id="pesoEvolu" value="#{respostaDoAluno3Bean.peso2String}" style="width: 44px"></h:inputText>
						<h:outputText value=" #{bundle.unidadePeso}"></h:outputText>
					</h:panelGroup>
					<h:outputText value="#{bundle.altura}"></h:outputText>
					<h:panelGroup>
						<h:outputText value="#{respostaDoAluno3Bean.respostaPrimeira.consulta.fkCasoClinico.altura}" style="width: 44px"></h:outputText>
						<h:outputText value=" #{bundle.unidadeAltura}"></h:outputText>
					</h:panelGroup>
					<h:outputText value="#{bundle.imc}"></h:outputText>
					<h:panelGroup>						
						<h:inputText id="imcEvolu" value="#{respostaDoAluno3Bean.imc2String}" style="width: 44px"></h:inputText>
						<h:outputText value=" #{bundle.unidadeIMC}"></h:outputText>
					</h:panelGroup>					
					<h:outputText value="#{bundle.pressaoArt}"></h:outputText>
					<h:panelGroup>
						<h:inputText id="pressaoSistEvolu" style="width: 44px" value="#{respostaDoAluno3Bean.pressaoSistolica2String}"></h:inputText>
						X
						<h:inputText id="pressaoDiastEvolu" style="width: 44px" value="#{respostaDoAluno3Bean.pressaoDiastolica2String}"></h:inputText>
					</h:panelGroup>
					<h:outputText value="#{bundle.temperatura}"></h:outputText>
					<h:panelGroup>
						<h:inputText id="temperaturaEvolu" value="#{respostaDoAluno3Bean.temperatura2String}" style="width: 44px"></h:inputText>
						<h:outputText value=" #{bundle.unidadeGlicemia}"></h:outputText>
					</h:panelGroup>
					<h:outputText value="#{bundle.alergias}"></h:outputText>
					<h:outputText value="#{respostaDoAluno3Bean.respostaPrimeira.consulta.fkCasoClinico.alergias}"></h:outputText>			
				</h:panelGrid>	
				</h:panelGroup>	
			</fieldset>	
			<br>
			
			<fieldset>
			<legend><h:outputText value="#{bundle.queixas}"></h:outputText></legend>
			<h:panelGroup layout="block" id="queixasEvolu" styleClass="field">
			<h:dataTable value="#{respostaDoAluno3Bean.listaAux}" var="currentQueixaResposta" >
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
			<br>
			<h:panelGrid border="1" columns="2" id="legenda" styleClass="tableRight, tableMenorAnaliseSegundaConsulta" headerClass="headerDataTable" rowClasses="odd, even">
				<f:facet name="header">
					<h:outputText value="#{bundle.legenda}"></h:outputText>
				</f:facet>
				<h:outputText value="#{bundle.prm}"></h:outputText>
				<h:outputText value="#{bundle.proRelMedicamento}"></h:outputText>
			</h:panelGrid>
			</fieldset>			
			<br>
			
			<fieldset>
			<legend><h:outputText value="#{bundle.proxEncontro}"></h:outputText></legend>
			<h:panelGroup layout="block" id="proxEncontro" styleClass="field">
			<h:inputTextarea value="#{respostaDoAluno3Bean.proxEncontro}" style="height: 140px;"
							styleClass="field_text">
			</h:inputTextarea>
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
						<h:selectOneMenu value="#{respostaDoAluno3Bean.diarioMedPeriodo}">
							<f:selectItems value="#{respostaDoAluno3Bean.periodoItens}"/>
						</h:selectOneMenu>						
						<h:outputText value="#{bundle.horario}:"></h:outputText>
						<h:inputText value="#{respostaDoAluno3Bean.diarioMedHorario}"></h:inputText>
						
						<h:outputText value="#{bundle.quantidade}:"></h:outputText>
						<h:inputText value="#{respostaDoAluno3Bean.diarioMedQuantidade}"></h:inputText>
						
						<h:outputText value="#{bundle.medicamento}:"></h:outputText>
						<h:selectOneMenu value="#{respostaDoAluno3Bean.diarioMedDesc}" style="width: 95%;">
							<f:selectItems value="#{opcoesBean.listaMedicamentos}" />
						</h:selectOneMenu>
						
						<h:outputText value="#{bundle.tipoBebida}"></h:outputText>
						<h:selectOneMenu value="#{respostaDoAluno3Bean.diarioMedBebida}">
							<f:selectItems value="#{respostaDoAluno3Bean.tipoBebidaItens}"/>
						</h:selectOneMenu>										
					</h:panelGrid>
					<h:commandButton value="#{bundle.bntAdicionar}" action="#{respostaDoAluno3Bean.addDiarioMedicamento}"></h:commandButton>
				</h:panelGroup>
				<h:dataTable title="teste" styleClass="dataTables"
					rendered="#{not empty respostaDoAluno3Bean.listaDiarioMed}"
					border="1" value="#{respostaDoAluno3Bean.listaDiarioMed}"
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
							actionListener="#{respostaDoAluno3Bean.removeDiarioMed}">
							<h:outputText value="#{bundle.remover}" />
							<f:param id="removeDiarioMed" name="obj" value="#{currentParametro}" />
						</h:commandLink>
					</h:column>
				</h:dataTable>	
			</h:panelGrid>
			</h:panelGroup>
			</fieldset>			
			<br>
			
			<h:commandButton value="OK" action="#{respostaDoAluno3Bean.addRespostaTerceira}"></h:commandButton>
			
			<h:inputText id="alertPeso" style="display:none" value="#{bundle.alertPeso}"></</h:inputText>
			<h:inputText id="alertPressaoSist" style="display:none" value="#{bundle.alertPressaoSist}"></</h:inputText>
			<h:inputText id="alertPressaoDiast" style="display:none" value="#{bundle.alertPressaoDiast}"></</h:inputText>
			<h:inputText id="alertTemperatura" style="display:none" value="#{bundle.alertTemperatura}"></</h:inputText>
			<h:inputText id="alertImc" style="display:none" value="#{bundle.alertImc}"></</h:inputText>
			<h:inputText id="alertImcNumero" style="display:none" value="#{bundle.alertImcNumero}"></</h:inputText>
			<h:inputText id="alertPesoNumero" style="display:none" value="#{bundle.alertPesoNumero}"></</h:inputText>
			<h:inputText id="alertPressaoSistNumero" style="display:none" value="#{bundle.alertPressaoSistNumero}"></</h:inputText>
			<h:inputText id="alertPressaoDiastNumero" style="display:none" value="#{bundle.alertPressaoDiastNumero}"></</h:inputText>
			<h:inputText id="alertTemperaturaNumero" style="display:none" value="#{bundle.alertTemperaturaNumero}"></</h:inputText>
			
			</h:panelGroup>
		</h:panelGroup>
		<h:panelGroup layout="block" id="clear" styleClass="clear">	</h:panelGroup>
	</h:panelGroup>
	<h:panelGroup layout="block" id="footer" styleClass="footer">
			<p>dcomp&copy;</p>
	</h:panelGroup>	
</h:panelGroup>
</h:form>
</f:view>
</body>
</html>