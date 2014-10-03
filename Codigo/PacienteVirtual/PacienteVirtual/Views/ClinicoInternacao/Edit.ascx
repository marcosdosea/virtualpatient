<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ClinicoInternacaoModel>" %>
<% Html.BeginForm("Edit", "ClinicoInternacao");%>
<% using (Html.BeginForm())
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.clinico_internacao %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaFixo) %>
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Clinica) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Clinica, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.Clinica, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Leito)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Leito, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.Leito, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DiagnosticoMedico)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.DiagnosticoMedico, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.DiagnosticoMedico, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.MotivoInternacao)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.MotivoInternacao, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.MotivoInternacao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DataAdmissao) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.DataAdmissao, new {  @Value = (String.Format("{0:dd/MM/yyyy}", Model.DataAdmissao)), type = "text", @class = "calendario" , style = "width:176px;"}) %>
                <%: Html.ValidationMessageFor(model => model.DataAdmissao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span4">
            <div class="editor-label">
                <%: Html.EditorFor(model => model.UsoMarcaPasso) %>
                <%: Resources.Mensagem.uso_marca_passo %>
                <%: Html.ValidationMessageFor(model => model.UsoMarcaPasso, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span4">
            <div class="editor-label">
                <%: Html.EditorFor(model => model.UsoNaoSeAplica) %>
                <%: Resources.Mensagem.uso_nao_aplica %>
                <%: Html.ValidationMessageFor(model => model.UsoNaoSeAplica, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span4">
            <div class="editor-label">
                <%: Html.EditorFor(model => model.UsoOutros) %>
                <%: Resources.Mensagem.uso_outros %>
                <%: Html.ValidationMessageFor(model => model.UsoOutros, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.UsoOutrosDescricao) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.UsoOutrosDescricao, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.UsoOutrosDescricao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
<% Html.EndForm();%>