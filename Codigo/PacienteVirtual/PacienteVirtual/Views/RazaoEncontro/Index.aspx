<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.RazaoEncontroModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.razao_encontro %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.razao_encontro %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
</p>
<div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
            <%: Resources.Mensagem.descricao_razao %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.DescricaoRazao) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id=item.IdRazaoEncontro }) %> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = item.IdRazaoEncontro })%> |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id = item.IdRazaoEncontro })%>
        </td>
    </tr>
<% } %>

</table></div>

</asp:Content>
