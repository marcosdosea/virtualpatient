<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.MedicamentoPrescritoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.medicamento_prescrito %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2> <%: Resources.Mensagem.medicamento_prescrito %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
</p>
<div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
             <%: Resources.Mensagem.fitoterapico %>
        </th>
        <th>
             <%: Resources.Mensagem.dosagem %>
        </th>
        <th>
             <%: Resources.Mensagem.posologia %>
        </th>
        <th>
             <%: Resources.Mensagem.prescritor %>
        </th>
        <th>
             <%: Resources.Mensagem.especialidade %>
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
             <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { /* id=item.PrimaryKey */ }) %>
        </td>
    </tr>
<% } %>

</table></div>

</asp:Content>
