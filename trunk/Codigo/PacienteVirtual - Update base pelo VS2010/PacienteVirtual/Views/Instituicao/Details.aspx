<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.InstituicaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Instituição
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Instituição</h2>

<fieldset>
    <legend>Detalhes da Instituição</legend>

    <div class="display-label"><%: Html.LabelFor(model => model.NomeInstituicao) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeInstituicao) %>
    </div>

    <div class="display-label"><%: Html.LabelFor(model => model.Sigla) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Sigla) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Editar", "Edit", new { id=Model.IdInstituicao }) %> |
    <%: Html.ActionLink("Voltar", "Index") %>
</p>

</asp:Content>
