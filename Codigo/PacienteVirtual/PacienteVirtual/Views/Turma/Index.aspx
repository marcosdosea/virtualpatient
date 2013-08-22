<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.TurmaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.turma %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.turma %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
</p>
<div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
            <%: Resources.Mensagem.ativa %>
        </th>
        <th>
            <%: Resources.Mensagem.codigo %>
        </th>
        <th>
            <%: Resources.Mensagem.periodo %>
        </th>
        <th>
            <%: Resources.Mensagem.disciplina %>
        </th>
        <th>
            <%: Resources.Mensagem.instituicao %>
        </th>
        <th>
            <%: Resources.Mensagem.curso %>
        </th>
        <th colspan="3"> <%: Resources.Mensagem.opcoes %> </th>
    </tr>

<% 
    
foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Ativa) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Codigo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Periodo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeDisciplina) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeInstituicao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeCurso) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = item.IdTurma })%> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id=item.IdTurma }) %> |
            <%: Html.ActionLink(Resources.Mensagem.deletar, "Delete", new { id=item.IdTurma }) %>
        </td>
    </tr>
<% } %>

</table></div>

</asp:Content>
