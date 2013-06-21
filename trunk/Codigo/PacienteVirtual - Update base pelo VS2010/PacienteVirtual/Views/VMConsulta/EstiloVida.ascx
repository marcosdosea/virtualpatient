<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.EstiloVidaModel>" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<% using (Html.BeginForm())
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>EstiloVidaE</legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.TabacoConsumo) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.TabacoConsumo) %>
        <%: Html.ValidationMessageFor(model => model.TabacoConsumo) %>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.TabacoUso) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.TabacoUso) %>
        <%: Html.ValidationMessageFor(model => model.TabacoUso) %>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.TabacoParou) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.TabacoParou) %>
        <%: Html.ValidationMessageFor(model => model.TabacoParou) %>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.CafeConsumo) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.CafeConsumo) %>
        <%: Html.ValidationMessageFor(model => model.CafeConsumo) %>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.CafeUso) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.CafeUso) %>
        <%: Html.ValidationMessageFor(model => model.CafeUso) %>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.CafeParou) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.CafeParou) %>
        <%: Html.ValidationMessageFor(model => model.CafeParou) %>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.AlcoolConsumo) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.AlcoolConsumo) %>
        <%: Html.ValidationMessageFor(model => model.AlcoolConsumo) %>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.AlcoolUso) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.AlcoolUso) %>
        <%: Html.ValidationMessageFor(model => model.AlcoolUso) %>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.AlcoolTipoBebida) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.AlcoolTipoBebida) %>
        <%: Html.ValidationMessageFor(model => model.AlcoolTipoBebida) %>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.AlcoolParou) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.AlcoolParou) %>
        <%: Html.ValidationMessageFor(model => model.AlcoolParou) %>
    </div>
    <div class="form-actions">
        <input class="btn" type="submit" value="Salvar" />
    </div>
</fieldset>
<% } %>
