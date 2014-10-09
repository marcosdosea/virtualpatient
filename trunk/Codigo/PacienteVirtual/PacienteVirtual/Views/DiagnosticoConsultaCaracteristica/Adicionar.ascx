<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DiagnosticoConsultaCaracteristicaModel>" %>
<%@ Import Namespace = "PacienteVirtual.Helpers" %>
<% using (Html.BeginForm("Adicionar", "DiagnosticoConsultaCaracteristica"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <%: Html.HiddenFor(model => model.IdDiagnostico) %>
    <div class="row-fluid">
        <div class="span9">
            <div class="editor-label">
                <%: Html.Label(Resources.Mensagem.caracteristicas_definidoras) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdDiagnosticoCaracteristica", null, Resources.Mensagem.selecione, new { style = "width:576px;" })%>
                <%: Html.ValidationMessageFor(model => model.IdDiagnosticoCaracteristica, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span9"></div>
        <div class="span2">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
        </div>
    </div>
</fieldset>
<div class="styleValidation">
    <%: Html.QuebraLinhaFor(model => model.ErroCaracteristica) %>
</div>
<% } %>
