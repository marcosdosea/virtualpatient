<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ExperienciaMedicamentosModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
 <%: Resources.Mensagem.deletar%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.deletar%></h2>

<h3><%: Resources.Mensagem.deletar_pergunta%></h3>
<fieldset>
    <legend><%: Resources.Mensagem.experiencia_medicamentos%></legend>

    <div class="display-label"><%: Resources.Mensagem.espera_tratamento %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdRespostaEsperaTratamento)%>
    </div>

    <div class="display-label"><%: Resources.Mensagem.preocupacoes %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdRespostaPreocupacoes)%>
    </div>

    <div class="display-label"><%: Resources.Mensagem.grau_entendimento %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdRespostaGrauEntendimento)%>
    </div>

    <div class="display-label"><%: Resources.Mensagem.cultural %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdRespostaCultural)%>
    </div>

    <div class="display-label"><%: Resources.Mensagem.comportamento %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdRespostaComportamento)%>
    </div>

    <div class="display-label"><%: Resources.Mensagem.incorporado_plano %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdRespostaIncorporadoPlano)%>
    </div>

    <div class="display-label"><%: Resources.Mensagem.espera_tratamento_atencao %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AtencaoEsperaTratamento) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.preocupacoes_atencao %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AtencaoPreocupacoes) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.grau_entendimento_atencao %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AtencaoGrauEntendimento) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.cultural_atencao %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AtencaoCultural) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.comportamento_atencao %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AtencaoComportamento) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="<%: Resources.Mensagem.deletar %>" /> |
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </p>
<% } %>

</asp:Content>
