<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DiagnosticoConsultaModel>" %>

<fieldset>

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
<style>
    .display-label
    {
        font-size: medium;
        font-weight: bold;
    }
    
</style>

