﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.MedicamentosModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.medicamentos %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.medicamentos %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
</p>
<table>
    <tr>
        <th>
            <%: Resources.Mensagem.nome_medicamento %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Nome) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id=item.IdMedicamento }) %> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id=item.IdMedicamento }) %> |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id=item.IdMedicamento }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
