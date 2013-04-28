<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.InstituicaoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Instituição
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Instituição</h2>

<p>
    <%: Html.ActionLink("Nova Instituição", "Create") %>
</p>
<table>
    <tr>
        <th>
            Nome da Instituicao
        </th>
        <th>
            Sigla
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
            <%: Html.ActionLink("Editar", "Edit", new { id=item.IdInstituicao }) %> |
            <%: Html.ActionLink("Detalhes", "Details", new { id=item.IdInstituicao }) %> |
            <%: Html.ActionLink("Remover", "Delete", new { id=item.IdInstituicao }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
