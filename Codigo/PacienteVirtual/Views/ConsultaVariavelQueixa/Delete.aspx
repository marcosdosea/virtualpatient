<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ConsultaVariavelQueixaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>ConsultaVariavelQueixaE</legend>

    <div class="display-label">tb_acao_queixa</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DescricaoAcao) %>
    </div>

    <div class="display-label">Motivo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Motivo) %>
    </div>

    <div class="display-label">Desde</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Desde) %>
    </div>

    <div class="display-label">Prioridade</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Prioridade) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
