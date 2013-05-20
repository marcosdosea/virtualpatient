<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.DisciplinaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Disciplina
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Disciplina</h2>

<p>
    <%: Html.ActionLink("Nova Disciplina", "Create") %>
</p>
<table>
    <tr>
        <th>
            Nome da Disciplina
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeDisciplina) %>
        </td>
        <td>
            <%: Html.ActionLink("Editar", "Edit", new { id=item.IdDisciplina }) %> |
            <%: Html.ActionLink("Detalhes", "Details", new { id=item.IdDisciplina }) %> |
            <%: Html.ActionLink("Remover", "Delete", new { id=item.IdDisciplina }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
