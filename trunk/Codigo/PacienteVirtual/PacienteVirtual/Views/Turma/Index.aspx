<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.TurmaModel>>" %>

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
            Codigo
        </th>
        <th>
            Periodo
        </th>
        <th>
            IdDisciplina
        </th>
        <th>
            tb_instituicao
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Codigo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Periodo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdDisciplina) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeInstituicao) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.IdTurma }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.IdTurma }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.IdTurma }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
