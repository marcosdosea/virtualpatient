<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.EscolaridadeModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Escolaridade
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Escolaridade</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            Nivel
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Nivel) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.IdEscolaridade }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.IdEscolaridade }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.IdEscolaridade }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
