<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DiagnosticoConsultaFatorModel>" %>
<%@ Import Namespace = "PacienteVirtual.Helpers" %>
<% using (Html.BeginForm("Adicionar", "DiagnosticoConsultaFator"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend><%: Resources.Mensagem.adicionar_fator_diagnostico %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <%: Html.HiddenFor(model => model.IdDiagnostico) %>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoFatorDiagnostico) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdDiagnosticoFator", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdDiagnosticoFator, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
        </div>
    </div>
</fieldset>
<% } %>
