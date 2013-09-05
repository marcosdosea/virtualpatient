<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.Cadastro.GrupoIntervencaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.remover %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.remover %></h2>

<h3><%: Resources.Mensagem.deletar_pergunta %></h3>
<fieldset>
    <legend><%: Resources.Mensagem.grupo_intervencao %></legend>

    <div class="display-label"><%: Resources.Mensagem.descricao %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DescricaoGrupoIntervencao) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="<%: Resources.Mensagem.deletar %>" /> |
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </p>
<% } %>

</asp:Content>
