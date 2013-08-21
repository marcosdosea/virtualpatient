<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.QueixaModel>>" %>


<div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
            <%: Resources.Mensagem.descricao_queixa %>
        </th>
        <th>
            <%: Resources.Mensagem.nome_sistema %>
        </th>
        <th></th>
    </tr>

<!--% foreach (var item in Model) { >
    <tr>
        <td>
            < %: Html.DisplayFor(modelItem => item.DescricaoQueixa) %>
        </td>
        <td>
            < %: Html.DisplayFor(modelItem => item.NomeSistema) %>
        </td>
        <td>
            < %: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id=item.IdQueixa }) %> |
            < %: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id=item.IdQueixa }) %> |
            < %: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id=item.IdQueixa }) %>
        </td>
    </tr>
< % } %-->

</table></div>

