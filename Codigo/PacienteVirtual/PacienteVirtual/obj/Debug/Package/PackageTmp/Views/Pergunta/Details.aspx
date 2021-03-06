﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.PerguntaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.detalhes %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.detalhes %></h2>

<fieldset>
    <legend><%: Resources.Mensagem.pergunta %></legend>

    <div class="display-label"><%: Resources.Mensagem.pergunta %></div>
    <div class="display-label">
        <%: Html.DisplayFor(model => model.Pergunta) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = Model.IdPergunta })%> |
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index")%>
</p>

</asp:Content>
