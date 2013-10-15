<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.BebidaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.bebida %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.bebida %></h2>

<p>
    <%: Html.ActionLink( Resources.Mensagem.criar , "Create")%>
</p>

<link href="../../Content/Gridmvc.css" rel="stylesheet" />
<!--link href="../../Content/themes/pv/css/bootstrap.min.css" rel="stylesheet" /-->
<script src="../../Scripts/jquery-1.9.1.js" type="text/javascript"></script>
<script src="../../Scripts/gridmvc.min.js" type="text/javascript"></script>


<%@ Import Namespace="GridMvc.Html" %>
<%@ Import Namespace="GridMvc.Sorting" %>

<div class="box-content"> <table class="table table-bordered table-striped">

<%= Html.Grid(Model).Columns(columns =>
    {
        
        /* Adding "OrderID" column: 
        columns.Add(o => o.OrderID)
                .Titled("Number")
                .SetWidth(100);

        /* Adding "OrderDate" column: 
        columns.Add(o => o.OrderDate, "OrderCustomDate")
                .Titled("Date")
                .SortInitialDirection(GridSortDirection.Descending)
                .Format("{0:dd/MM/yyyy}")
                .SetWidth(110);

        /* Adding "CompanyName" column: */
        columns.Add(o => o.Nome)
                .Titled(Resources.Mensagem.bebida)
                .ThenSortByDescending(o => o.Nome)
                .SetWidth(0)
                .SetFilterWidgetType("CustomCompanyNameFilterWidget");

        /* Adding not mapped column, that renders body, using inline Razor html helper */
        columns.Add()
                .Titled(Resources.Mensagem.editar)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = o.IdBebida }, new { @class = "modal-link" }));

        columns.Add()
                .Titled(Resources.Mensagem.detalhes)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = o.IdBebida }, new { @class = "modal-link" }));

        columns.Add()
                .Titled(Resources.Mensagem.remover)
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id = o.IdBebida }, new { @class = "modal-link" }));
                
    }).WithPaging(5).Sortable(true).Filterable(true).WithMultipleFilters().ToHtmlString()%>


</table></div>

<!--%= Html.Grid(Model).Columns(columns =>
    {
        /* Adding not mapped column, that renders body, using inline Razor html helper */
        columns.Add()
                .Encoded(false)
                .Sanitized(false)
                .SetWidth(30)
                .RenderValueAs(o => Html.ActionLink("Edit", "Edit", new { id = o.IdBebida }));

        /* Adding "OrderID" column: 
        columns.Add(o => o.IdBebida)
                .Titled("Number")
                .SetWidth(100);

        /* Adding "OrderDate" column: *
        columns.Add(o => o.OrderDate, "OrderCustomDate")
                .Titled("Date")
                .SortInitialDirection(GridSortDirection.Descending)
                .Format("{0:dd/MM/yyyy}")
                .SetWidth(110);
                
        /* Adding "CompanyName" column: */
        columns.Add(o => o.Nome)
                .Titled(Resources.Mensagem.bebida)
                .SetWidth(50)
                .ThenSortByDescending(o => o.Nome);

    }).WithPaging(5).Sortable().Filterable().ToHtmlString() %-->



<!-- div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
            < %: Resources.Mensagem.bebida %>
        </th>
        <th style="width:270px;">< %: Resources.Mensagem.opcoes %></th>
    </tr>

< % foreach (var item in Model) { %>
    <tr>
        <td>
            < %: Html.DisplayFor(modelItem => item.Nome) %>
        </td>
        <td>
            < %: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id=item.IdBebida }) %> |
            < %: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = item.IdBebida })%> |
            < %: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id = item.IdBebida })%>
        </td>
    </tr>
< % } %>

</table></div-->

</asp:Content>
