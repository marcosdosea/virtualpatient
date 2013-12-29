<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.AreaAtuacaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.detalhes %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.detalhes %></h2>

<fieldset>
    <legend><%: Resources.Mensagem.area_atuacao %></legend>

    <div class="display-label"><%: Resources.Mensagem.area_atuacao %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AreaAtuacao) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink( Resources.Mensagem.editar, "Edit", new { id=Model.IdAreaAtuacao }) %> |
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index")%>
</p>

</asp:Content>
