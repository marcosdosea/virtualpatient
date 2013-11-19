<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.Turma.TurmaPessoaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.ativar_tutor_turma %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <div class="span9">
        <h2> <%: Resources.Mensagem.ativar_tutor_turma %>
            </h2>
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

        columns.Add(o => o.Ativa)
                .Titled(Resources.Mensagem.status)
                .ThenSortByDescending(o => o.Ativa)
                .Filterable(true)
                .SetWidth(230)
                .RenderValueAs(o => o.Ativa == true ? Resources.Mensagem.ativa : Resources.Mensagem.desativa);
        
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

    </form>
</asp:Content>
