<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.ConsultaVariavelQueixaModel>>" %>

<div class="box-content">
    <table class="table table-bordered table-striped">
        <tr>
            <th>
                <%: Resources.Mensagem.descricao_queixa %>
            </th>
            <th>
                <%: Resources.Mensagem.tipo %>
            </th>
            <th>
                <%: Resources.Mensagem.desde %>
            </th>
            <th>
                <%: Resources.Mensagem.prioridade %>
            </th>
            <th>
                <%: Resources.Mensagem.opcoes %>
            </th>
        </tr>
        <% if (Model != null)
               foreach (var item in Model)
               { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.DescricaoQueixa) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Tipo) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Desde) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Prioridade) %>
            </td>
            <td>
                <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "ConsultaVariavelQueixa", new { idConsultaVariavel = item.IdConsultaVariavel, idQueixa = item.IdQueixa }, null) %>
                <% if (item.Tipo == "S")
                   { %>
                |
                <%: Html.ActionLink("Novo PRM", "Delete", "ConsultaVariavelQueixa", new { idConsultaVariavel = item.IdConsultaVariavel, idQueixa = item.IdQueixa }, null) %>
                <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</div>
