<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.ViewModel.VMConsulta>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.consulta %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Resources.Mensagem.consulta %></h2>
    <div class="box-content"> <table class="table table-bordered table-striped">
        <tr>
            <th>
                <%: Resources.Mensagem.codigo %>
            </th>
            <th>
                <%: Resources.Mensagem.nome %>
            </th>
            <th>
                <%: Resources.Mensagem.foto %>
            </th>
            <th>
                <%: Resources.Mensagem.relato_clinico %>
            </th>
            <th>
                <%: Resources.Mensagem.consulta %>
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
                <%: Html.ActionLink("Adicionar/Alterar Consultas", "AdicionarAlterar", new { id = item.paciente.IdPaciente })%>
            </td>
        </tr>
        <% } %>
    </table>
    </div>
</asp:Content>
