<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.PerguntaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Pergunta
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Pergunta</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            Pergunta
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Pergunta) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.IdPergunta }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.IdPergunta }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.IdPergunta }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
