﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.MedicamentoNaoPrescritoModel>>" %>
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
                <%: Resources.Mensagem.opcoes %>
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
                <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "MedicamentoNaoPrescrito", new { idConsultaVariavel = item.IdConsultaVariavel, idMedicamento = item.IdMedicamento }, null)%>
            </td>
        </tr>
        <% } %>
    </table>
</div>