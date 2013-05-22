<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.DemograficosAntropometricosModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
<%: Resources.Mensagem.demografico_antropometricos %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.demografico_antropometricos %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
</p>
<table>
    <tr>
        <th>
        <%: Resources.Mensagem.nome %>
        </th>
        <th>
        <%: Resources.Mensagem.genero %>
        </th>
        <th>
             <%: Resources.Mensagem.data_nascimento %>
        </th>
        <th>
             <%: Resources.Mensagem.medicos_atendem %>
        </th>
        <th>
              <%: Resources.Mensagem.moradia_familia %>
        </th>
        <th>
              <%: Resources.Mensagem.onde_adquire_medicamentos %>
        </th>
        <th>
              <%: Resources.Mensagem.escolaridade %>
        </th>
        <th>
             <%: Resources.Mensagem.ocupacao %>
        </th>
        <th>
            <%: Resources.Mensagem.plano_saude %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Nome) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Genero) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.DataNascimento) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.MedicosAtendem) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.MoradiaFamilia) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.OndeAdquireMedicamentos) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.EscolaridadeNivel) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.OcupacaoDescricao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.PlanoSaudeNome) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id=item.IdConsultaFixo }) %> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = item.IdConsultaFixo })%> |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id = item.IdConsultaFixo })%>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
