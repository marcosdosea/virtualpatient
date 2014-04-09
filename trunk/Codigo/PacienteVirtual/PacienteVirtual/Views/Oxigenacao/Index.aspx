<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.tb_oxiginecao>>" %>

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
            FrequeciaRespiratoria
        </th>
        <th>
            Ritmo
        </th>
        <th>
            Dispineia
        </th>
        <th>
            Taquipneia
        </th>
        <th>
            Bradipneia
        </th>
        <th>
            Kussmaul
        </th>
        <th>
            CheyneStokes
        </th>
        <th>
            Epistaxe
        </th>
        <th>
            ObstrucaoNasal
        </th>
        <th>
            Coriza
        </th>
        <th>
            DesvioDeSepto
        </th>
        <th>
            Palidez
        </th>
        <th>
            LabioCianotico
        </th>
        <th>
            SimetriaToracica
        </th>
        <th>
            Barril
        </th>
        <th>
            PeitoDePombo
        </th>
        <th>
            Funil
        </th>
        <th>
            Lordose
        </th>
        <th>
            Cifose
        </th>
        <th>
            Escoliose
        </th>
        <th>
            TiragemIntercostal
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.FrequeciaRespiratoria) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Ritmo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Dispineia) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Taquipneia) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Bradipneia) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Kussmaul) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.CheyneStokes) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Epistaxe) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ObstrucaoNasal) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Coriza) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.DesvioDeSepto) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Palidez) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.LabioCianotico) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.SimetriaToracica) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Barril) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.PeitoDePombo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Funil) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Lordose) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Cifose) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Escoliose) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.TiragemIntercostal) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.IdConsultaVariavel }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.IdConsultaVariavel }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.IdConsultaVariavel }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
