<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.MedicamentosAnterioresModel>>" %>
<div id="minhaBarra">
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
                <%: Html.DisplayFor(modelItem => item.Indicacao) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Resposta) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Periodo) %>
            </td>
            <td>
            <% if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) || Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) || Session["_IdEstadoConsulta"].Equals(7))))
               { %>
                <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", "MedicamentosAnteriores", new { idConsultaVariavel = item.IdConsultaVariavel, idMedicamento = item.IdMedicamento }, null)%>
                |
                <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "MedicamentosAnteriores", new { idConsultaVariavel = item.IdConsultaVariavel, idMedicamento = item.IdMedicamento }, new { onclick = ("return confirm('Deseja realmente REMOVER este Medicamento?')") })%>
            <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</div>