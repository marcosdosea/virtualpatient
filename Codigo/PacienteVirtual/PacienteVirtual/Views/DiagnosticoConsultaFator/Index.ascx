<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.DiagnosticoFatorModel>>" %>
<div id="minhaBarra">
<div class="box-content">
    <table class="table table-bordered table-striped">
        <tr>
            <th>
                <% if (Session["_Risco"].Equals(true))
                   { %>
                    <%: Resources.Mensagem.fatores_risco%>
                <% }
                   else
                   { %>
                   <%: Resources.Mensagem.fatores_relacionados%>
                <% } %>
            </th>
            <th>
                <%: Resources.Mensagem.opcoes %>
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.DescricaoFatorDiagnostico) %>
            </td>
            <td>
            <% if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) || Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) || Session["_IdEstadoConsulta"].Equals(7))))
               { %>
                <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "DiagnosticoConsultaFator", new { idDiagnostico = item.IdDiagnostico, 
                    idDiagnosticoFator = item.IdDiagnosticoFator }, new { onclick = ("return confirm('Deseja realmente REMOVER este Fator Diagnóstico?')") })%>
              <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</div>