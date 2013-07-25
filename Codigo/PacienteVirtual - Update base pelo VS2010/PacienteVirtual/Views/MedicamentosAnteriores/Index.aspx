<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.MedicamentosAnterioresModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
     <%: Resources.Mensagem.medicamentos_anteriores %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.medicamentos_anteriores %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
</p>
<div class="box-content">
 <table class="table table-bordered table-striped">
    <tr>
        <th>
            <%: Resources.Mensagem.indicacao %>
        </th>
        <th>
            <%: Resources.Mensagem.resposta %>
        </th>
        <th>
            <%: Resources.Mensagem.periodo %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Indicacao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Resposta) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Periodo) %>
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
