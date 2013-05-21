<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.EscolaridadeModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Escolaridade
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Escolaridade</h2>

<h3>Você tem certeza que deseja excluir esta escolaridade?</h3>
<fieldset>
    <legend>Remover Escolaridade</legend>

    <div class="display-label">Nivel</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Nivel) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
