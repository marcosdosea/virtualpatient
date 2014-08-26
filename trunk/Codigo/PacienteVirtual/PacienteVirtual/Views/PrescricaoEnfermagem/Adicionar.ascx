<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.PrescricaoEnfermagemModel>" %>
<% using (Html.BeginForm("Adicionar", "PrescricaoEnfermagem"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.resultados_esperados %></legend>
    <%: Html.HiddenFor(model => model.IdPrescricaoEnfermagem) %>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <%: Html.HiddenFor(model => model.IdDiagnostico) %>
    <div class="row-fluid">
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoPrescricao) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.DescricaoPrescricao, new { style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.DescricaoPrescricao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Horario) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Horario)%>
                <%: Html.ValidationMessageFor(model => model.Horario, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
    </div>
</fieldset>
<% } %>
