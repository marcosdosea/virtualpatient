<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.RespostaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Resposta
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Resposta</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            Resposta
        </th>
        <th>
            Pergunta
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Resposta) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Pergunta) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.IdResposta }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.IdResposta }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.IdResposta }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
