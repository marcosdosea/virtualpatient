<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.TurmaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.turma %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.turma %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
</p>

<%@ Import Namespace="GridMvc.Html" %>
<%@ Import Namespace="GridMvc.Sorting" %>

<div class="box-content">

<%= Html.Grid(Model).Columns(columns =>
    {
        
        /* Adding "CompanyName" column: */
        columns.Add(o => o.Ativa)
                .Titled(Resources.Mensagem.ativa)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .Filterable(true)
                .RenderValueAs(o => o.Ativa == true ? Resources.Mensagem.sim : Resources.Mensagem.nao);

        /* Adding "CompanyName" column: */
        columns.Add(o => o.Codigo)
                .Titled(Resources.Mensagem.codigo)
                .ThenSortByDescending(o => o.Codigo)
                .Filterable(true);

        /* Adding "CompanyName" column: */
        columns.Add(o => o.Periodo)
                .Titled(Resources.Mensagem.periodo)
                .ThenSortByDescending(o => o.Periodo)
                .Filterable(true);

        /* Adding "CompanyName" column: */
        columns.Add(o => o.NomeDisciplina)
                .Titled(Resources.Mensagem.disciplina)
                .ThenSortByDescending(o => o.NomeDisciplina)
                .Filterable(true);

        /* Adding "CompanyName" column: */
        columns.Add(o => o.NomeInstituicao)
                .Titled(Resources.Mensagem.instituicao)
                .ThenSortByDescending(o => o.NomeInstituicao)
                .Filterable(true);

        /* Adding "CompanyName" column: */
        columns.Add(o => o.NomeCurso)
                .Titled(Resources.Mensagem.curso)
                .ThenSortByDescending(o => o.NomeCurso)
                .Filterable(true);

        /* Adding not mapped column, that renders body, using inline Razor html helper */
        columns.Add()
                .Titled(Resources.Mensagem.editar)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = o.IdTurma }, new { @class = "modal-link" }));

        columns.Add()
                .Titled(Resources.Mensagem.detalhes)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = o.IdTurma }, new { @class = "modal-link" }));

        columns.Add()
                .Titled(Resources.Mensagem.remover)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id = o.IdTurma }, new { @class = "modal-link" }));

    }).WithPaging(5).Sortable().ToHtmlString()%>

</div>

</asp:Content>
