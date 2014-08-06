<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.ConsultaVariavelModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.corrigir_consultas %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.corrigir_consultas %></h2>

<%@ Import Namespace="GridMvc.Html" %>
<%@ Import Namespace="GridMvc.Sorting" %>

<div class="box-content">

<%= Html.Grid(Model).Columns(columns =>
    {

        /* Adding "CompanyName" column: */
        columns.Add(o => o.NomePaciente)
                .Titled(Resources.Mensagem.paciente);

        columns.Add(o => o.NomePessoa)
            .Titled(Resources.Mensagem.usuario)
            .ThenSortByDescending(o => o.NomePessoa)
            .Filterable(true);

        columns.Add(o => o.OrdemCronologica)
            .Titled(Resources.Mensagem.ordem_cronologica)
            .ThenSortByDescending(o => o.OrdemCronologica)
            .Filterable(true);

        columns.Add(o => o.NivelDificuldade)
            .Titled(Resources.Mensagem.nivel_dificuldade)
            .ThenSortByDescending(o => o.NivelDificuldade)
            .Filterable(true);

        columns.Add(o => o.DescricaoEstadoConsulta)
            .Titled(Resources.Mensagem.status_preenchimento)
            .ThenSortByDescending(o => o.DescricaoEstadoConsulta)
            .Filterable(true);

        columns.Add(o => o.NomeTurma)
            .Titled(Resources.Mensagem.turma)
            .ThenSortByDescending(o => o.NomeTurma)
            .Filterable(true);

        columns.Add()
                .Titled(Resources.Mensagem.opcoes)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.corrigir, "Edit", "Consulta", new { idConsultaVariavel = o.IdConsultaVariavel }, 
                    new { @style = "color:blue; font-size:small;" }));

        
    }).WithPaging(5).Sortable().ToHtmlString()%>

</div>

</asp:Content>
