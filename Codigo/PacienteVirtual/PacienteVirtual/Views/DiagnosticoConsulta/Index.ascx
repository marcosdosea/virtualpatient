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
            <%: Html.ActionLink(Resources.Mensagem.visualizar,"Details", "DiagnosticoConsulta", new { idConsultaVariavel = item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico, idGrupoDiagnostico = item.IdGrupoDiagnostico }, null) %>
            |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "DiagnosticoConsulta", new { idConsultaVariavel = item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico }, new { onclick = ("return confirm('Deseja realmente REMOVER este Diagnóstico?')") })%>
        </td>
    </tr>
<% } %>

</table>
</div>
