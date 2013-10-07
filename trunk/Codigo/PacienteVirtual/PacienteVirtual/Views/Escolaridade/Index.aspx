<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.EscolaridadeModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.escolaridade %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.escolaridade %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
</p>
<div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
            <%: Resources.Mensagem.nivel_escolaridade %>
        </th>
        <th style="width:270px;"><%: Resources.Mensagem.opcoes %></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Nivel) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id=item.IdEscolaridade }) %> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id=item.IdEscolaridade }) %> |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id=item.IdEscolaridade }) %>
        </td>
    </tr>
<% } %>

</table></div>

</asp:Content>
