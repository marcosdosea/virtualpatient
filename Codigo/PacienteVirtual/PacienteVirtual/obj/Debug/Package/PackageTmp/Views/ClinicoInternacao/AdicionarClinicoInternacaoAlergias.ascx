<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ClinicoInternacaoAlergiasModel>" %>
<%@ Import Namespace = "PacienteVirtual.Helpers" %>

<% using (Html.BeginForm("AdicionarClinicoInternacaoAlergias", "ClinicoInternacao"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <%: Html.HiddenFor(model => model.IdConsultaFixo) %>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Alergia) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdAlergia", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdAlergia, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span4">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
        </div>
    </div> 
</fieldset>
<div class="styleValidation">
    <%: Html.QuebraLinhaFor(model => model.ErroAlergias)%>
</div>
<% } %>
