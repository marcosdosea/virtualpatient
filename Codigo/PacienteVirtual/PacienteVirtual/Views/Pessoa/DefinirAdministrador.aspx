<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.TurmaPessoaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.definir_administrador %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.definir_administrador %></h2>

<%@ Import Namespace="GridMvc.Html" %>
<%@ Import Namespace="GridMvc.Sorting" %>

<div id="minhaBarra">
<div class="box-content">
<%= Html.Grid(Model).Columns(columns =>
    {
        
        columns.Add(o => o.NomePessoa)
                .Titled(Resources.Mensagem.nome_pessoa)
                .ThenSortByDescending(o => o.NomePessoa)
                .Filterable(true);

        columns.Add(o => o.NomeRole)
                .Titled(Resources.Mensagem.perfil)
                .ThenSortByDescending(o => o.NomeRole)
                .Filterable(true);

        columns.Add(o => o.NomeTurma)
                .Titled(Resources.Mensagem.turma)
                .ThenSortByDescending(o => o.NomeTurma)
                .Filterable(true);

        columns.Add(o => o.Curso)
                .Titled(Resources.Mensagem.curso)
                .ThenSortByDescending(o => o.Curso)
                .Filterable(true);
        
        columns.Add()
                .Titled(Resources.Mensagem.definir_adm_enfermagem)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.definir, "DefinirAdmEnfermagem", new { idPessoa = o.IdPessoa, idTurma = o.IdTurma }, new { @class = "modal-link" }));

        columns.Add()
                .Titled(Resources.Mensagem.definir_adm_farmacia)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.definir, "DefinirAdmFarmacia", new { idPessoa = o.IdPessoa, idTurma = o.IdTurma }, new { @class = "modal-link" }));

    }).WithPaging(5).Sortable().ToHtmlString()%>

</div>
</div>
</asp:Content>
