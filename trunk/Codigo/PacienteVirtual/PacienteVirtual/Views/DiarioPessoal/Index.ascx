<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.DiarioPessoalModel>>" %>
<div id="minhaBarra">
<div class="box-content">    
    <table class="table table-bordered table-striped">
    <tr>
        <th>
            <%: Resources.Mensagem.periodo %>
        </th>
        <th>
            <%: Resources.Mensagem.horario %>
        </th>
        <th>
            <%: Resources.Mensagem.horario_complemento %>
        </th>
        <th>
            <%: Resources.Mensagem.medicamento %>
        </th>
        <th>
            <%: Resources.Mensagem.dose %>
        </th>
        <th>
            <%: Resources.Mensagem.quantidade %>
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
            <%: Html.DisplayFor(modelItem => item.HorarioComplemento) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Medicamento) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Dose) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Quantidade) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeBebida) %>
        </td>
        <td>
        <% if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) || Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) || Session["_IdEstadoConsulta"].Equals(7))))
           { %>
            <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", "DiarioPessoal", new { idConsultaFixo = item.IdConsultaFixo, idMedicamento = item.IdMedicamento }, null)%>|
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "DiarioPessoal", new { idConsultaFixo = item.IdConsultaFixo, idMedicamento = item.IdMedicamento, horario = item.Horario, quantidade = item.Quantidade }, null)%>
        <% } %>
        </td>
    </tr>
<% } %>

</table>
</div>
</div>