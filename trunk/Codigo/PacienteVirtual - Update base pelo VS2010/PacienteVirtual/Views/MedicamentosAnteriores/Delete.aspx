﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.MedicamentosAnterioresModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
<%: Resources.Mensagem.deletar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.deletar %></h2>

<h3><%: Resources.Mensagem.deletar_pergunta %></h3>
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
<% using (Html.BeginForm()) { %>
    <p>
        <%: Resources.Mensagem.deletar %> |
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </p>
<% } %>

</asp:Content>
