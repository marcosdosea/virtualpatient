<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ProductCatalog>" %>

<% using (Ajax.BeginForm("SelectCategory", "CascadingDropDown", new AjaxOptions { UpdateTargetId = "SubCategories" }))
{ %>
    <%: Html.DropDownListFor(m => m.SelectedDominioId, new SelectList(Model.Dominio, "IdDominioDiagnostico", "DescricaoDominioDiagnostico"), Resources.Mensagem.selecione)%>
<% } %>
<script type="text/javascript">
    $('#SelectedDominioId').change(function () {
        $("#Products").find('option:first').attr('selected', 'selected');
    });
    $('#SelectedDominioId').change(function () {
        $(this).parents('form').submit();
    });
</script>