<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DisciplinaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Disciplina
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Disciplina</h2>

<fieldset>
    <legend>Detalhes da Disciplina</legend>

    <div class="display-label"> <%: Html.LabelFor(model => model.NomeDisciplina) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeDisciplina) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdDisciplina }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
