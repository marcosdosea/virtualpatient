<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Caso Clinico</title>
</head>
<body>

<f:view>
	<h:form>
		<b><big>Cadastro de Caso Clinico:</big></b><br>
		<br><br>
		
		<b>Relato de caso inicial:</b><br><br>
		<h:inputTextarea style="height: 177px; width: 668px" value="#{casoClinicoBean.relatoDeCasoPrimeiraConsulta}"></h:inputTextarea>
		
		<b><br><br>Relato de caso com evolução:</b><br><br>
		<h:inputTextarea style="height: 177px; width: 668px" value="#{casoClinicoBean.relatoDeCasoTerceiraConsulta}"></h:inputTextarea>

		<br><br><b>Dados demográficos e antropométricos:</b><br><br>

		<h:panelGrid border="0" columns="2">
			<h:outputText value="Nome:"></h:outputText>
			<h:inputText value="#{casoClinicoBean.nome}"></h:inputText>
			<h:outputText value="Gênero:"></h:outputText>
			<h:selectOneRadio id="genero" value="#{casoClinicoBean.genero}">
				<f:selectItem itemValue="M" id="M" itemLabel="Masculino"/>
				<f:selectItem itemValue="F" id="F" itemLabel="Feminino"/>
			</h:selectOneRadio>
			<h:outputText value="Data de nascimento:"></h:outputText>
			<h:panelGrid border="0" columns="3" style="width: 139px">
				<h:inputText style="width: 143px" value="#{casoClinicoBean.dataNascimentoAuxiliar}" ></h:inputText>
				<h:outputText value="(dd/mm/aaaa)"></h:outputText>
			</h:panelGrid>
			<h:outputText value="Médicos que atendem:"></h:outputText>

			<h:inputText value="#{casoClinicoBean.medicosQueAtendem}"></h:inputText>
			
			<h:outputText value="Ocupação:"></h:outputText>
			<h:inputText value="#{casoClinicoBean.ocupacao}"></h:inputText>
			<h:outputText value="Escolaridade:"></h:outputText>
			<h:selectOneMenu id="anoInitCurso" value="#{casoClinicoBean.escolaridade}">
				<f:selectItem itemLabel="Ensino Fundamental" itemValue="fundamental" id="fundamental"/>
				<f:selectItem itemLabel="Ensino Medio" itemValue="medio" id="medio"/>
				<f:selectItem itemLabel="Ensino Superior" itemValue="superior" id="superior"/>
			</h:selectOneMenu>
			<h:outputText value="Moradia/Família:"></h:outputText>
			<h:inputText value="#{casoClinicoBean.moradiaFamilia}"></h:inputText>
			
			<h:outputText value="Fuma?"></h:outputText>
			<h:selectOneRadio id="flFuma" value="#{casoClinicoBean.flFuma}">
				<f:selectItem itemLabel="Sim" itemValue="V" id="flFumaTrue"/>
				<f:selectItem itemLabel="Não" itemValue="F" id="flFumaFalse"/>
			</h:selectOneRadio>
			<h:outputText value="Bebe Cafe?"></h:outputText>
			<h:selectOneRadio id="flBebeCafe" value="#{casoClinicoBean.flBebeCafe}">
				<f:selectItem itemLabel="Sim" itemValue="V" id="flBebeCafeTrue"/>
				<f:selectItem itemLabel="Não" itemValue="F" id="flBebeCafeFalse"/>
			</h:selectOneRadio>
			<h:outputText value="Bebe Alcool?"></h:outputText>
			<h:selectOneRadio id="flBebeAlcool" value="#{casoClinicoBean.flBebeAlcool}">
				<f:selectItem itemLabel="Sim" itemValue="V" id="flBebeAlcoolTrue"/>
				<f:selectItem itemLabel="Não" itemValue="F" id="flBebeAlcoolFalse"/>
			</h:selectOneRadio>
		</h:panelGrid>
		<h:panelGrid border="0" columns="2">
			<h:outputText value="Plano de Saúde e onde adquire seus medicamentos:"></h:outputText>
			<h:inputText value="#{casoClinicoBean.planoDeSaude}"></h:inputText>
			
		</h:panelGrid>
		
		<br><b>Exames físicos:</b><br><br>
		<h:panelGrid border="0" columns="2">
			<h:outputText value="Peso:"></h:outputText>
			<h:inputText value="#{casoClinicoBean.peso}"></h:inputText>
			<h:outputText value="Altura:"></h:outputText>
			<h:inputText value="#{casoClinicoBean.altura}"></h:inputText>
			<h:outputText value="Pressão arterial:"></h:outputText>
			<h:panelGrid border="0" columns="2">
				<h:inputText style="width: 44px" value="#{casoClinicoBean.pressaoSistolica}"></h:inputText>
				<h:inputText style="width: 44px" value="#{casoClinicoBean.pressaoDiastolica}"></h:inputText>
			</h:panelGrid>
			
			
			<h:outputText value="Temperatura:"></h:outputText>
			<h:inputText value="#{casoClinicoBean.temperatura}"></h:inputText>
			<h:outputText value="Alergias:"></h:outputText>
			<h:inputText value="#{casoClinicoBean.alergias}"></h:inputText>			
		</h:panelGrid>
		
		
		<br><b>Medicamentos não prescritos:</b><br><br>

		<h:panelGrid border="1" columns="2">
		<h:panelGroup>		
		<h:panelGrid border="1" columns="2">		
		
			<h:outputText value="Descrição:"></h:outputText>
			<h:inputText value="#{casoClinicoBean.NPDescricao}"></h:inputText>
			<h:outputText value="Dosagem:"></h:outputText>
			<h:inputText value="#{casoClinicoBean.NPDosagem}"></h:inputText>
			<h:outputText value="Posologia:"></h:outputText>
			<h:inputText value="#{casoClinicoBean.NPPosologia}"></h:inputText>
		</h:panelGrid>
		<h:commandButton value="Adicionar" action="#{casoClinicoBean.addMedicamentoNPre}"></h:commandButton>
		</h:panelGroup>	
		</h:panelGrid>
		
		<br><b>Medicamentos prescritos:</b><br><br>
		<h:panelGrid border="1" columns="2">	
		
		<h:panelGroup>		
		<h:panelGrid border="1" columns="2">		
			<h:outputText value="Descrição:"></h:outputText>
			<h:inputText value="#{casoClinicoBean.PDescricao}"></h:inputText>
			<h:outputText value="Dosagem:"></h:outputText>
			<h:inputText value="#{casoClinicoBean.PDosagem}"></h:inputText>
			<h:outputText value="Posologia:"></h:outputText>
			<h:inputText value="#{casoClinicoBean.PPosologia}"></h:inputText>
			<h:outputText value="Nome do Médico:"></h:outputText>
			<h:inputText value="#{casoClinicoBean.pnmMedico}"></h:inputText>
			<h:outputText value="Especialidade:"></h:outputText>
			<h:inputText value="#{casoClinicoBean.PEspecializacaoMedico}"></h:inputText>
		</h:panelGrid>
		<h:commandButton value="Adicionar" action="#{casoClinicoBean.addMedicamentoPre}"></h:commandButton>
		</h:panelGroup>	
		</h:panelGrid>
			
		<br><b>Parâmetros Clínicos:</b><br><br>
		<h:panelGrid border="1" columns="2">
		
			<h:panelGroup>
			<h:panelGrid border="1" columns="2" style="width: 447px">
				<h:outputText value="Descrição:"></h:outputText>
				<h:inputText value="#{casoClinicoBean.descricao}"></h:inputText>
				<h:outputText value="Valor:"></h:outputText>
				<h:inputText style="width: 83px" value="#{casoClinicoBean.valor}"></h:inputText>
				<h:outputText value="Valor de referência:"></h:outputText>
				<h:inputText style="width: 83px" value="#{casoClinicoBean.valorDeReferencia}"></h:inputText>
				<h:outputText value="Unidade:"></h:outputText>
				<h:inputText style="width: 83px" value="#{casoClinicoBean.unidade}"></h:inputText>				
			</h:panelGrid>
			<h:commandButton id="add" value="Adicionar" action="#{casoClinicoBean.addParam}"></h:commandButton>
			</h:panelGroup>
			</h:panelGrid>
				
		<br><br><h:commandButton action="#{casoClinicoBean.pagina2}" value="Avançar"></h:commandButton>
	</h:form>
</f:view>


</body>
</html>