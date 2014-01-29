<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.TurmaPessoaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.ativar_matriculas_turma %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
            <%: Resources.Mensagem.ativar_matriculas_turma%></h2>
    <% if (ViewBag.SelecionaTurma == true)
       { %>
    <div class="span9">
        <% using (Html.BeginForm("Index", "AtivarMatriculasTurma", FormMethod.Post, null))
           { %>
        <%: Html.DropDownList("IdTurma", null, Resources.Mensagem.listar_todos, new { onchange = "this.form.submit();" })%>
        <% } %>
    </div>
    <% } %>
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

        columns.Add(o => o.NomeTurma)
                .Titled(Resources.Mensagem.turma)
                .ThenSortByDescending(o => o.NomeTurma)
                .Filterable(true);

        columns.Add(o => o.NomeRole)
                .Titled(Resources.Mensagem.perfil)
                .ThenSortByDescending(o => o.NomeRole)
                .Filterable(true);
        
        columns.Add(o => o.Ativa)
                .Titled(Resources.Mensagem.status)
                .ThenSortByDescending(o => o.Ativa)
                .Filterable(true)
                .SetWidth(230)
                .RenderValueAs(o => o.Ativa == true && o.IdRole == 2 ? Resources.Mensagem.ativa : Resources.Mensagem.desativa);
        
        /* Adding not mapped column, that renders body, using inline Razor html helper */
        columns.Add()
                .Titled(Resources.Mensagem.ativar)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.ativar, "Ativar", new { idTurma = o.IdTurma, idPessoa = o.IdPessoa }, new { onclick = "alert('Matrícula Ativada!')" }));

        
        columns.Add()
                .Titled(Resources.Mensagem.desativar)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.desativar, "Desativar", new { idTurma = o.IdTurma, idPessoa = o.IdPessoa }, new { onclick = "alert('Matrícula Desativada!')" }));

        
    }).WithPaging(5).Sortable().ToHtmlString()%>
    </div>
    <div class="box-content">
        <style type="text/css">
            #botaopos
            {
                float: right;
            }
        </style>
        <p class="btn btn-primary" id="botaopos">
            <%: Html.ActionLink(Resources.Mensagem.ativar_desativar_todos, "AtivarDesativarTodos", null, new { @style = "color:White; font-size:small;", onclick = "alert('Todas as Matrículas foram Ativada/Desativada!')" })%>
        </p>
    </div>
</asp:Content>
