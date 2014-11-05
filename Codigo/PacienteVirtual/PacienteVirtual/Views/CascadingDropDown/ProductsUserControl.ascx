<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ProductCatalog>" %>

<% if (Model.Products != null && Model.Products.Count() > 0)
{ %>
    <%: Html.DropDownList("Products", new SelectList(Model.Products, "Id", "Name"), string.Empty) %>
<% } %>