<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.DiarioPessoalModel>>" %>

<table>
    <tr>
        <th>
            Medicamento
        </th>
        <th>
            Periodo
        </th>
        <th>
            Horario
        </th>
        <th>
            Quantidade
        </th>
        <th>
            NomeBebida
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Medicamento) %>
        </td>
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
            <%: Html.DisplayFor(modelItem => item.NomeBebida) %>
        </td>
        <td>
            <%: Html.ActionLink("Delete", "Delete", new { idConsultaFixo=item.IdConsultaFixo, idMedicamento=item.IdMedicamento }) %>
        </td>
    </tr>
<% } %>

</table>
