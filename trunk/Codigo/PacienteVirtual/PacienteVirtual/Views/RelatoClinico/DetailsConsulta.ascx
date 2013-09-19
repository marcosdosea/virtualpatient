<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.RelatoClinicoModel>" %>

<% using (Html.BeginForm())
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.relato_clinico %></legend>
    <div class="thumbnail center">
        <iframe width="435px" height="425px" src="http://www.youtube.com/embed/f9EkBo8Wdkg">
        </iframe>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.RelatoTextual) %>
    </div>
    <div class="editor-field">
        <%: Html.ValidationMessageFor(model => model.RelatoTextual) %>
        <%: Html.TextAreaFor(model => model.RelatoTextual, new { @class = "span4", @cols = "40", @rows = "28", @readonly = "true", style = "background-color:#fff;" })%>
    </div>
    <!--div class="form-actions">
        <input class="btn btn-primary" type="submit" value="< %: Resources.Mensagem.salvar %>" />
    </div-->
</fieldset>
<% } %>
