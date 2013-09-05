﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.MedicamentosAnterioresModel>>" %>
<div class="box-content">
    <table class="table table-bordered table-striped">
        <tr>
            <th>
                <%: Resources.Mensagem.medicamento %>
            </th>
            <th>
                <%: Resources.Mensagem.indicacao %>
            </th>
            <th>
                <%: Resources.Mensagem.resposta %>
            </th>
            <th>
                <%: Resources.Mensagem.periodo %>
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
                <%: Html.DisplayFor(modelItem => item.Indicacao) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Resposta) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Periodo) %>
            </td>
            <td>
                <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ }) %>
            </td>
        </tr>
        <% } %>
    </table>
</div>