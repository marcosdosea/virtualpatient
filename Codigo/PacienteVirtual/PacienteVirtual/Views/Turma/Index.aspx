<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.TurmaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Turmas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Turmas</h2>

<p>
    <%: Html.ActionLink("Nova Turma", "Create") %>
</p>
<table>
    <tr>
        <th>
            Código
        </th>
        <th>
            Período
        </th>
        <th>
            Tutor
        </th>
        <th>
            Nome da Disciplina
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
            <%: Html.DisplayFor(modelItem => item.Tutor) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeDisciplina) %>
        </td>
        <td>
            <%: Html.ActionLink("Editar", "Edit", new { id=item.Id }) %> |
            <%: Html.ActionLink("Detalhes", "Details", new { id=item.Id }) %> |
            <%: Html.ActionLink("Excluir", "Delete", new { id=item.Id }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
