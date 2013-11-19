<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.ConsultaVariavelModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.consultas_correcao %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.consultas_correcao%></h2>

<%@ Import Namespace="GridMvc.Html" %>
<%@ Import Namespace="GridMvc.Sorting" %>

<div class="box-content">

<%= Html.Grid(Model).Columns(columns =>
    {
        
        /* Adding "CompanyName" column: */
        columns.Add(o => o.NomePessoa)
                .Titled(Resources.Mensagem.nome_pessoa)
                .ThenSortByDescending(o => o.NomePessoa)
                .Filterable(true);

        /* Adding "CompanyName" column: */
        columns.Add(o => o.NomeTurma)
                .Titled(Resources.Mensagem.turma)
                .ThenSortByDescending(o => o.NomeTurma)
                .Filterable(true);

        /* Adding "CompanyName" column: */
        columns.Add(o => o.DescricaoEstadoConsulta)
                .Titled(Resources.Mensagem.estado_preenchimento)
                .ThenSortByDescending(o => o.DescricaoEstadoConsulta)
                .Filterable(true);

        /* Adding "CompanyName" column: */
        columns.Add(o => o.NomePaciente)
                .Titled(Resources.Mensagem.paciente)
                .ThenSortByDescending(o => o.NomePaciente)
                .Filterable(true);

        /* Adding not mapped column, that renders body, using inline Razor html helper */
        columns.Add()
                .Titled(Resources.Mensagem.corrigir)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.corrigir, "Edit", null, new { @class = "modal-link" }));

        columns.Add()
                .Titled(Resources.Mensagem.remover)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.remover, "Delete", new { idConsultaVariavel = o.IdConsultaVariavel, idEstadoConsulta = o.IdEstadoConsulta }, new { @class = "modal-link" }));

    }).WithPaging(5).Sortable().ToHtmlString()%>

</div>

</asp:Content>
