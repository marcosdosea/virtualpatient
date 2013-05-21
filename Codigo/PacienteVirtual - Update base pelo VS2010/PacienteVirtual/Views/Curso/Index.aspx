<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.CursoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Curso
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Curso</h2>

<p>
    <%: Html.ActionLink("Novo Curso", "Create") %>
</p>
<table>
    <tr>
        <th>
            Nome do Curso
        </th>
        <th>
           Instituição
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeCurso) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeInstituicao) %>
        </td>
        <td>
            <%: Html.ActionLink("Editar", "Edit", new { id=item.IdCurso }) %> |
            <%: Html.ActionLink("Detalhes", "Details", new { id=item.IdCurso }) %> |
            <%: Html.ActionLink("Remover", "Delete", new { id=item.IdCurso }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
