<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.Data.tb_paciente_pessoa_turma>>" %>

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
            tb_consulta_fixo
        </th>
        <th>
            tb_consulta_variavel
        </th>
        <th>
            GrupoAtividades
        </th>
        <th>
            EstadoPreenchimento
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.tb_consulta_fixo.IdConsutaFixo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.tb_consulta_variavel.Lembretes) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.GrupoAtividades) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.EstadoPreenchimento) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
