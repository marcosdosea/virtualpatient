<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.ViewModel.VMConsulta>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
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
                Id
            </th>
            <th>
                nome
            </th>
            <th>
                foto
            </th>
            <th>
                Relatos
            </th>
            <th>
                Consultas
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.paciente.IdPaciente) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.paciente.NomePaciente) %>
            </td>
            <td>
                <div class="media">
                    <a class="pull-left" href="<%: Url.Action("Edit", "VMPaciente", new { modelItem = item })%>">
                        <img src='<%: Url.Action("GetImage", "Paciente", new { id = item.paciente.IdPaciente }) %>'
                            width="100" height="110" alt="<%: Url.Action("GetImage", "Paciente", new { id = item.paciente.IdPaciente }) %>" />
                    </a>
                </div>
            </td>
            <td>
                |<%: Html.ActionLink("Listar Relatos", "Listar", "RelatoClinico", new RouteValueDictionary(new { id = item.paciente.IdPaciente }), null)%>
            </td>
            <td>
                &nbsp &nbsp &nbsp &nbsp &nbsp
                <%: Html.ActionLink("Adicionar/Alterar Consultas", "Edit", new { id = item.paciente.IdPaciente }, new { @class = "span4", @cols = "40", @rows = "28" })%>
            </td>
        </tr>
        <% } %>
    </table>
</asp:Content>
