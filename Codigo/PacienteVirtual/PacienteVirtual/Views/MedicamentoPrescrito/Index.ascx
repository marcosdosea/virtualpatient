<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.MedicamentoPrescritoModel>>" %>

<table>
    <tr>
        <th>
            IdConsultaVariavel
        </th>
        <th>
            IdMedicamento
        </th>
        <th>
            MedicamentoNome
        </th>
        <th>
            Fitoterapico
        </th>
        <th>
            Dosagem
        </th>
        <th>
            Posologia
        </th>
        <th>
            Prescritor
        </th>
        <th>
            Especialidade
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdConsultaVariavel) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdMedicamento) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.MedicamentoNome) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Fitoterapico) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Dosagem) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Posologia) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Prescritor) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Especialidade) %>
        </td>
        <td>
            <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ }) %>
        </td>
    </tr>
<% } %>

</table>
