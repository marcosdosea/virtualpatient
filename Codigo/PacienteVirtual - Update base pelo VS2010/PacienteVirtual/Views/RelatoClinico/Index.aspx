<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.RelatoClinicoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Relato Clínico
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            Relato Clínico
        </th>
        <th>
            OrdemCronologia
        </th>
        <th>
            RelatoTextual
        </th>
        <th>
            NivelDificuldade
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomePaciente) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.OrdemCronologica) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.RelatoTextual) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NivelDificuldade) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.IdRelato }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.IdRelato }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.IdRelato }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
