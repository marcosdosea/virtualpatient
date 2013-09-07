﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.HistoriaModel>" %>

<script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm("Edit", "Historia"))
   { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>HistoriaModel</legend>

        <div class="editor-label">
            <%: Html.HiddenFor(model => model.IdConsultaFixo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.HistoriaMedicaPregressa) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.HistoriaMedicaPregressa) %>
            <%: Html.ValidationMessageFor(model => model.HistoriaMedicaPregressa) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.HistoriaFamiliar) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.HistoriaFamiliar) %>
            <%: Html.ValidationMessageFor(model => model.HistoriaFamiliar) %>
        </div>

        <div class="form-actions">
    <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
</div>
    </fieldset>
<% } %>
