<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.PerguntaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Pergunta
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Pergunta</h2>

<h3>Você tem certeza que deseja excluir esta pergunta?</h3>
<fieldset>
    <legend>Remover Pergunta</legend>

    <div class="display-label">Pergunta</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Pergunta) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
