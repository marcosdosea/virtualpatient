<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.InstituicaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.deletar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Resources.Mensagem.deletar %></h2>

    <h3><%: Resources.Mensagem.deletar_pergunta %></h3>
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
    <% using (Html.BeginForm())
       { %>
       <input type="submit" value="<%: Resources.Mensagem.deletar %>" />
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index")%>
    <% } %>
</asp:Content>
