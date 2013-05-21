<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.RespostaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Resposta
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Resposta</h2>

<fieldset>
    <legend>Detahes da Resposta</legend>

    <div class="display-label">Resposta</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Resposta) %>
    </div>

    <div class="display-label">Pergunta</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Pergunta) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdResposta }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
