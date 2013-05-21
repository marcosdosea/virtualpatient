<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.OcupacaoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ocupação
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Ocupação</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            Descrição
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Descricao) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.IdOcupacao }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.IdOcupacao }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.IdOcupacao }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
