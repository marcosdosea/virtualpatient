﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.PacienteModel>>" %>

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
            Nome
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomePaciente) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.IdPaciente }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.IdPaciente }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.IdPaciente }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>