<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.RelatoClinicoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.listar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.listar %></h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
    <div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
            <%: Resources.Mensagem.relato_codigo %>
        </th>
        <th>
            <%: Resources.Mensagem.paciente_codigo %>
        </th>
        <th>
            <%: Resources.Mensagem.paciente_nome %>
        </th>
        <th>
            <%: Resources.Mensagem.ordem_cronologica %>
        </th>
        <th>
            <%: Resources.Mensagem.relato_textual %>
        </th>
        <th>
            <%: Resources.Mensagem.nivel_dificuldade %>
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
