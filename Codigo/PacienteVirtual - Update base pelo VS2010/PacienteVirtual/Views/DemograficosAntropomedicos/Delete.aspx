<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DemograficosAntropometricosModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.deletar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2> <%: Resources.Mensagem.deletar %></h2>

<h3> <%: Resources.Mensagem.deletar_pergunta %></h3>
<fieldset>
    <legend> <%: Resources.Mensagem.demografico_antropometricos %></legend>

    <div class="display-label"> <%: Resources.Mensagem.nome %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Nome) %>
    </div>

    <div class="display-label"> <%: Resources.Mensagem.genero %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Genero) %>
    </div>

    <div class="display-label"> <%: Resources.Mensagem.data_nascimento %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DataNascimento) %>
    </div>

    <div class="display-label"> <%: Resources.Mensagem.medicos_atendem %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.MedicosAtendem) %>
    </div>

    <div class="display-label"> <%: Resources.Mensagem.moradia_familia %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.MoradiaFamilia) %>
    </div>

    <div class="display-label"> <%: Resources.Mensagem.onde_adquire_medicamentos %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.OndeAdquireMedicamentos) %>
    </div>

    <div class="display-label"> <%: Resources.Mensagem.nivel_escolaridade %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.EscolaridadeNivel) %>
    </div>

    <div class="display-label"> <%: Resources.Mensagem.ocupacao %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.OcupacaoDescricao) %>
    </div>

    <div class="display-label"> <%: Resources.Mensagem.plano_saude %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.PlanoSaudeNome) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value=" <%: Resources.Mensagem.deletar %>" /> |
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </p>
<% } %>

</asp:Content>
