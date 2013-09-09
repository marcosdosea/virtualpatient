<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.Consulta.ConsultaParametroModel>>" %>

<div class="box-content">
    <table class="table table-bordered table-striped">
    <tr>
        <th>
            ParametroClinico
        </th>
        <th>
            Valor
        </th>
        <th>
            ValorReferencia
        </th>
        <th>
            Unidade
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.ParametroClinico) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Valor) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ValorReferencia) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Unidade) %>
        </td>
        <td>
            <%: Html.ActionLink("Delete", "RemoverConsultaParametro", new { idConsultaVariavel = item.IdConsultaVariavel, idParametroClinico = item.IdParametroClinico}) %>
        </td>
    </tr>
<% } %>

</table>
</div>
