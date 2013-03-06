<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.TurmaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Deatalhes da Turma

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Deatalhes da Turma</h2>

<fieldset>
    <legend>Detalhes Turma</legend>

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
<p>

    <%: Html.ActionLink("Edita", "Edit", new { id=Model.Id }) %> |
    <%: Html.ActionLink("Volta", "Index") %>
</p>

</asp:Content>
