<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ProductCatalog>" %>

<% using (Ajax.BeginForm("SelectSubCategory", "CascadingDropDown", new AjaxOptions { UpdateTargetId = "Products" }))
{ %>
<%: Html.HiddenFor(m => m.SelectedDominioId) %>
<%: Html.DropDownListFor(m => m.SelectedClasseDominioId, new SelectList(Model.ClasseDominio, "IdClasseDiagnostico", "DescricaoClasseDiagnostico"), Resources.Mensagem.selecione)%>
<% } %>
<script type="text/javascript">
    $('#SelectedClasseDominioId').change(function () {
        $(this).parents('form').submit();
    }); 
</script>
