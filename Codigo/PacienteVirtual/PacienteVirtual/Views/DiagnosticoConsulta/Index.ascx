<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.DiagnosticoConsultaModel>>" %>

<div class="box-content">
    <table class="table table-bordered table-striped">
    <tr>
        <th>
            <%: Resources.Mensagem.diagnostico %>
        </th>
        <th>
            <%: Resources.Mensagem.grupo_diagnostico %>
        </th>
        <th>
            <%: Resources.Mensagem.fatores_relacionados %>
        </th>
        <th>
            <%: Resources.Mensagem.caracteristicas_definidoras %>
        </th>
        <th>
            <%: Resources.Mensagem.resultado_esperado %>
        </th>
        <th>
            <%: Resources.Mensagem.prescricao_cuidados %>
        </th>
        <th>
            <%: Resources.Mensagem.avaliacao_resultado %>
        </th>
        <th><%: Resources.Mensagem.opcoes %></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.DescricaoDiagnostico) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.DescricaoGrupoDiagnostico) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Fatores) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.CaracteristicasDefinidoras) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ResultadoEsperado) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.PrescricaoCuidado) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.AvaliacaoResultados) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.editar,"Edit", "DiagnosticoConsulta", new { idConsultaVariavel = item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico }, null) %>
            |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "DiagnosticoConsulta", new { idConsultaVariavel = item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico }, new { onclick = ("return confirm('Deseja realmente REMOVER este Diagnóstico?')") })%>
        </td>
    </tr>
<% } %>

</table>
</div>
