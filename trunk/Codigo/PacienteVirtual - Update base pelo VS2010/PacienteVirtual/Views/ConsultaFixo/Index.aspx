<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.ConsultaFixoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.consulta_dados_fixos%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Resources.Mensagem.consulta_dados_fixos%></h2>
    <p>
        <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
    </p>
    <table>
        <tr>
            <th>
                <%: Resources.Mensagem.consulta%>
            </th>
            <th>
                <%: Resources.Mensagem.paciente%>
            </th>
            <th>
                <%: Resources.Mensagem.eh_gabarito%>
            </th>
            <th>
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.LabelFor(model => item.IdConsultaFixo) %>
                <%: Html.DisplayFor(modelItem => item.IdConsultaFixo) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.IdPaciente) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.EhGabarito) %>
            </td>
            <td>
                <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = item.IdConsultaFixo })%>
                |
                <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = item.IdConsultaFixo })%>
                |
                <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id = item.IdConsultaFixo })%>
            </td>
        </tr>
        <% } %>
    </table>

</asp:Content>
