﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.ClasseDiagnosticoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.classe_diagnostico %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2> <%: Resources.Mensagem.classe_diagnostico %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create")%>
</p>

<%@ Import Namespace="GridMvc.Html" %>
<%@ Import Namespace="GridMvc.Sorting" %>

<div class="box-content">

<%= Html.Grid(Model).Columns(columns =>
    {

        columns.Add(o => o.DescricaoDominioDiagnostico)
        .Titled(Resources.Mensagem.descricao_dominio_diagnostico)
        .ThenSortByDescending(o => o.DescricaoDominioDiagnostico)
        .Filterable(true);
        
        /* Adding "CompanyName" column: */
        columns.Add(o => o.DescricaoClasseDiagnostico)
                .Titled(Resources.Mensagem.descricao_classe_diagnostico)
                .ThenSortByDescending(o => o.DescricaoClasseDiagnostico)
                .Filterable(true);

        /* Adding not mapped column, that renders body, using inline Razor html helper */
        columns.Add()
                .Titled(Resources.Mensagem.editar)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = o.IdClasseDiagnostico }, new { @class = "modal-link" }));

        columns.Add()
                .Titled(Resources.Mensagem.detalhes)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = o.IdClasseDiagnostico }, new { @class = "modal-link" }));

        columns.Add()
                .Titled(Resources.Mensagem.remover)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id = o.IdClasseDiagnostico }, new { @class = "modal-link" }));

    }).WithPaging(5).Sortable().ToHtmlString()%>

</div>

</asp:Content>
