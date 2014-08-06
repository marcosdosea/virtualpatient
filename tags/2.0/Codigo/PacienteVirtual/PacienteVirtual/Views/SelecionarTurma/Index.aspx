<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.TurmaPessoaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.selecionar_turma %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.selecionar_turma %> </h2>

<%@ Import Namespace="GridMvc.Html" %>
<%@ Import Namespace="GridMvc.Sorting" %>

<div class="box-content">

<%= Html.Grid(Model).Columns(columns =>
    {
        /* Adding "CompanyName" column: */
        columns.Add(o => o.Instituicao)
                .Titled(Resources.Mensagem.instituicao)
                .ThenSortByDescending(o => o.Instituicao)
                .Filterable(true);

        columns.Add(o => o.Curso)
                .Titled(Resources.Mensagem.curso)
                .ThenSortByDescending(o => o.Curso)
                .Filterable(true);

        columns.Add(o => o.Disciplina)
                .Titled(Resources.Mensagem.disciplina)
                .ThenSortByDescending(o => o.Disciplina)
                .Filterable(true);

        columns.Add(o => o.NomeTurma)
                .Titled(Resources.Mensagem.codigo)
                .ThenSortByDescending(o => o.NomeTurma)
                .Filterable(true);

        columns.Add(o => o.Periodo)
                .Titled(Resources.Mensagem.periodo)
                .ThenSortByDescending(o => o.Periodo)
                .Filterable(true);

        columns.Add(o => o.NomeRole)
                .Titled(Resources.Mensagem.perfil)
                .ThenSortByDescending(o => o.NomeRole)
                .Filterable(true);

        /* Adding not mapped column, that renders body, using inline Razor html helper */
        columns.Add()
                .Titled(Resources.Mensagem.selecionar_turma)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.selecione, "Create", "SelecionarTurma", new { id = o.IdTurma }, null));

    }).WithPaging(5).Sortable().ToHtmlString()%>

</div>

<!--% using (Html.BeginForm("Create", "SelecionarTurma")) { %>
    < %: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>< %: Resources.Mensagem.selecione %></legend>
        <div class="editor-label">
            < %: Html.LabelFor(model => model.NomeTurma) %>
        </div>
        <div class="editor-field">
            < %: Html.DropDownList("IdTurma", null, Resources.Mensagem.selecione, new { style = "width:500px;" })%>
            < %: Html.ValidationMessageFor(model => model.IdTurma) %>
        </div>
        <-- botao salvar>
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="< %: Resources.Mensagem.selecionar_turma %>" />
        </div>
    </fieldset>
< % } %-->

</asp:Content>
