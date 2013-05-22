<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.InstituicaoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.instituicao %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>    <%: Resources.Mensagem.instituicao %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
</p>
<table>
    <tr>
        <th>
             <%: Resources.Mensagem.instituicao %>
        </th>
        <th>
            <%: Resources.Mensagem.sigla %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeInstituicao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Sigla) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = item.IdInstituicao })%> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = item.IdInstituicao })%> |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id = item.IdInstituicao })%>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
