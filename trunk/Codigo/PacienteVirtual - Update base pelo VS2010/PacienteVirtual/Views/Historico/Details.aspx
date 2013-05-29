﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.HistoricoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.detalhes%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.detalhes%></h2>

<fieldset>
    <legend><%: Resources.Mensagem.historico%></legend>

    <div class="display-label"><%: Resources.Mensagem.pessoa_codigo%></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdPessoa) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.turma_codigo%></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdTurma) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.paciente_codigo%></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdPaciente) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.tutor_codigo%></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdTutor) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.relato_codigo%></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdRelato) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.data_envio%></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DataEnvio) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.data_resposta%></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DataResposta) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.estado%></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Estado) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.tutor_comentarios%></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ComentarioTutor) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id=Model.IdHistorico }) %> |
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
</p>

</asp:Content>
