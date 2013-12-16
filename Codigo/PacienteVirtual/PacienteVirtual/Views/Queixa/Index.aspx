<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.QueixaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.queixa %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.queixa %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
</p>

<%@ Import Namespace="GridMvc.Html" %>
<%@ Import Namespace="GridMvc.Sorting" %>

<div class="box-content">

<%= Html.Grid(Model).Columns(columns =>
    {
        
        /* Adding "CompanyName" column: */
        columns.Add(o => o.DescricaoQueixa)
                .Titled(Resources.Mensagem.alternativas_intervencao)
                .ThenSortByDescending(o => o.DescricaoQueixa)
                .Filterable(true);

        /* Adding "CompanyName" column: */
        columns.Add(o => o.NomeSistema)
                .Titled(Resources.Mensagem.nome_sistema)
                .ThenSortByDescending(o => o.NomeSistema)
                .Filterable(true);

        /* Adding not mapped column, that renders body, using inline Razor html helper */
        columns.Add()
                .Titled(Resources.Mensagem.editar)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = o.IdQueixa }, new { @class = "modal-link" }));

        columns.Add()
                .Titled(Resources.Mensagem.detalhes)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = o.IdQueixa }, new { @class = "modal-link" }));

        columns.Add()
                .Titled(Resources.Mensagem.remover)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id = o.IdQueixa }, new { @class = "modal-link" }));

    }).WithPaging(5).Sortable().ToHtmlString()%>

</div>

</asp:Content>
