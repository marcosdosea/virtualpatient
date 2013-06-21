﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.MedicamentoPrescritoModel>>" %>

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
            Fitoterapico
        </th>
        <th>
            Dosagem
        </th>
        <th>
            Posologia
        </th>
        <th>
            Prescritor
        </th>
        <th>
            Especialidade
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Fitoterapico) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Dosagem) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Posologia) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Prescritor) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Especialidade) %>
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