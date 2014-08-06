<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.PercepcaoExpectativasModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<%@ Import Namespace="PacienteVirtual.Models" %>

<% using (Html.BeginForm("Edit", "PercepcaoExpectativas"))
   { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.percepcao_expectativas_paciente %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>

        <div class="row-fluid">
        <div class="span10">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.quantoDoenca) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.quantoDoenca, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.quantoDoenca, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span10">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.duvidasQuestionamentos)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.duvidasQuestionamentos, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.duvidasQuestionamentos, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>

<% } %>

