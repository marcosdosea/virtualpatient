<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.DiagnosticoCaracteristicaModel>>" %>
<div id="minhaBarra">
<div class="box-content">
    <table class="table table-bordered table-striped">
        <tr>
            <th>
                <%: Resources.Mensagem.caracteristica_definidora %>
            </th>
            <th>
                <%: Resources.Mensagem.opcoes %>
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.DescricaoCaracteristicaDiagnostico) %>
            </td>
            <td>
            <% if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) || Session["_IdEstadoConsulta"].Equals(4) || 
                   Session["_IdEstadoConsulta"].Equals(5) || Session["_IdEstadoConsulta"].Equals(7))))
               { %>
                <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "DiagnosticoConsultaCaracteristica", new { idDiagnostico = 
                    item.IdDiagnostico, idDiagnosticoCaracteristica = item.IdDiagnosticoCaracteristica }, new { onclick = 
                        ("return confirm('Deseja realmente REMOVER este Fator Diagnóstico?')") })%>
              <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</div>