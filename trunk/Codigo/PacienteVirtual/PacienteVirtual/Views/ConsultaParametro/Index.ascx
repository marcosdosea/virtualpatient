<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.ConsultaParametroModel>>" %>

<div class="box-content">
    <table class="table table-bordered table-striped">
    <tr>
        <th>
            <%: Resources.Mensagem.parametro_clinico %>
        </th>
        <th>
            <%: Resources.Mensagem.valor %>
        </th>
        <th>
            <%: Resources.Mensagem.valor_referencia %>
        </th>
        <th>
            <%: Resources.Mensagem.unidade %>
        </th>
        <th><%: Resources.Mensagem.opcoes %></th>
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
        <% if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) || Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) || Session["_IdEstadoConsulta"].Equals(7))))
           { %>
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "ConsultaParametro", new { idConsultaVariavel = item.IdConsultaVariavel, idParametroClinico = item.IdParametroClinico }, null)%>
        <% } %>
        </td>
    </tr>
<% } %>

</table>
</div>
