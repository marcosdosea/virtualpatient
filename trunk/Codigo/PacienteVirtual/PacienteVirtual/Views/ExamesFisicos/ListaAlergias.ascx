<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.AlergiaModel>>" %>
<div class="box-content">
    <table class="table table-bordered table-striped">
        <tr>
            <th>
                <%: Resources.Mensagem.alergia %>
            </th>
            <th>
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.Alergia) %>
            </td>
            <td>
                <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "ExamesFisicos", new { idAlergia = item.IdAlergia }, null)%>
            </td>
        </tr>
        <% } %>
    </table>
</div>
