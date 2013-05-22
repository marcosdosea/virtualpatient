<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.InstituicaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   <%: Resources.Mensagem.detalhes %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.detalhes %></h2>

<fieldset>
    <legend><%: Resources.Mensagem.instituicao %></legend>

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

    <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = Model.IdInstituicao })%> |
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index")%>
</p>

</asp:Content>
