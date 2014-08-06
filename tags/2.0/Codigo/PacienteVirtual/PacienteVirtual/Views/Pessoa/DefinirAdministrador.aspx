<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.PessoaModel>>" %>

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
        
        columns.Add(o => o.Nome)
                .Titled(Resources.Mensagem.nome)
                .ThenSortByDescending(o => o.Nome)
                .Filterable(true);

        columns.Add(o => o.UserName)
                .Titled(Resources.Mensagem.nome_usuario)
                .ThenSortByDescending(o => o.UserName)
                .Filterable(true);

        columns.Add(o => o.Cpf)
                .Titled(Resources.Mensagem.cpf)
                .ThenSortByDescending(o => o.Cpf)
                .Filterable(true);

        columns.Add()
                .Titled(Resources.Mensagem.definir_adm_enfermagem)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.definir, "DefinirAdmEnfermagem", new { idPessoa = o.IdPessoa }, new { @class = "modal-link" }));

        columns.Add()
                .Titled(Resources.Mensagem.definir_adm_farmacia)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.definir, "DefinirAdmFarmacia", new { idPessoa = o.IdPessoa }, new { @class = "modal-link" }));

    }).WithPaging(5).Sortable().ToHtmlString()%>

</div>
</div>
</asp:Content>
