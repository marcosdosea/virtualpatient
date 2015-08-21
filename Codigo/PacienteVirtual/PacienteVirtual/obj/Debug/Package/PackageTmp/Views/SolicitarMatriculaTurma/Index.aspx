<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.TurmaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.solicitar_matricula_turma %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.solicitar_matricula_turma %></h2>

<%@ Import Namespace="GridMvc.Html" %>
<%@ Import Namespace="GridMvc.Sorting" %>

<div class="box-content">

<%= Html.Grid(Model).Columns(columns =>
    {
        columns.Add(o => o.NomeInstituicao)
                .Titled(Resources.Mensagem.instituicao)
                .ThenSortByDescending(o => o.NomeInstituicao)
                .Filterable(true);

        columns.Add(o => o.NomeCurso)
                .Titled(Resources.Mensagem.curso)
                .ThenSortByDescending(o => o.NomeCurso)
                .Filterable(true);

        columns.Add(o => o.NomeDisciplina)
                .Titled(Resources.Mensagem.disciplina)
                .ThenSortByDescending(o => o.NomeDisciplina)
                .Filterable(true);

        columns.Add(o => o.Periodo)
        .Titled(Resources.Mensagem.periodo)
        .ThenSortByDescending(o => o.Periodo)
        .Filterable(true);

        columns.Add(o => o.Codigo)
                .Titled(Resources.Mensagem.codigo)
                .ThenSortByDescending(o => o.Codigo)
                .Filterable(true);

        columns.Add()
                .Titled(Resources.Mensagem.solicitar)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.solicitar, "Solicitar", "SolicitarMatriculaTurma", new { IdTurma = o.IdTurma}, new { @class = "modal-link" }));

    }).WithPaging(5).Sortable().ToHtmlString()%>

</div>

</asp:Content>
