<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.MedicamentoPrescritoModel>" %>
<% using (Html.BeginForm("Create", "MedicamentoPrescrito"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.medicamento_prescrito %></legend>
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
                <%: Html.ValidationMessageFor(model => model.IdMedicamento, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Fitoterapico) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Fitoterapico) %>
                <%: Html.ValidationMessageFor(model => model.Fitoterapico, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Dosagem) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Dosagem, new { @class = "textbox", style = "width:276px;" })%>
                <%: Html.ValidationMessageFor(model => model.Dosagem, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Posologia) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Posologia, new { @class = "textbox", style = "width:276px;", MaxLength = 100 })%>
                <%: Html.ValidationMessageFor(model => model.Posologia, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Prescritor) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Prescritor, new { @class = "textbox", style = "width:276px;" })%>
                <%: Html.ValidationMessageFor(model => model.Prescritor, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Especialidade) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Especialidade, new { @class = "textbox", style = "width:276px;" })%>
                <%: Html.ValidationMessageFor(model => model.Especialidade, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
    </div> 
</fieldset>
<div class="span5">
    <%: Html.ValidationMessageFor(model => model.ErroMedPresc, string.Empty, new { @class = "styleValidation" })%>
</div>
<% } %>
