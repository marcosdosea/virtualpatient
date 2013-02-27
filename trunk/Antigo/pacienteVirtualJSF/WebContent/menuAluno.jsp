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
				

				<h:outputText value="#{bundle.bemvindoAluno}"></h:outputText> 					
				<h:outputText value="#{usuarioBean.nome}"></h:outputText>
				<br><br>
				<h:commandLink action="#{alunoBean.getOcupadoString}" >
					<h:graphicImage value="#{bundle.bntAnalisarCasoClinico}" style="border: 0" alt="#{bundle.altAnalisarCasoClinico}"></h:graphicImage>
				</h:commandLink>
				&nbsp;&nbsp;&nbsp;
				<h:commandLink action="questionario" rendered="#{alunoBean.permiteGabaritoQuarta}">
					<h:graphicImage value="#{bundle.bntResponderQuestionario}" style="border: 0" alt="#{bundle.altResponderQuestionario}"></h:graphicImage>
				</h:commandLink>
				<br><br>
				<br>
				<h:commandLink action="gabaritoPrimeira" rendered="#{alunoBean.permiteGabaritoPrimeira}" >
					<h:graphicImage value="#{bundle.bntGabaritoPrimeira}" style="border: 0" alt="#{bundle.altGabaritoPrimeira}"></h:graphicImage>
				</h:commandLink>
				&nbsp;&nbsp;&nbsp;
				<h:commandLink action="gabaritoSegunda" rendered="#{alunoBean.permiteGabaritoSegunda}" >
					<h:graphicImage value="#{bundle.bntGabaritoSegunda}" style="border: 0" alt="#{bundle.altGabaritoSegunda}"></h:graphicImage>
				</h:commandLink>
				<br><br><br>
				<h:commandLink action="gabaritoTerceira" rendered="#{alunoBean.permiteGabaritoTerceira}" >
					<h:graphicImage value="#{bundle.bntGabaritoTerceira}" style="border: 0" alt="#{bundle.altGabaritoTerceira}"></h:graphicImage>
				</h:commandLink>
				&nbsp;&nbsp;&nbsp;
				<h:commandLink action="gabaritoQuarta" rendered="#{alunoBean.permiteGabaritoQuarta}" >
					<h:graphicImage value="#{bundle.bntGabaritoQuarta}" style="border: 0" alt="#{bundle.altGabaritoQuarta}"></h:graphicImage>
				</h:commandLink>
				
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