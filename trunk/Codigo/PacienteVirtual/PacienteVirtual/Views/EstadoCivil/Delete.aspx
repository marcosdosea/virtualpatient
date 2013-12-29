<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.EstadoCivilModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.deletar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.deletar %></h2>

<h3><%: Resources.Mensagem.deletar_pergunta %></h3>
<fieldset>
    <legend><%: Resources.Mensagem.estado_civil %></legend>

    <div class="display-label"><%: Resources.Mensagem.estado_civil %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.EstadoCivil) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value=" <%: Resources.Mensagem.deletar %>" /> |
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index")%>
    </p>
<% } %>

</asp:Content>
