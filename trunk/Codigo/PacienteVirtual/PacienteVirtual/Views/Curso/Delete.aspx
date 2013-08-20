<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.CursoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.deletar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>  <%: Resources.Mensagem.deletar %></h2>

<h3> <%: Resources.Mensagem.deletar_pergunta %></h3>
<fieldset>
    <legend> <%: Resources.Mensagem.curso %></legend>

    <div class="display-label"><%: Html.LabelFor(model => model.NomeCurso) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeCurso) %>
    </div>

    <div class="display-label"><%: Html.LabelFor(model => model.NomeInstituicao) %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeInstituicao) %> 
    </div>

</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value=" <%: Resources.Mensagem.salvar %>" />
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </p>
<% } %>

</asp:Content>
