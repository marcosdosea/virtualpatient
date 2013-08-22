<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.CursoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
     <%: Resources.Mensagem.curso %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2> <%: Resources.Mensagem.curso %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
</p>
<div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
            <%: Resources.Mensagem.curso %>
        </th>
        <th> <%: Resources.Mensagem.opcoes %> </th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeCurso) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.editar , "Edit", new { id=item.IdCurso }) %> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = item.IdCurso })%> |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id=item.IdCurso }) %>
        </td>
    </tr>
<% } %>

</table></div>

</asp:Content>
