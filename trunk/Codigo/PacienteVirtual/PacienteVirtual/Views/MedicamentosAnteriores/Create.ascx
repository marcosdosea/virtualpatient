<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.MedicamentosAnterioresModel>" %>

<script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm("Create", "MedicamentosAnteriores")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>MedicamentosAnterioresModel</legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
<div class="row-fluid">
    <div class="span2">
        <div class="editor-label">
            <%: Html.LabelFor(model => model.MedicamentoNome) %>
        </div>
    </div>
    <div class="span6">
        <div class="editor-field">
            <%: Html.DropDownList("IdMedicamento", Resources.Mensagem.selecione)%>
            <%: Html.ValidationMessageFor(model => model.IdMedicamento) %>
        </div>
    </div>
</div>
<div class="row-fluid">
    <div class="span2">
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Indicacao) %>
        </div>
    </div>
    <div class="span6">
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Indicacao, new { @class = "textbox", style = "width:276px;" })%>
            <%: Html.ValidationMessageFor(model => model.Indicacao) %>
        </div>
    </div>
</div>
<div class="row-fluid">
    <div class="span2">
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Resposta) %>
        </div>
    </div>
    <div class="span6">
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Resposta, new { @class = "textbox", style = "width:276px;" })%>
            <%: Html.ValidationMessageFor(model => model.Resposta) %>
        </div>
    </div>
</div>
<div class="row-fluid">
    <div class="span2">
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Periodo) %>
        </div>
    </div>
    <div class="span6">
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Periodo, new { @class = "textbox", style = "width:276px;" })%>
            <%: Html.ValidationMessageFor(model => model.Periodo) %>
        </div>
    </div>
</div>
<div class="form-actions">
    <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
</div>
    </fieldset>
<% } %>
