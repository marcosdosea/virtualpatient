<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.PatologiaModel>>" %>
<div id="minhaBarra">
<div class="box-content">
    <table class="table table-bordered table-striped">
        <tr>
            <th>
                <%: Resources.Mensagem.antecedentes_familiares%>
            </th>
            <th>
                <%: Resources.Mensagem.opcoes %>
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.IdPatologia) %>
            </td>
            <td>
            <% if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) || Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) || Session["_IdEstadoConsulta"].Equals(7))))
               { %>
                <%: Html.ActionLink(Resources.Mensagem.remover, "RemoverAntecedentesFamiliares", "ClinicoInternacao", new { idPatologia = item.IdPatologia }, null)%>
            <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</div>