<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.PrescricaoEnfermagemModel>" %>
<%@ Import Namespace = "PacienteVirtual.Helpers" %>
<% using (Html.BeginForm("Adicionar", "PrescricaoEnfermagem"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <%: Html.HiddenFor(model => model.IdPrescricaoEnfermagem) %>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <%: Html.HiddenFor(model => model.IdDiagnostico) %>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.Label(Resources.Mensagem.prescricao_enfermagem) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.DescricaoPrescricao, new { style = "width:285px;" })%>
                <%: Html.ValidationMessageFor(model => model.DescricaoPrescricao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.Label(Resources.Mensagem.horarios) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Horario, new { style = "width:128px;" })%>
                <%: Html.ValidationMessageFor(model => model.Horario, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <br />
        <br />
        <div class="span3">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
        </div>
    </div>
</fieldset>
<div class="styleValidation">
    <%: Html.QuebraLinhaFor(model => model.ErroPrescricao) %>
</div>
<% } %>
