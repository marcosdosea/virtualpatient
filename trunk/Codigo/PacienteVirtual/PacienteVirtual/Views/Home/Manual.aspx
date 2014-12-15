<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.manual_paciente_virtual %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Manual do Paciente Virtual para o Aluno</h2>
    <ul style="list-style-type: circle">
        <li><a href="../../Content/Manuais/Manual Paciente Virtual para Aluno - Cadastro no Sistema.html"
            target="_blank" title="Cadastro no Sistema">Como realizar um cadastro no sistema?</a></li>
        <li><a href="../../Content/Manuais/Manual Paciente Virtual para Aluno - Solicitação de Matrícula em Turma.html"
            target="_blank" title="Solicitação de Matrícula em Turma">Como fazer uma solicitação de matrícula em turma</a></li>
        <li><a href="../../Content/Manuais/Manual Paciente Virtual para Aluno - Preencher Consulta.html"
            target="_blank" title="Preencher Consulta">Como preencher uma consulta?</a></li>
        <li><a href="../../Content/Manuais/Manual Paciente Virtual para Aluno - Enviar Consulta para Correção.html"
            target="_blank" title="Enviar Consulta para Correção">Como enviar consulta para correção?</a></li>
        <!--li><a href="../../Content/Manuais/Manual Paciente Virtual para Aluno - Processo de Negócio.html"
            target="_blank" title="Processo de Negócio">Conhecer o Processo de Negócio</a></li-->
        <li><a href="../../Content/Manuais/Manual Paciente Virtual para Aluno - Visualizar Estados da Consulta.html"
            target="_blank" title="Visualizar Estados da Consulta">Como visualizar estados da consulta</a></li>
        <li><a href="../../Content/Manuais/Manual Paciente Virtual para Aluno - Visualizar Comentários do Tutor.html"
            target="_blank" title="Visualizar Comentários do Tutor">Como visualizar comentários do tutor</a></li>
    </ul>
    <h2>
        Manual do Paciente Virtual para o Administrador</h2>
    <ul style="list-style-type: circle">
        <li><a href="../../Content/Manuais/Administrador - Realizar Login.html" target="_blank"
            title="Realizar Login">Como realizar Login com o Perfil de administrador?</a></li>
        <li><a href="../../Content/Manuais/Administrador - Criar Paciente.html" target="_blank"
            title="Criar Paciente">Como criar um paciente?</a></li>
        <li><a href="../../Content/Manuais/Administrador - Criar um Relato.html" target="_blank"
            title="Criar um Relato">Como criar um relato clínico?</a></li>
        <li><a href="../../Content/Manuais/Administrador - Atirbuir Relato.html" target="_blank"
            title="Atirbuir Relato">Como atirbuir um relato clínico para um administrador cadastrar o gabarito?</a></li>
        <li><a href="../../Content/Manuais/Administrador - Preencher Gabarito.html" target="_blank"
            title="Preencher Gabarito">Como preencher o gabarito de uma consulta?</a></li>
        <li><a href="../../Content/Manuais/Administrador - Criar turma.html" target="_blank"
            title="Criar turma">como criar uma turma?</a></li>
        <li><a href="../../Content/Manuais/Administrador - Aprovar solicitação de matricula.html"
            target="_blank" title="Aprovar solicitação de matricula">Como aprovar uma solicitação de matrícula de um aluno na turma?</a></li>
        <li><a href="../../Content/Manuais/Administrador - Ativar tutor na turma.html" target="_blank"
            title="Ativar tutor na turma">Como ativar um tutor na turma?</a></li>
    </ul>
</asp:Content>
