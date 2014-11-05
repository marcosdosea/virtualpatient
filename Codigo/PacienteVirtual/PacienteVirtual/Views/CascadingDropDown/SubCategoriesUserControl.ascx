<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ProductCatalog>" %>

<% if (Model.SubCategories != null && Model.SubCategories.Count() > 0)
{ %>
    <% using (Ajax.BeginForm("SelectSubCategory", "CascadingDropDown", new AjaxOptions { UpdateTargetId = "Products" }))
    { %>
    <%: Html.HiddenFor(m => m.SelectedCategoryId) %>
    <%: Html.DropDownListFor(m => m.SelectedSubCategoryId, new SelectList(Model.SubCategories, "Id", "Name"), string.Empty) %>
    <% } %>
<% } %>
<script type="text/javascript">
    $('#SelectedSubCategoryId').change(function () {
        $(this).parents('form').submit();
    });   
</script>
