﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.ParametroClinicoModel>>" %>

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
            ParametroClinico
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.ParametroClinico) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.IdParametroClinico }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.IdParametroClinico }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.IdParametroClinico }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>