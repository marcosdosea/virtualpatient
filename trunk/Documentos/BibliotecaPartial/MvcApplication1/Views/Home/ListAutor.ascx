<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<MvcApplication1.Models.AutorModel>>" %>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            Codigo
        </th>
        <th>
            Nome
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Codigo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Nome) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new {  id=item.Codigo }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.Codigo }) %>
        </td>
    </tr>
<% } %>

</table>
