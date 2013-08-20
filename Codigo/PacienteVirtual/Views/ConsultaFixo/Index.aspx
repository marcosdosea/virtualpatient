<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.ConsultaFixoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.consulta_dados_fixos %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.consulta_dados_fixos %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create")%>
</p>
<div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
            <%: Resources.Mensagem.turma_codigo %>
        </th>
        <th>
            <%: Resources.Mensagem.pessoa_codigo %>
        </th>
        <th>
            <%: Resources.Mensagem.estado_preenchimento %>
        </th>
        <th>
            <%: Resources.Mensagem.eh_gabarito %>
        </th>
        <th>
            <%: Resources.Mensagem.data_atualizacao %>
        </th>
        <th>
            <%: Resources.Mensagem.tutor_comentarios %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdTurma) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdPessoa) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.EstadoPreenchimento) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.EhGabarito) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.DataAtualizacao) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ComentariosTutor) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = item.IdConsultaFixo })%> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = item.IdConsultaFixo })%> |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id = item.IdConsultaFixo })%>
        </td>
    </tr>
<% } %>

</table></div>

</asp:Content>
