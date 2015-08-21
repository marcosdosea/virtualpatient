<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.AntecedentesFamiliaresModel>" %>
<%@ Import Namespace = "PacienteVirtual.Helpers" %>

<% using (Html.BeginForm("AdicionarAntecedentesFamiliares", "ClinicoInternacao"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <%: Html.HiddenFor(model => model.IdConsultaFixo) %>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Patologia) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdPatologia", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdPatologia, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span4">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
        </div>
    </div> 
</fieldset>
<div class="styleValidation">
    <%: Html.QuebraLinhaFor(model => model.ErroAntecedentesFamiliares)%>
</div>
<% } %>
