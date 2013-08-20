<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.PacientePessoaTurmaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.paciente_pessoa_turma %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.paciente_pessoa_turma %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
</p>
<div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
          <%: Resources.Mensagem.consulta_dados_fixos %>
        </th>
        <th>
            <%: Resources.Mensagem.consulta_dados_variaveis %>
        </th>
        <th>
            <%: Resources.Mensagem.grupo_atividades %>
        </th>
        <th>
            <%: Resources.Mensagem.estado_preenchimento %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdConsultaFixo) %>
        </td>
        <td>
        consulta variável - falta
            <!--%: Html.DisplayFor(modelItem => item.tb_consulta_variavel.Lembretes) %-->
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.GrupoAtividades) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.EstadoPreenchimento) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { /* id=item.PrimaryKey */ }) %>
        </td>
    </tr>
<% } %>

</table></div>

</asp:Content>
