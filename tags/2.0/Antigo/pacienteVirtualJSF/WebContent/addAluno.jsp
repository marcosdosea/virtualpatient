<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PharmaVP</title>
<link href="${pageContext.request.contextPath}/css/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link rel="StyleSheet" type="text/css" href="${pageContext.request.contextPath}/css/cssCadastro.css"  media="screen" />
<script language="JavaScript">
	function validaForm(){
		//validar login
		if (document.getElementById("cadastroAluno:login").value == ""){
			alert(document.getElementById("cadastroAluno:alertLogin").value);
			document.getElementById("cadastroAluno:login").focus();
			return false;
		}
		
		//validar senha
		if (document.getElementById("cadastroAluno:senha1").value == ""){
			alert(document.getElementById("cadastroAluno:alertSenha").value);
			document.getElementById("cadastroAluno:senha1").focus();
			return false;
		}
		
		//validar repetição de senha
		if (document.getElementById("cadastroAluno:senha2").value == ""){
			alert(document.getElementById("cadastroAluno:alertSenha2").value);
			document.getElementById("cadastroAluno:senha2").focus();
			return false;
		}
		
		//validar a igualdade de senha
		if (document.getElementById("cadastroAluno:senha1").value != document.getElementById("cadastroAluno:senha2").value){
			alert(document.getElementById("cadastroAluno:alertSenhasDiferentes").value);
			document.getElementById("cadastroAluno:senha2").focus();
			return false;
		}
				
		//validar nome
		if (document.getElementById("cadastroAluno:nome").value == ""){
			alert(document.getElementById("cadastroAluno:alertNome").value);
			document.getElementById("cadastroAluno:nome").focus();
			return false;
		}
		
		//validar matricula
		if (document.getElementById("cadastroAluno:matricula").value == ""){
			alert(document.getElementById("cadastroAluno:alertMatricula").value);
			document.getElementById("cadastroAluno:matricula").focus();
			return false;
		}
		
		//validar e-mail
		if (document.getElementById("cadastroAluno:email").value == ""){
			alert(document.getElementById("cadastroAluno:alertEmail").value);
			document.getElementById("cadastroAluno:email").focus();
			return false;
		}
		
		//validar email(verificação de endereço eletrônico)
		parte1 = document.getElementById("cadastroAluno:email").value.indexOf("@");
		parte2 = document.getElementById("cadastroAluno:email").value.indexOf(".");
		parte3 = document.getElementById("cadastroAluno:email").value.length;
		if (!(parte1 >= 3 && parte2 >= 6 && parte3 >= 9)) {
			alert(document.getElementById("cadastroAluno:alertEmail2").value);
			document.getElementById("cadastroAluno:email").focus();
			return false;
		}
		
		//validar idade
		if (document.getElementById("cadastroAluno:idade").value == ""){
			alert(document.getElementById("cadastroAluno:alertIdade").value);
			document.getElementById("cadastroAluno:idade").focus();
			return false;
		}
		
		
		//validar idade(verificação se contém apenas números)
		if (isNaN(document.getElementById("cadastroAluno:idade").value)){
			alert(document.getElementById("cadastroAluno:alertIdade2").value);
			document.getElementById("cadastroAluno:idade").focus();
			return false;
		}
		
		//validar gênero
		var preencheu = false;
    	var botoes = document.getElementsByName("cadastroAluno:genero");
    	for(var i = 0; i < botoes.length; i++){
     	   if(botoes.item(i).checked)
      	      preencheu = true;
    	}
   		if(!preencheu){
   			alert(document.getElementById("cadastroAluno:alertGenero").value);
       	 return false;
    	}

   		//validar ano que iniciou o curso
		if (document.getElementById("cadastroAluno:anoInitCurso").value == ""){
			alert(document.getElementById("cadastroAluno:alertAnoInitCurso").value);
			document.getElementById("cadastroAluno:anoInitCurso").focus();
			return false;
		}
    	
    	//validar acesso a internet
		//preencheu = false;
    	//botoes = document.getElementsByName("cadastroAluno:acessoInternet");
    	//for(var i = 0; i < botoes.length; i++){
     	//   if(botoes.item(i).checked)
      	//      preencheu = true;
    	//}
   		//if(!preencheu){
        //	alert("Escolha o local de onde acessa a internet!");
       	// return false;
    	//}
    	
    	//validar disciplinas cursadas
		preencheu = false;
    	botoes = document.getElementsByName("cadastroAluno:intFarmacia");
    	for(var i = 0; i < botoes.length; i++){
     	   if(botoes.item(i).checked)
      	      preencheu = true;
    	}
   		if(!preencheu){
   			alert(document.getElementById("cadastroAluno:alertDisciplinas1").value);
       	 return false;
    	}
    	preencheu = false;
    	botoes = document.getElementsByName("cadastroAluno:assFarmaceutica");
    	for(var i = 0; i < botoes.length; i++){
     	   if(botoes.item(i).checked)
      	      preencheu = true;
    	}
   		if(!preencheu){
   			alert(document.getElementById("cadastroAluno:alertDisciplinas2").value);
       	 return false;
    	}
    	preencheu = false;
    	botoes = document.getElementsByName("cadastroAluno:atcFarmaceutica");
    	for(var i = 0; i < botoes.length; i++){
     	   if(botoes.item(i).checked)
      	      preencheu = true;
    	}
   		if(!preencheu){
   			alert(document.getElementById("cadastroAluno:alertDisciplinas3").value);
       	 return false;
    	}
    	preencheu = false;
    	botoes = document.getElementsByName("cadastroAluno:topFarmClinica");
    	for(var i = 0; i < botoes.length; i++){
     	   if(botoes.item(i).checked)
      	      preencheu = true;
    	}
   		if(!preencheu){
   			alert(document.getElementById("cadastroAluno:alertDisciplinas4").value);
       	 return false;
    	}
    	preencheu = false;
    	botoes = document.getElementsByName("cadastroAluno:farmClinica");
    	for(var i = 0; i < botoes.length; i++){
     	   if(botoes.item(i).checked)
      	      preencheu = true;
    	}
   		if(!preencheu){
   			alert(document.getElementById("cadastroAluno:alertDisciplinas5").value);
       	 return false;
    	}
    	preencheu = false;
    	botoes = document.getElementsByName("cadastroAluno:dispFarmaceutica");
    	for(var i = 0; i < botoes.length; i++){
     	   if(botoes.item(i).checked)
      	      preencheu = true;
    	}
   		if(!preencheu){
   			alert(document.getElementById("cadastroAluno:alertDisciplinas6").value);
       	 return false;
    	}
    	preencheu = false;
    	botoes = document.getElementsByName("cadastroAluno:semioFarmaceutica");
    	for(var i = 0; i < botoes.length; i++){
     	   if(botoes.item(i).checked)
      	      preencheu = true;
    	}
   		if(!preencheu){
   			alert(document.getElementById("cadastroAluno:alertDisciplinas7").value);
       	 return false;
    	}

		
		return true;
	}
