<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.PacientePessoaTurmaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.deletar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.deletar %></h2>

<h3><%: Resources.Mensagem.deletar_pergunta %></h3>
<fieldset>
    <legend><%: Resources.Mensagem.paciente_pessoa_turma %></legend>

    <div class="display-label"><%: Resources.Mensagem.consulta_dados_fixos %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdConsultaFixo) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.consulta_dados_variaveis %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tb_consulta_variavel.Lembretes) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.grupo_atividades %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.GrupoAtividades) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.estado_preenchimento %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.EstadoPreenchimento) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="<%: Resources.Mensagem.deletar %>" /> |
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </p>
<% } %>

</asp:Content>
