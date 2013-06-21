<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DiarioPessoalModel>" %>

<script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>DiarioPessoalModel</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdConsultaFixo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdConsultaFixo) %>
            <%: Html.ValidationMessageFor(model => model.IdConsultaFixo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdMedicamento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdMedicamento) %>
            <%: Html.ValidationMessageFor(model => model.IdMedicamento) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Periodo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Periodo) %>
            <%: Html.ValidationMessageFor(model => model.Periodo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Horario) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Horario) %>
            <%: Html.ValidationMessageFor(model => model.Horario) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Quantidade) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Quantidade) %>
            <%: Html.ValidationMessageFor(model => model.Quantidade) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.TipoBebida) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.TipoBebida) %>
            <%: Html.ValidationMessageFor(model => model.TipoBebida) %>
        </div>
    <div class="form-actions">
        <input class="btn" type="submit" value="Salvar" />
    </div>
    </fieldset>
<% } %>
