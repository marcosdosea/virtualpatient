<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.EscolaridadeModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Escolaridade
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Escolaridade</h2>

<fieldset>
    <legend>Detalhes da Escolaridade</legend>

    <div class="display-label">Nivel</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Nivel) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdEscolaridade }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
