<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.DiarioPessoalModel>>" %>
    <table class="table table-bordered table-striped">
    <tr>
        <th>
            <%: Resources.Mensagem.periodo %>
        </th>
        <th>
            <%: Resources.Mensagem.horario %>
        </th>
        <th>
            <%: Resources.Mensagem.quantidade %>
        </th>
        <th>
            <%: Resources.Mensagem.medicamento %>
        </th>
        <th>
            <%: Resources.Mensagem.tipo_bebida %>
        </th>
        <th><%: Resources.Mensagem.opcoes %></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Periodo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Horario) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Quantidade) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Medicamento) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeBebida) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "DiarioPessoal", new { idConsultaFixo = item.IdConsultaFixo, idMedicamento = item.IdMedicamento }, null)%>
        </td>
    </tr>
<% } %>

</table>