<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DiarioPessoalModel>" %>

<h1>
    <%:  ViewBag.situacao %></h1>
<% using (Html.BeginForm())
   { %>
<%: Html.ValidationSummary(true) %>

<fieldset>
    <legend>
        <%: Resources.Mensagem.diario_pessoal %></legend>
    <div class="editor-label">
        <!--%: Html.LabelFor(model => model.IdConsultaFixo) %-->
    </div>
    <div class="editor-field">
        <%: Html.HiddenFor(model => model.IdConsultaFixo) %>
        <%: Html.ValidationMessageFor(model => model.IdConsultaFixo) %>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.IdMedicamento) %>
    </div>
    <div class="editor-field">
        <%: Html.DropDownList("IdMedicamento", Resources.Mensagem.selecione)%>
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
            <%: Html.EditorFor(model => model.Horario, new { @disabled = "disabled", @readonly = "readonly", @class="timepicker-2" })%>
            <span class="add-on"><i class="icon-time"></i></span>
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
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
