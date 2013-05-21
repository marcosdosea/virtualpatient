<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.CursoModel>" %>
<%@ Import Namespace="System.Web.Mvc.Html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Curso
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Curso</h2>

<fieldset>
    <legend>Detalhes do Curso</legend>

    <div class="display-label"><%: Html.LabelFor(model => model.NomeCurso) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeCurso) %>
    </div>

    <div class="display-label"><%: Html.LabelFor(model => model.NomeInstituicao) %></div>
    <div class="display-field">
         <%: Html.DisplayFor(model => model.NomeInstituicao) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdCurso }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
