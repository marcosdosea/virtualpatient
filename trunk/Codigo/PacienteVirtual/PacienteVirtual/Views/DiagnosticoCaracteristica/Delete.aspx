﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DiagnosticoCaracteristicaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   <%: Resources.Mensagem.deletar %>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.deletar %></h2>

<h3><%: Resources.Mensagem.deletar_pergunta %></h3>
<fieldset>
    <legend> <%: Resources.Mensagem.caracteristica_diagnostico %></legend>

    <div class="display-label"><%: Resources.Mensagem.diagnostico %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Diagnostico) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.descricao_caracteristica_diagnostico %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DescricaoCaracteristicaDiagnostico) %>
    </div>

</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="<%: Resources.Mensagem.deletar %>" /> |
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </p>
<% } %>

</asp:Content>
