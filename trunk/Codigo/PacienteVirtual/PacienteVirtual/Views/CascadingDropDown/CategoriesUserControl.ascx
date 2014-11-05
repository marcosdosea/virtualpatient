<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ProductCatalog>" %>

<% using (Ajax.BeginForm("SelectCategory", "CascadingDropDown", new AjaxOptions { UpdateTargetId = "SubCategories" }))
{ %>
    <%: Html.DropDownListFor(m => m.SelectedCategoryId, new SelectList(Model.Categories, "Id", "Name"), string.Empty) %>
<% } %>
<script type="text/javascript">
    $('#SelectedCategoryId').change(function () {
        $(this).parents('form').submit();
    });
</script>