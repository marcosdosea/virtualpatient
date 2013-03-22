<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.DisciplinaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            NomeDisciplina
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeDisciplina) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.IdDisciplina }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.IdDisciplina }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.IdDisciplina }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
