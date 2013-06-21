<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.MedicamentosAnterioresModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.detalhes %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.detalhes %></h2>

<fieldset>
    <legend>MedicamentosAnterioresE</legend>

    <div class="display-label">Indicacao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Indicacao) %>
    </div>

    <div class="display-label">Resposta</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Resposta) %>
    </div>

    <div class="display-label">Periodo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Periodo) %>
    </div>
</fieldset>
<p>
     <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
</p>

</asp:Content>
