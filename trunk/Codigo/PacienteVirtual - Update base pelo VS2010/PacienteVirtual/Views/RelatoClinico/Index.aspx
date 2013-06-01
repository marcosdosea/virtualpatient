<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.RelatoClinicoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Relato Clínico
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Index</h2>
    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>
    <table>
        <tr>
            <th>
                Relato Clínico
            </th>
            <th>
                OrdemCronologia
            </th>
            <th>
                RelatoTextual
            </th>
            <th>
                NivelDificuldade
            </th>
            <th>
                video
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
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
                <video width="320" height="240" controls autoplay="autoplay">
                    <source src="<%: Url.Action("GetImage", "Paciente", new { id= item.RelatoVideo }) %>">
                </video>
            </td>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.IdRelato }) %>
                |
                <%: Html.ActionLink("Details", "Details", new { id=item.IdRelato }) %>
                |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.IdRelato }) %>
            </td>
        </tr>
        <% } %>
    </table>
</asp:Content>
