<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.DemograficosAntropometricosModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Index</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
<table>
    <tr>
        <th>
            Nome
        </th>
        <th>
            Genero
        </th>
        <th>
            DataNascimento
        </th>
        <th>
            MedicosAtendem
        </th>
        <th>
            MoradiaFamilia
        </th>
        <th>
            OndeAdquireMedicamentos
        </th>
        <th>
            tb_escolaridade
        </th>
        <th>
            tb_ocupacao
        </th>
        <th>
            tb_plano_saude
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
            <!--%: Html.DisplayFor(modelItem => item.tb_escolaridade.Nivel) %>
        </td>
        <td>
            <!--%: Html.DisplayFor(modelItem => item.tb_ocupacao.Descricao) %>
        </td>
        <td>
            <!--%: Html.DisplayFor(modelItem => item.tb_plano_saude.Nome) %>
        </td>
        <td-->
            <%: Html.ActionLink("Edit", "Edit", new { id=item.IdConsultaFixo }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.IdConsultaFixo }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.IdConsultaFixo }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
