<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.TurmaPessoaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.atribuir %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Resources.Mensagem.atribuir %></h2>
    <div class="span9">
        <% using (Html.BeginForm("Atribuir", "RelatoClinico", FormMethod.Post, null))
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
                .Titled(Resources.Mensagem.nome_pessoa)
                .ThenSortByDescending(o => o.NomePessoa)
                .Filterable(true);

        columns.Add(o => o.NomeRole)
                .Titled(Resources.Mensagem.perfil)
                .ThenSortByDescending(o => o.NomeRole)
                .Filterable(true);

        /* Adding not mapped column, that renders body, using inline Razor html helper */
        columns.Add()
                .Titled(Resources.Mensagem.selecione)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.CheckBox("checked", false));

        columns.Add()
                .Titled(Resources.Mensagem.atribuir)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.atribuir, "AtribuirRelato", "RelatoClinico", new { idTurma = o.IdTurma, idPessoa = o.IdPessoa }, new { onclick = "alert('O aluno foi atribuído a Consulta.')" }));
                
    }).WithPaging(5).Sortable().ToHtmlString()%>
    </div>

</asp:Content>
