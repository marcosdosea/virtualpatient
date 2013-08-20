<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.DiarioPessoalModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
     <%: Resources.Mensagem.diario_pessoal %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.diario_pessoal %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
</p>
<div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
            <%: Resources.Mensagem.periodo %>
        </th>
        <th>
            <%: Resources.Mensagem.horario %>
        </th>
        <th>
            <%: Resources.Mensagem.quantidade %>
        </th>
        <th>
            <%: Resources.Mensagem.tipo_bebida %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Periodo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Horario) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Quantidade) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.TipoBebida) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { /* id=item.PrimaryKey */ }) %>
        </td>
    </tr>
<% } %>

</table></div>

</asp:Content>
