<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DiagnosticoConsultaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.visualizar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.diagnostico %></h2>

<fieldset>
    <legend><%: Resources.Mensagem.diagnostico %></legend>

    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <%: Html.HiddenFor(model => model.IdDiagnostico) %>
    <%: Html.HiddenFor(model => model.IdGrupoDiagnostico) %>

    <div class="display-label"><%: Resources.Mensagem.diagnostico %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DescricaoDiagnostico) %>
    </div>
    <br />
    <div class="display-label"><%: Resources.Mensagem.grupo_diagnostico %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DescricaoGrupoDiagnostico) %>
    </div>
    <br />
    <div class="display-label"><%: Resources.Mensagem.fatores_relacionados %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Fatores) %>
    </div>
    <br />
    <div class="display-label"><%: Resources.Mensagem.caracteristicas_definidoras %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CaracteristicasDefinidoras) %>
    </div>
    <br />
    <div class="display-label"><%: Resources.Mensagem.resultado_esperado %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ResultadoEsperado) %>
    </div>
    <br />
    <div class="display-label"><%: Resources.Mensagem.prescricao_cuidados %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.PrescricaoCuidado) %>
    </div>
    <br />
    <div class="display-label"><%: Resources.Mensagem.avaliacao_resultado %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AvaliacaoResultados) %>
    </div>


</fieldset>
<br />
    <div class="btn btn-large btn-primary">
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Edit2", "Consulta", new { idConsultaVariavel = Model.IdConsultaVariavel }, new { @style = "color:White; font-size:small;" })%>
    </div>
<style>
    .display-label
    {
        font-size: medium;
        font-weight: bold;
    }
    
</style>
</asp:Content>

