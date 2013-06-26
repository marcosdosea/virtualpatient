<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.RelatoClinicoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Listar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Listar</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
    <div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
            IdRelato
        </th>
        <th>
            IdPaciente
        </th>
        <th>
            NomePaciente
        </th>
        <th>
            OrdemCronologica
        </th>
        <th>
            RelatoTextual
        </th>
        <th>
            NivelDificuldade
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdRelato) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdPaciente) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NomePaciente) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.OrdemCronologica) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.RelatoTextual) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NivelDificuldade) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ }) %>
        </td>
    </tr>
<% } %>

</table>
</div>

</asp:Content>
