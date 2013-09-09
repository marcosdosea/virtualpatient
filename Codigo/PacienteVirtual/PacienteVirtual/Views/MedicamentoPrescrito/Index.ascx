<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.MedicamentoPrescritoModel>>" %>
<div class="box-content">
    <table class="table table-bordered table-striped">
        <tr>
            <th>
                <%: Resources.Mensagem.medicamento %>
            </th>
            <th>
                <%: Resources.Mensagem.fitoterapico %>
            </th>
            <th>
                <%: Resources.Mensagem.dosagem %>
            </th>
            <th>
                <%: Resources.Mensagem.posologia %>
            </th>
            <th>
                <%: Resources.Mensagem.prescritor %>
            </th>
            <th>
                <%: Resources.Mensagem.especialidade %>
            </th>
            <th>
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
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
                <%: Html.ActionLink("Delete", "RemoverMedicamentoPrescrito", new { idConsultaVariavel = item.IdConsultaVariavel, idMedicamento = item.IdMedicamento }) %>
            </td>
        </tr>
        <% } %>
    </table>
</div>
