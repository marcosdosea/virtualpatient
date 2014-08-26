<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.DiagnosticoConsultaModel>>" %>
<div id="minhaBarra">
    <div class="box-content">
        <table class="table table-bordered table-striped">
            <tr>
                <th>
                    <%: Resources.Mensagem.descricao_dominio_diagnostico %>
                </th>
                <th>
                    <%: Resources.Mensagem.descricao_classe_diagnostico %>
                </th>
                <th>
                    <%: Resources.Mensagem.diagnostico %>
                </th>
                <th>
                    <%: Resources.Mensagem.opcoes %>
                </th>
            </tr>
            <% foreach (var item in Model)
               { %>
            <tr>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DescricaoDominioDiagnostico) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DescricaoClasseDiagnostico) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DescricaoDiagnostico) %>
                </td>
                <td>
                    <% if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) || Session["_IdEstadoConsulta"].Equals(4)
                        || Session["_IdEstadoConsulta"].Equals(5) || Session["_IdEstadoConsulta"].Equals(7))))
                       { %>
                        <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", "DiagnosticoConsulta", new { idConsultaVariavel = 
                            item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico }, null)%>
                        |
                        <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "DiagnosticoConsulta", new { idConsultaVariavel = 
                            item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico }, new { onclick = 
                            ("return confirm('Deseja realmente REMOVER este Medicamento?')") })%>
                        |
                        <%: Html.ActionLink(Resources.Mensagem.selecione, "SelecionarConsultaDiagnostico", "DiagnosticoConsulta", 
                            new { idConsultaVariavel = item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico }, null)%>
                    <% } %>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</div>
