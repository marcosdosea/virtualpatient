<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.TurmaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Excluir Turma

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Excluir Turma</h2>

<h3>Você realmente deseja deletar essa turma?</h3>
<fieldset>
    <legend>Turma</legend>

    <div class="display-label">Código</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Codigo) %>
    </div>

    <div class="display-label">Período</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Periodo) %>
    </div>

    <div class="display-label">Tutor</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Tutor) %>
    </div>

    <div class="display-label">Nome da Disciplina</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeDisciplina) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Voltar", "Index") %>
    </p>
<% } %>

</asp:Content>
