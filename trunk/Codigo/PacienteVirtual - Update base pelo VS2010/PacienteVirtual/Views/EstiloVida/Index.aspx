<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.EstiloVidaModel>>" %>

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
            TabacoConsumo
        </th>
        <th>
            TabacoUso
        </th>
        <th>
            TabacoParou
        </th>
        <th>
            CafeConsumo
        </th>
        <th>
            CafeUso
        </th>
        <th>
            CafeParou
        </th>
        <th>
            AlcoolConsumo
        </th>
        <th>
            AlcoolUso
        </th>
        <th>
            AlcoolTipoBebida
        </th>
        <th>
            AlcoolParou
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.TabacoConsumo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.TabacoUso) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.TabacoParou) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.CafeConsumo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.CafeUso) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.CafeParou) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.AlcoolConsumo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.AlcoolUso) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.AlcoolTipoBebida) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.AlcoolParou) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.IdConsultaVariavel }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.IdConsultaVariavel }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.IdConsultaVariavel }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
