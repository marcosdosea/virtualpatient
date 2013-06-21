<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.QueixaModel>" %>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.queixa %></legend>

        <%: Html.HiddenFor(model => model.IdQueixa) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DescricaoQueixa) %>
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.DescricaoQueixa, new { @class="span4", @cols = "15", @rows = "5" })%>
            <%: Html.ValidationMessageFor(model => model.DescricaoQueixa) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeSistema) %>
        </div>
        <div class="editor-field">
            <%= Html.DropDownList("IdSistema", Resources.Mensagem.selecione)%>
            <%: Html.ValidationMessageFor(model => model.IdSistema) %>
        </div>

    <div class="form-actions">
        <input class="btn" type="submit" value="Salvar" />
    </div>
    </fieldset>
<% } %>

