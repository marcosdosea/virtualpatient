<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.RelatoClinicoModel>" %>

<script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.relato_clinico %></legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.RelatoTextual) %>
        </div>
        <div class="editor-field">
          <%: Html.ValidationMessageFor(model => model.RelatoTextual) %>
            <%: Html.TextAreaFor(model => model.RelatoTextual, new {@class="span4", @cols = "100", @rows = "50" }) %>
        </div>

        <p>
            <input type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
</div>
