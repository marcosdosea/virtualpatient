<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ConsultaFixoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
        <%: Resources.Mensagem.deletar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.deletar %></h2>

<h3><%: Resources.Mensagem.deletar_pergunta %></h3>
<fieldset>
    <legend><%: Resources.Mensagem.consulta_dados_fixos %></legend>

    <div class="display-label"><%: Resources.Mensagem.turma_codigo %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdTurma) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.pessoa_codigo %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdPessoa) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.estado_preenchimento %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.EstadoPreenchimento) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.eh_gabarito %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.EhGabarito) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.data_atualizacao %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DataAtualizacao) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.tutor_comentarios %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ComentariosTutor) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="<%: Resources.Mensagem.deletar %>" /> |
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </p>
<% } %>

</asp:Content>
