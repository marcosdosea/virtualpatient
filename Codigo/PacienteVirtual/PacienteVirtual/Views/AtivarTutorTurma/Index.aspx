<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.TurmaPessoaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.ativar_tutor_turma %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2> <%: Resources.Mensagem.ativar_tutor_turma%>
            </h2>
    <div class="span9">
        <% using (Html.BeginForm("Index", "AtivarTutorTurma", FormMethod.Post, null))
           { %>
        <%: Html.DropDownList("IdTurma", null, Resources.Mensagem.listar_todos, new { onchange = "this.form.submit();" })%>
        <% } %>
    </div>
    
    <%@ import namespace="GridMvc.Html" %>
    <%@ import namespace="GridMvc.Sorting" %>
    <div class="box-content">
        <%= Html.Grid(Model).Columns(columns =>
    {
        
        /* Adding "CompanyName" column: */
        columns.Add(o => o.NomePessoa)
                .Titled(Resources.Mensagem.nome)
                .ThenSortByDescending(o => o.NomePessoa)
                .Filterable(true);

        columns.Add(o => o.Instituicao)
                .Titled(Resources.Mensagem.instituicao)
                .ThenSortByDescending(o => o.Instituicao)
                .Filterable(true);
        
        columns.Add(o => o.Curso)
                .Titled(Resources.Mensagem.curso)
                .ThenSortByDescending(o => o.Curso)
                .Filterable(true);
        
        columns.Add(o => o.NomeTurma)
                .Titled(Resources.Mensagem.turma)
                .ThenSortByDescending(o => o.NomeTurma)
                .Filterable(true);
        
        columns.Add(o => o.NomeRole)
                .Titled(Resources.Mensagem.perfil)
                .ThenSortByDescending(o => o.NomeRole)
                .Filterable(true);
        
        columns.Add(o => o.IdRole)
                .Titled(Resources.Mensagem.status)
                .ThenSortByDescending(o => o.Ativa)
                .Filterable(true)
                .SetWidth(230)
                .RenderValueAs(o => o.IdRole == 3 ? Resources.Mensagem.ativa : Resources.Mensagem.desativa);
        
        /* Adding not mapped column, that renders body, using inline Razor html helper */
        columns.Add()
                .Titled(Resources.Mensagem.ativar)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.ativar, "Ativar", new { idTurma = o.IdTurma,  idPessoa = o.IdPessoa}, new { onclick = "alert('Tutor Ativado!')" }));

        
        columns.Add()
                .Titled(Resources.Mensagem.desativar)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.desativar, "Desativar", new { idTurma = o.IdTurma, idPessoa = o.IdPessoa }, new { onclick = "alert('Tutor Desativado!')" }));

        
    }).WithPaging(5).Sortable().ToHtmlString()%>
    </div>


</asp:Content>
