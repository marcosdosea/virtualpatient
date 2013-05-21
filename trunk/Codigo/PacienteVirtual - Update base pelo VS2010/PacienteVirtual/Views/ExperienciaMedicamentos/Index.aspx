<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.ExperienciaMedicamentosModel>>" %>

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
            tb_resposta
        </th>
        <th>
            tb_resposta1
        </th>
        <th>
            tb_resposta2
        </th>
        <th>
            tb_resposta3
        </th>
        <th>
            tb_resposta4
        </th>
        <th>
            tb_resposta5
        </th>
        <th>
            AtencaoEsperaTratamento
        </th>
        <th>
            AtencaoPreocupacoes
        </th>
        <th>
            AtencaoGrauEntendimento
        </th>
        <th>
            AtencaoCultural
        </th>
        <th>
            AtencaoComportamento
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <!--%: Html.DisplayFor(modelItem => item.tb_resposta.Resposta) %>
        </td>
        <td>
            <!--%: Html.DisplayFor(modelItem => item.tb_resposta1.Resposta) %>
        </td>
        <td>
            <!--%: Html.DisplayFor(modelItem => item.tb_resposta2.Resposta) %>
        </td>
        <td>
            <!--%: Html.DisplayFor(modelItem => item.tb_resposta3.Resposta) %>
        </td>
        <td>
            <!--%: Html.DisplayFor(modelItem => item.tb_resposta4.Resposta) %>
        </td>
        <td>
            <!--%: Html.DisplayFor(modelItem => item.tb_resposta5.Resposta) %>
        </td>
        <td>
            <!--%: Html.DisplayFor(modelItem => item.AtencaoEsperaTratamento) %>
        </td>
        <td>
            <!--%: Html.DisplayFor(modelItem => item.AtencaoPreocupacoes) %>
        </td>
        <td>
            <!--%: Html.DisplayFor(modelItem => item.AtencaoGrauEntendimento) %>
        </td>
        <td>
            <!--%: Html.DisplayFor(modelItem => item.AtencaoCultural) %>
        </td>
        <td>
            <!--%: Html.DisplayFor(modelItem => item.AtencaoComportamento) %>
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
