<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.HistoricoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
<%: Resources.Mensagem.historico%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2> <%: Resources.Mensagem.historico%></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
</p>
<div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
             <%: Resources.Mensagem.pessoa_codigo%>
        </th>
        <th>
             <%: Resources.Mensagem.turma_codigo%>
        </th>
        <th>
             <%: Resources.Mensagem.paciente_codigo%>
        </th>
        <th>
             <%: Resources.Mensagem.tutor_codigo%>
        </th>
        <th>
            <%: Resources.Mensagem.relato_codigo%>
        </th>
        <th>
          <%: Resources.Mensagem.data_envio%>
        </th>
        <th>
          <%: Resources.Mensagem.data_resposta%>
        </th>
        <th>
             <%: Resources.Mensagem.estado%>
        </th>
        <th>
             <%: Resources.Mensagem.tutor_comentarios%>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdPessoa) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdTurma) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdPaciente) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdTutor) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdRelato) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.DataEnvio) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.DataResposta) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Estado) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ComentarioTutor) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = item.IdHistorico })%> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = item.IdHistorico })%> |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id = item.IdHistorico })%>
        </td>
    </tr>
<% } %>

</table></div>

</asp:Content>
