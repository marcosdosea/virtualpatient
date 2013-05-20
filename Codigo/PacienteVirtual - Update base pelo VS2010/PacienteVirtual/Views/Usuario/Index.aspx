<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.Data.UsuarioE>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Registrar", "Create") %>
</p>
<table>
    <tr>
        <th>
            Cpf
        </th>
        <th>
            Nome
        </th>
        <th>
            Email
        </th>
        <th>
            Login
        </th>
        <th>
            Senha
        </th>
        <th>
            Tipo
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Cpf) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeUsuario) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Email) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Login) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Senha) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.tpUsuario) %>
        </td>
        <td>
            <%: Html.ActionLink("Editar", "Edit", new { id=item.IdUsuario }) %> |
            <%: Html.ActionLink("Detalhes", "Details", new { id=item.IdUsuario }) %> |
            <%: Html.ActionLink("Remover", "Delete", new { id=item.IdUsuario }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