</script> 
</head>
<body>
<f:loadBundle basename="LocalizationResources" var="bundle"/>
<f:view>
<h:form id="cadastroAluno" onsubmit="return validaForm()">
<h:panelGroup layout="block" id="tudo" styleClass="tudo">
	<h:panelGroup layout="block" id="conteudo" styleClass="conteudo">
		<h:panelGroup layout="block" id="header" styleClass="header">
			<a href="index.jsp"><h:graphicImage value="/css/header.PNG" style="border: 0" alt="PharmaVP"></h:graphicImage></a>
		</h:panelGroup>
		<h:panelGroup layout="block" id="wraper" styleClass="wraper">
			<h:panelGroup layout="block" id="mainContent" styleClass="mainContent">
				
									
						<br><h2><h:outputText value="#{bundle.tituloAddAluno}"></h:outputText></h2><br><br>
						<fieldset>
						<legend><h:outputText value="#{bundle.dadosSocioEdu}"></h:outputText></legend>
						<h:panelGroup id="dados" layout="block" styleClass="field">
							<h:outputText value="#{bundle.login}"></h:outputText><br>
							<h:inputText id="login" value="#{alunoBean.login}" required="true" styleClass="field_text"></h:inputText><br>
							<h:outputText value="#{bundle.password}"></h:outputText><br>
							<h:inputSecret id="senha1" value="#{alunoBean.senha}" required="true" styleClass="field_text"></h:inputSecret><br>
							<h:outputText value="#{bundle.senhaDois}"></h:outputText><br>
							<h:inputSecret id="senha2" value="#{alunoBean.senhaTeste}" required="true" styleClass="field_text"></h:inputSecret><br>
							<h:outputText value="#{bundle.nome}"></h:outputText><br>
							<h:inputText id="nome" value="#{alunoBean.nome}" required="true" styleClass="field_text"></h:inputText><br>
							<h:outputText value="#{bundle.matricula}"></h:outputText><br>
							<h:inputText id="matricula" value= "#{alunoBean.matricula}" styleClass="field_text"></h:inputText><br>
							<h:outputText value="#{bundle.email}"></h:outputText><br>
							<h:inputText id="email" value="#{alunoBean.email}" required="true" styleClass="field_text"></h:inputText><br>
							<h:outputText value="#{bundle.idade}"></h:outputText><br>
							<h:inputText id="idade" value="#{alunoBean.idadeString}" required="true" styleClass="field_text"></h:inputText><br>
							<h:outputText value="#{bundle.genero}"></h:outputText><br>
							<h:selectOneRadio id="genero" value="#{alunoBean.genero}" required="true">
								<f:selectItem itemValue="M" id="M" itemLabel="#{bundle.masculino}"/>
								<f:selectItem itemValue="F" id="F" itemLabel="#{bundle.feminino}"/>
							</h:selectOneRadio><br>
							<h:outputText value="#{bundle.anoInitCurso}"></h:outputText><br>
							<h:inputText id="anoInitCurso" value="#{alunoBean.anoInitCurso}" required="true" styleClass="field_text"></h:inputText><br>							
						</h:panelGroup>
						<h:panelGrid border="0" columns="2"  styleClass="field">
							<h:outputText value="#{bundle.acessInternet}"></h:outputText>
							<h:outputText value=""></h:outputText>
							<h:outputText value="#{bundle.acessCasa}"></h:outputText>
							<h:selectBooleanCheckbox value="#{alunoBean.flAcessoCasa}"></h:selectBooleanCheckbox>
							<h:outputText value="#{bundle.acessFaculdade}"></h:outputText>
							<h:selectBooleanCheckbox value="#{alunoBean.flAcessoUniversidade}"></h:selectBooleanCheckbox>
							<h:outputText value="#{bundle.acessAmigo}"></h:outputText>
							<h:selectBooleanCheckbox value="#{alunoBean.flAcessoCasaAmigo}"></h:selectBooleanCheckbox>
							<h:outputText value="#{bundle.acessOutro}"></h:outputText>
							<h:selectBooleanCheckbox value="#{alunoBean.flAcessoOutro}"></h:selectBooleanCheckbox>
						</h:panelGrid>
						</fieldset>
						<br>
						<fieldset>
							<legend><h:outputText value="#{bundle.discCursadas}"></h:outputText></legend>
						<h:panelGrid border="0" columns="2"  styleClass="field">
							<h:outputText value="#{bundle.intFarmacia}"></h:outputText>
							<h:selectOneRadio id="intFarmacia" value="#{alunoBean.intFarmacia}" required="true">
								<f:selectItem itemLabel="#{bundle.sim}" itemValue="T" id="intFarmTrue"/>
								<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="intFarmFalse"/>
							</h:selectOneRadio>
							<h:outputText value="#{bundle.assFarmaceutica}"></h:outputText>
							<h:selectOneRadio id="assFarmaceutica" value="#{alunoBean.assFarmaceutica}" required="true">
								<f:selectItem itemLabel="#{bundle.sim}" itemValue="T" id="assFarmTrue"/>
								<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="assFarmFalse"/>
							</h:selectOneRadio>
							<h:outputText value="#{bundle.atcFarmaceutica}"></h:outputText>
							<h:selectOneRadio id="atcFarmaceutica" value="#{alunoBean.atcFarmaceutica}" required="true">
								<f:selectItem itemLabel="#{bundle.sim}" itemValue="T" id="atcFarmTrue"/>
								<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="atcFarmFalse"/>
							</h:selectOneRadio>
							<h:outputText value="#{bundle.topFarmClinica}"></h:outputText>
							<h:selectOneRadio id="topFarmClinica" value="#{alunoBean.topFarmClinica}" required="true">
								<f:selectItem itemLabel="#{bundle.sim}" itemValue="T" id="topFarmCliTrue"/>
								<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="topFarmCliFalse"/>
							</h:selectOneRadio>
							<h:outputText value="#{bundle.farmClinica}"></h:outputText>
							<h:selectOneRadio id="farmClinica" value="#{alunoBean.farmClinica}" required="true">
								<f:selectItem itemLabel="#{bundle.sim}" itemValue="T" id="FarmCliTrue"/>
								<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="FarmCliFalse"/>
							</h:selectOneRadio>
							<h:outputText value="#{bundle.dispFarmaceutica}"></h:outputText>
							<h:selectOneRadio id="dispFarmaceutica" value="#{alunoBean.dispFarmaceutica}" required="true">
								<f:selectItem itemLabel="#{bundle.sim}" itemValue="T" id="dispFarmTrue"/>
								<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="dispFarmFalse"/>
							</h:selectOneRadio>
							<h:outputText value="#{bundle.semioFarmaceutica}"></h:outputText>
							<h:selectOneRadio id="semioFarmaceutica" value="#{alunoBean.semioFarmaceutica}" required="true">
								<f:selectItem itemLabel="#{bundle.sim}" itemValue="T" id="semioFarmTrue"/>
								<f:selectItem itemLabel="#{bundle.nao}" itemValue="F" id="semioFarmFalse"/>
							</h:selectOneRadio>
						</h:panelGrid>
						</fieldset>
						<br><br>
						<h:commandButton action="#{alunoBean.add}" value="#{bundle.bntCadastrar}"></h:commandButton>
				
								
					<h:inputText id="alertLogin" style="display:none" value="#{bundle.alertLogin}"></</h:inputText>
					<h:inputText id="alertSenha" style="display:none" value="#{bundle.alertSenha}"></</h:inputText>	
					<h:inputText id="alertSenha2" style="display:none" value="#{bundle.alertSenha2}"></</h:inputText>
					<h:inputText id="alertSenhasDiferentes" style="display:none" value="#{bundle.alertSenhasDiferentes}"></</h:inputText>
					<h:inputText id="alertNome" style="display:none" value="#{bundle.alertNome}"></</h:inputText>
					<h:inputText id="alertMatricula" style="display:none" value="#{bundle.alertMatricula}"></</h:inputText>
					<h:inputText id="alertEmail" style="display:none" value="#{bundle.alertEmail}"></</h:inputText>
					<h:inputText id="alertEmail2" style="display:none" value="#{bundle.alertEmail2}"></</h:inputText>
					<h:inputText id="alertIdade" style="display:none" value="#{bundle.alertIdade}"></</h:inputText>
					<h:inputText id="alertIdade2" style="display:none" value="#{bundle.alertIdade2}"></</h:inputText>
					<h:inputText id="alertGenero" style="display:none" value="#{bundle.alertGenero}"></</h:inputText>
					<h:inputText id="alertAnoInitCurso" style="display:none" value="#{bundle.alertAnoInitCurso}"></</h:inputText>										
					<h:inputText id="alertDisciplinas1" style="display:none" value="#{bundle.alertDisciplinas1}"></</h:inputText>
					<h:inputText id="alertDisciplinas2" style="display:none" value="#{bundle.alertDisciplinas2}"></</h:inputText>
					<h:inputText id="alertDisciplinas3" style="display:none" value="#{bundle.alertDisciplinas3}"></</h:inputText>
					<h:inputText id="alertDisciplinas4" style="display:none" value="#{bundle.alertDisciplinas4}"></</h:inputText>
					<h:inputText id="alertDisciplinas5" style="display:none" value="#{bundle.alertDisciplinas5}"></</h:inputText>
					<h:inputText id="alertDisciplinas6" style="display:none" value="#{bundle.alertDisciplinas6}"></</h:inputText>
					<h:inputText id="alertDisciplinas7" style="display:none" value="#{bundle.alertDisciplinas7}"></</h:inputText>
											
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