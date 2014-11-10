<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.AlergiaModel>>" %>
<div id="minhaBarra">
<div class="box-content">
    <table class="table table-bordered table-striped">
        <tr>
            <th>
                <%: Resources.Mensagem.alergia%>
            </th>
            <th>
                <%: Resources.Mensagem.opcoes %>
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.Alergia) %>
            </td>
            <td>
            <% if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) || Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) || Session["_IdEstadoConsulta"].Equals(7))))
               { %>
                <%: Html.ActionLink(Resources.Mensagem.remover, "RemoverClinicoInternacaoAlergias", "ClinicoInternacao", new { idAlergia = item.IdAlergia }, null)%>
            <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</div>