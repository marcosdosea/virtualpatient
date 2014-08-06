<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.OutrasNecessidadesModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<%@ Import Namespace="PacienteVirtual.Models" %>
<% using (Html.BeginForm("Edit", "OutrasNecessidades"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.outras_necessidades %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.GrauDependencia) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.EnumDropDownListFor(model => model.GrauDependencia, ListaGrauDependencia.Independente) %>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoGrauDependencia) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.DescricaoGrauDependencia, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.DescricaoGrauDependencia, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Estilista) %>
                <%: Html.ValidationMessageFor(model => model.Estilista, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Estilista) %>
            </div>
        </div>
        <!--div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoEstilista) %>
            </div>
        </div>
        <div class="span4">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.DescricaoEstilista, new { @class = "textbox", style = "width:276px;" })%>
                <%: Html.ValidationMessageFor(model => model.DescricaoEstilista, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div-->
    </div>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Tabagista) %>
                <%: Html.ValidationMessageFor(model => model.Tabagista, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Tabagista) %>
            </div>
        </div>
        <!--div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoTabagista) %>
            </div>
        </div>
        <div class="span4">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.DescricaoTabagista, new { @class = "textbox", style = "width:276px;" })%>
                <%: Html.ValidationMessageFor(model => model.DescricaoTabagista, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div-->
    </div>
    <br />
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescreverTipoTempoQtde) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.DescreverTipoTempoQtde, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.DescreverTipoTempoQtde, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.UsoDrogasIlicitas) %>
                <%: Html.ValidationMessageFor(model => model.UsoDrogasIlicitas, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.UsoDrogasIlicitas) %>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.TipoDrogas) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.TipoDrogas, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.TipoDrogas, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.FrequenciaDrogas) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.FrequenciaDrogas, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.FrequenciaDrogas, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.TempoDrogas) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.TempoDrogas, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.TempoDrogas, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.QuantidadeDrogas) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.QuantidadeDrogas, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.QuantidadeDrogas, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
