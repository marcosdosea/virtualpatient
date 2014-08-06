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
			<h:outputText value="#{avaliarConsulta3Bean.fake}"></h:outputText>
			<h:panelGroup layout="block" id="sidebar" styleClass="sidebar">
				<h:graphicImage value="#{avaliarConsulta3Bean.respostaTerceira.consulta.fkCasoClinico.fotoFileName}"></h:graphicImage>
				<br>
				<h:outputText value="#{bundle.casoInicial} " style="font-weight: bold;" ></h:outputText>
				<h:outputText value="#{avaliarConsulta3Bean.respostaTerceira.consulta.fkCasoClinico.relatoDeCasoPrimeiraConsulta}"/>
				<br><br>
				<h:outputText value="#{bundle.casoEvolucao} " style="font-weight: bold;" ></h:outputText>
				<h:outputText value="#{avaliarConsulta3Bean.respostaTerceira.consulta.fkCasoClinico.relatoDeCasoSegundaConsulta}"/>
				<br><br>
				<h:outputText value="#{bundle.casoEvolucao3} " style="font-weight: bold;" ></h:outputText>
				<h:outputText value="#{avaliarConsulta3Bean.respostaTerceira.consulta.fkCasoClinico.relatoDeCasoTerceiraConsulta}"></h:outputText>
			</h:panelGroup>
			<h:panelGroup layout="block" id="wraper" styleClass="wraper">
				
				<h:panelGroup layout="block" id="mainContent" styleClass="mainContent">
				
		<br><h2><h:outputText value="#{bundle.avaliacaoTerceiraConsulta}"></h:outputText></h2>
		<br><br>
		<h:outputText value="#{bundle.dataRealizacao}: "></h:outputText>
		<h:outputText value="#{avaliarConsulta3Bean.respostaTerceira.dataRealizacao}"><f:convertDateTime pattern="dd/MM/yyyy"/></h:outputText>
		<br>
		<br>
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
			<h:outputText value="#{avaliarConsulta3Bean.respostaTerceira.consulta.fkCasoClinico.peso2}"></h:outputText>
			<h:outputText value="#{avaliarConsulta3Bean.respostaTerceira.peso}"></h:outputText>
			
			<h:outputText value="#{bundle.imc}:" style="font-weight: bold"></h:outputText>
			<h:outputText value="#{avaliarConsulta3Bean.imcCorreto}"><f:convertNumber maxFractionDigits="1" /></h:outputText>
			<h:outputText value="#{avaliarConsulta3Bean.respostaTerceira.imc}"><f:convertNumber maxFractionDigits="1" /></h:outputText>
			
			<h:outputText value="#{bundle.pressaoArt}" style="font-weight: bold"></h:outputText>
			<h:panelGrid border="" columns="3">
				<h:outputText value="#{avaliarConsulta3Bean.respostaTerceira.consulta.fkCasoClinico.pressaoSistolica2}"></h:outputText>
				/
				<h:outputText value="#{avaliarConsulta3Bean.respostaTerceira.consulta.fkCasoClinico.pressaoDiastolica2}"></h:outputText>
			</h:panelGrid>
			<h:panelGrid border="" columns="3">
				<h:outputText value="#{avaliarConsulta3Bean.respostaTerceira.pressaosistolica}"></h:outputText>
				/
				<h:outputText value="#{avaliarConsulta3Bean.respostaTerceira.pressaodiastolica}"></h:outputText>
			</h:panelGrid>
			
			<h:outputText value="#{bundle.temperatura}" style="font-weight: bold"></h:outputText>
			<h:outputText value="#{avaliarConsulta3Bean.respostaTerceira.consulta.fkCasoClinico.temperatura2}"><f:convertNumber maxFractionDigits="1" /></h:outputText>
			<h:outputText value="#{avaliarConsulta3Bean.respostaTerceira.temperatura}"><f:convertNumber maxFractionDigits="1" /></h:outputText>			
		</h:panelGrid>
		</h:panelGroup>
		</fieldset>		
		<br>
		<fieldset>
		<legend><h:outputText value="#{bundle.queixas}"></h:outputText></legend> 
		<h:panelGroup id="queixas" layout="block" styleClass="field">					
		<h:panelGrid columns="1">
			<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
			
		<h:dataTable value="#{avaliarConsulta3Bean.listaGabarito}" var="currentQueixaResposta" >
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
		</h:panelGrid>
		<br>
		
		<br>		
		<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>			
		<h:dataTable value="#{avaliarConsulta3Bean.listaAluno}" var="currentQueixaResposta" >
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
		<legend><h:outputText value="#{bundle.proxEncontro}"></h:outputText></legend> 
		<h:panelGroup id="proxEncontro" layout="block" styleClass="field">	
			<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
			<br><br>
			<h:inputTextarea style="height: 140px" readonly="true"
						value="#{avaliarConsulta3Bean.respostaTerceira.consulta.fkCasoClinico.proxEncontro}"
						styleClass="field_text"></h:inputTextarea>	
			<br><br>
			<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
			<br><br>
			<h:inputTextarea style="height: 140px" readonly="true"
						value="#{avaliarConsulta3Bean.respostaTerceira.proxEncontro}"
						styleClass="field_text"></h:inputTextarea>			
		</h:panelGroup>	
		</fieldset>
		<br>	
		
		<fieldset>
		<legend><h:outputText value="#{bundle.diarioPessoalMed}"></h:outputText></legend> 
		<h:panelGroup id="diarioPessoalMed" layout="block" styleClass="field">	
			<h:outputText value="#{bundle.resposta}" style="font-weight: bold"></h:outputText>
			<br><br>
			<h:dataTable value="#{avaliarConsulta3Bean.listaDiarioMedGabarito}"
				rendered="#{not empty avaliarConsulta3Bean.listaDiarioMedGabarito}"
				var="currentParametro" styleClass="dataTables" 
				headerClass="headerDataTable" rowClasses="odd, even">			
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
			<br><br>
		
			<h:outputText value="#{bundle.respostaAluno}" style="font-weight: bold"></h:outputText>
			<br><br>
			<h:dataTable value="#{avaliarConsulta3Bean.listaDiarioMed}"
				rendered="#{not empty avaliarConsulta3Bean.listaDiarioMed}"
				var="currentParametro" styleClass="dataTables" 
				headerClass="headerDataTable" rowClasses="odd, even">			
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
		</h:panelGroup>	
		</fieldset>
		<br>
				
		<fieldset>
		<legend><h:outputText value="#{bundle.avaliacao}"></h:outputText></legend> 
		<h:panelGroup id="avaliacao" layout="block" styleClass="field">			
			<h:outputText value="#{bundle.nota}:"></h:outputText>
			<h:inputText value="#{avaliarConsulta3Bean.nota}"/>
			<br><br>
			<h:outputText value="#{bundle.comentariosAluno}:"></h:outputText>
			<h:inputTextarea style="height: 143px; width: 100%; background-color: AntiqueWhite" value="#{avaliarConsulta3Bean.comentariosAluno}"/><br/><br/>
		</h:panelGroup>
		</fieldset>
		
		<p align="center">
		<h:commandButton action="#{avaliarConsulta3Bean.correto1}" value="#{bundle.correto}"/>
		<h:commandButton action="#{avaliarConsulta3Bean.inCorreto1}" value="#{bundle.refazer}"/></p>
		
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