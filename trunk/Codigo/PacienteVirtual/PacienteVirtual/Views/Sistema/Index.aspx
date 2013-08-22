<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.SistemaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.sistema %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.sistema %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
</p>
<div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
            <%: Resources.Mensagem.nome_sistema %>
        </th>
        <th><%: Resources.Mensagem.opcoes %></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomeSistema) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id=item.IdSistema }) %> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id=item.IdSistema }) %> |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id=item.IdSistema }) %>
        </td>
    </tr>
<% } %>

</table></div>

</asp:Content>
