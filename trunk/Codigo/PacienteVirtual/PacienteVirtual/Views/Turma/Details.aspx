<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.TurmaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Turma
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Turma</h2>

<fieldset>
    <legend>Detalhes da Turma</legend>

    <div class="display-label">  <%: Html.LabelFor(model => model.Codigo) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Codigo) %>
    </div>

    <div class="display-label">  <%: Html.LabelFor(model => model.Periodo) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Periodo) %>
    </div>

    <div class="display-label">  <%: Html.LabelFor(model => model.NomeDisciplina) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeDisciplina) %>
    </div>

    <div class="display-label">  <%: Html.LabelFor(model => model.NomeInstituicao) %> </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeInstituicao) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Editar", "Edit", new { id=Model.IdTurma }) %> |
    <%: Html.ActionLink("Voltar", "Index") %>
</p>

</asp:Content>
