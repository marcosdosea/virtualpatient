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
            <%: Html.TextAreaFor(model => model.RelatoTextual, new { @cols = "100", @rows = "50" }) %>
            <%: Html.ValidationMessageFor(model => model.RelatoTextual) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>
