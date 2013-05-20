<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.TurmaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Turma
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Turma</h2>

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
            Código da Disciplina
        </th>
        <th>
            Instituição
        </th>
        <th colspan="3"> Opções </th>
    </tr>

<% 
    
    
    
    
foreach (var item in Model) { %>
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
            <%: Html.ActionLink("Editar", "Edit", new { id=item.IdTurma }) %> |
            <%: Html.ActionLink("Detalhes", "Details", new { id=item.IdTurma }) %> |
            <%: Html.ActionLink("Remover", "Delete", new { id=item.IdTurma }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
