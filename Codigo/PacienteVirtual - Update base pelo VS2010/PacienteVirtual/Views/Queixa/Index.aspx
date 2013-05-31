<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.QueixaModel>>" %>

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
            Descricao da Queixa
        </th>
        <th>
            Nome do Sistema
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.DescricaoQueixa) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeSistema) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.IdQueixa }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.IdQueixa }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.IdQueixa }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
