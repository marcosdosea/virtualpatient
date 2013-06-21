<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.RelatoClinicoModel>" %>

<script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>RelatoClinicoModel</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.RelatoTextual) %>
        </div>
        <div class="editor-field">
          <%: Html.ValidationMessageFor(model => model.RelatoTextual) %>
            <%: Html.TextAreaFor(model => model.RelatoTextual, new {@class="span4", @cols = "40", @rows = "28" }) %>
        </div>
         <div class="form-actions">
            <input class="btn"type="submit" value="Salvar" />
        </div>
    </fieldset>
<% } %>
