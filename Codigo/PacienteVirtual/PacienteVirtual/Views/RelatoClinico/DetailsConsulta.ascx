<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.RelatoClinicoModel>" %>

<% using (Html.BeginForm())
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.relato_clinico %></legend>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.RelatoTextual) %>
    </div>
    <div class="editor-field">
        <%: Html.ValidationMessageFor(model => model.RelatoTextual, string.Empty, new { @class = "styleValidation" })%>
        <%: Html.TextAreaFor(model => model.RelatoTextual, new { @class = "span5", @cols = "40", @rows = "25", @readonly = "true", style = "background-color:#fff;"})%>
    </div>
    <div class="thumbnail center">
        <iframe width="435px" height="425px" src="http://www.youtube.com/embed/f9EkBo8Wdkg">
        </iframe>
    </div>
    
</fieldset>
<% } %>
