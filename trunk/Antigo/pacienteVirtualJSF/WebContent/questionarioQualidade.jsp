<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%><%@taglib
	uri="http://java.sun.com/jsf/core" prefix="f"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PharmaVP</title>
<link href="${pageContext.request.contextPath}/css/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link rel="StyleSheet" type="text/css" href="${pageContext.request.contextPath}/css/cssCadastro.css"  media="screen" />
</head>
<body>
<f:loadBundle basename="LocalizationResources" var="bundle"/>
<f:view>
<h:form>
<h:panelGroup layout="block" id="tudo" styleClass="tudo">
	<h:panelGroup layout="block" id="conteudo" styleClass="conteudo">
		<h:panelGroup layout="block" id="header" styleClass="header">
		    <h:panelGroup>	
		    <h:commandLink action="#{usuarioBean.retornarMenu}" style="color: white; padding-right:10px;">
				<h:graphicImage value="/css/header.PNG" style="border: 0" alt="PharmaVP"></h:graphicImage>		
			</h:commandLink>
			</h:panelGroup>
			<h:panelGroup layout="block" style="text-align: right;">
				<h:commandLink action="#{usuarioBean.sair}" style="color: white; padding-right:10px;">
					<h:outputText value="#{bundle.sair}"></h:outputText>
			    </h:commandLink>	
		    </h:panelGroup>		
		</h:panelGroup>
		<h:panelGroup layout="block" id="wraper" styleClass="wraper">
			<h:panelGroup layout="block" id="mainContent" styleClass="mainContent">
				
				<br><h2><h:outputText value="#{bundle.tituloQualidade}"></h:outputText></h2><br><br>
				<h:panelGroup layout="block" styleClass="field">
					<h:outputText value="#{bundle.funcionalidade}" style="font-weight: bold; text-decoration: underline;"></h:outputText>
					<br><br>			
					<h:outputText value="#{bundle.questao1}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao1}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa1}"></h:inputTextarea>
					
					<br><br>
					<h:outputText value="#{bundle.questao2}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao2}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa2}"></h:inputTextarea>
					
					<br><br>
					<h:outputText value="#{bundle.usabilidade}" style="font-weight: bold; text-decoration: underline;"></h:outputText>
					<br><br>			
					<h:outputText value="#{bundle.questao3}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao3}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa3}"></h:inputTextarea>
					
					<br><br>
					<h:outputText value="#{bundle.questao4}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao4}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa4}"></h:inputTextarea>								
					
					<br><br>
					<h:outputText value="#{bundle.questao5}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao5}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa5}"></h:inputTextarea>
									
					<br><br>
					<h:outputText value="#{bundle.questao6}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao6}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa6}"></h:inputTextarea>
									
					<br><br>
					<h:outputText value="#{bundle.questao7}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao7}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa7}"></h:inputTextarea>
								
					<br><br>
					<h:outputText value="#{bundle.questao8}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao8}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa8}"></h:inputTextarea>
									
									
					<br><br>
					<h:outputText value="#{bundle.questao9}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao9}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo1}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.justificativa}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa9}"></h:inputTextarea>
									
					<br><br>
					<h:outputText value="#{bundle.visibilidadeStatusSistema}" style="font-weight: bold; text-decoration: underline;"></h:outputText>
					<br><br>			
					<h:outputText value="#{bundle.questao10}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao10}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo2}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.problema}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa10}"></h:inputTextarea>
									
					<br><br>
					<h:outputText value="#{bundle.compatibilidadeSistemaReal}" style="font-weight: bold; text-decoration: underline;"></h:outputText>
					<br><br>			
					<h:outputText value="#{bundle.questao11}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao11}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo2}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.problema}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa11}"></h:inputTextarea>
									
					<br><br>			
					<h:outputText value="#{bundle.questao12}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao12}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo2}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.problema}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa12}"></h:inputTextarea>
									
					<br><br>
					<h:outputText value="#{bundle.liberdadeControleUsuario}" style="font-weight: bold; text-decoration: underline;"></h:outputText>
					<br><br>			
					<h:outputText value="#{bundle.questao13}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao13}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo2}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.problema}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa13}"></h:inputTextarea>
									
									
					<br><br>
					<h:outputText value="#{bundle.consistenciaPadroes}" style="font-weight: bold; text-decoration: underline;"></h:outputText>
					<br><br>			
					<h:outputText value="#{bundle.questao38}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao38}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo2}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.problema}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa38}"></h:inputTextarea>		
													
					<br><br>
					<h:outputText value="#{bundle.prevencaoContraErros}" style="font-weight: bold; text-decoration: underline;"></h:outputText>
					<br><br>			
					<h:outputText value="#{bundle.questao14}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao14}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo2}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.problema}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa14}"></h:inputTextarea>		
									
					<br><br>
					<h:outputText value="#{bundle.reconhecimentoLembranca}" style="font-weight: bold; text-decoration: underline;"></h:outputText>
					<br><br>			
					<h:outputText value="#{bundle.questao15}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao15}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo2}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.problema}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa15}"></h:inputTextarea>		
																	
					<br><br>
					<h:outputText value="#{bundle.flexibilidadeEficiencia}" style="font-weight: bold; text-decoration: underline;"></h:outputText>
					<br><br>			
					<h:outputText value="#{bundle.questao16}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao16}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo2}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.problema}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa16}"></h:inputTextarea>
					
					<br><br>
					<h:outputText value="#{bundle.projetoMinimalistaEstetico}" style="font-weight: bold; text-decoration: underline;"></h:outputText>
					<br><br>			
					<h:outputText value="#{bundle.questao17}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao17}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo2}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.problema}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa17}"></h:inputTextarea>
									
									
					<br><br>
					<h:outputText value="#{bundle.auxiliarUsuariosErros}" style="font-weight: bold; text-decoration: underline;"></h:outputText>
					<br><br>			
					<h:outputText value="#{bundle.questao18}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao18}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo2}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.problema}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa18}"></h:inputTextarea>
					
					<br><br>
					<h:outputText value="#{bundle.ajudaDocumentacao}" style="font-weight: bold; text-decoration: underline;"></h:outputText>
					<br><br>			
					<h:outputText value="#{bundle.questao19}" style="font-weight: bold; width: 90%;"></h:outputText>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:selectOneMenu value="#{respostaQuestionarioBean.opcao19}">
						<f:selectItems value="#{respostaQuestionarioBean.listaOpcoesTipo2}" />
					</h:selectOneMenu>
					<br><br>
					&nbsp;&nbsp;&nbsp;<h:outputText value="#{bundle.problema}" style="font-weight: bold;"></h:outputText>
					<br>
					&nbsp;&nbsp;&nbsp;<h:inputTextarea style="height: 100px" styleClass="field_text"
									value="#{respostaQuestionarioBean.justificativa19}"></h:inputTextarea>
									
									
					<br><br>
					
					<h:commandButton action="#{respostaQuestionarioBean.salvarQualidade}" value="#{bundle.salvar}"></h:commandButton>
					
				</h:panelGroup>
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
</f:view></body>
</html>