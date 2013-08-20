<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.EstiloVidaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
 <%: Resources.Mensagem.estilo_vida %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2> <%: Resources.Mensagem.estilo_vida %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
</p>
<div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
             <%: Resources.Mensagem.tabaco_consumo %>
        </th>
        <th>
             <%: Resources.Mensagem.tabaco_uso %>
        </th>
        <th>
             <%: Resources.Mensagem.tabaco_parou %>
        </th>
        <th>
             <%: Resources.Mensagem.cafe_consumo %>
        </th>
        <th>
             <%: Resources.Mensagem.cafe_uso %>
        </th>
        <th>
             <%: Resources.Mensagem.cafe_parou %>
        </th>
        <th>
             <%: Resources.Mensagem.alcool_consumo %>
        </th>
        <th>
             <%: Resources.Mensagem.alcool_uso %>
        </th>
        <th>
             <%: Resources.Mensagem.tipo_bebida %>
        </th>
        <th>
             <%: Resources.Mensagem.alcool_parou %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.TabacoConsumo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.TabacoUso) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.TabacoParou) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.CafeConsumo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.CafeUso) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.CafeParou) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.AlcoolConsumo) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.AlcoolUso) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.AlcoolTipoBebida) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.AlcoolParou) %>
        </td>
        <td>
             <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id=item.IdConsultaVariavel }) %> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id=item.IdConsultaVariavel }) %> |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id=item.IdConsultaVariavel }) %>
        </td>
    </tr>
<% } %>

</table></div>

</asp:Content>
