<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.TurmaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>turma</legend>

    <div class="display-label">codigo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Codigo) %>
    </div>

    <div class="display-label">periodo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Periodo) %>
    </div>

    <div class="display-label">tutor</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Tutor) %>
    </div>

    <div class="display-label">nmDisciplina</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeDisciplina) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
