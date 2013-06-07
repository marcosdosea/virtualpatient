<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.ParametroClinicoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.parametro_clinico %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.parametro_clinico %></h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
            <%: Resources.Mensagem.detalhes %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.ParametroClinico) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = item.IdParametroClinico })%> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = item.IdParametroClinico })%> |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id = item.IdParametroClinico })%>
        </td>
    </tr>
<% } %>

</table></div>

</asp:Content>
