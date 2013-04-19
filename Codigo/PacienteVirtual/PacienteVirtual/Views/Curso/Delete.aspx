<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.CursoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Excluir Cursos</h2>

<h3>Confirma exclusão do curso?</h3>
<fieldset>
    <legend>CursoE</legend>

    <div class="display-label"><%: Html.LabelFor(model => model.NomeCurso) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeCurso) %>
    </div>

    <div class="display-label"><%: Html.LabelFor(model => model.NomeInstituicao) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeInstituicao) %> 
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
