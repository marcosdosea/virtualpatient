<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.OcupacaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ocupação
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Ocupação</h2>

<h3>Você tem certeza que deseja excluir esta Ocupação?</h3>
<fieldset>
    <legend>Remover Ocupação</legend>

    <div class="display-label">Descricao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Descricao) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
