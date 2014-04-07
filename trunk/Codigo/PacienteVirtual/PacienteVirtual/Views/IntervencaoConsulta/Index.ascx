<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.IntervencaoConsultaModel>>" %>
<div id="minhaBarra">
<div class="box-content">
    <table class="table table-bordered table-striped">
        <tr>
            <th>
                <%: Resources.Mensagem.descricao_intervencao %>
            </th>
            <th>
                <%: Resources.Mensagem.intervencao %>
            </th>
            <th>
                <%: Resources.Mensagem.paciente %>
            </th>
            <th>
                <%: Resources.Mensagem.outro %>
            </th>
            <th>
                <%: Resources.Mensagem.justificativa %>
            </th>
            <th>
                <%: Resources.Mensagem.opcoes %>
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.DescricaoGrupoIntervencao) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.DescricaoIntervencao) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Paciente) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Outro) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Justificativa) %>
            </td>
            <td>
            <% if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) || Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) || Session["_IdEstadoConsulta"].Equals(7))))
               { %>
                <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "IntervencaoConsulta", new { idConsultaVariavel = item.IdConsultaVariavel, idIntervencao = item.IdIntervencao }, null)%>
                |
                <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", "IntervencaoConsulta", new { idConsultaVariavel = item.IdConsultaVariavel, idIntervencao = item.IdIntervencao }, null)%>
            <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</div>