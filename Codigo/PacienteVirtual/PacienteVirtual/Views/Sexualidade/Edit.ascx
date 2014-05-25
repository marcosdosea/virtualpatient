<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.SexualidadeModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<%@ Import Namespace="PacienteVirtual.Models" %>
<% using (Html.BeginForm("Edit", "Sexualidade"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.sexualidade %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.ParceiroFixo) %>
                <%: Html.ValidationMessageFor(model => model.ParceiroFixo, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.ParceiroFixo) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.ConflitoPreferenciaSexual) %>
                <%: Html.ValidationMessageFor(model => model.ConflitoPreferenciaSexual, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span5">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.ConflitoPreferenciaSexual) %>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DataUltimaMenstruacao) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.DataUltimaMenstruacao, new {  @Value = (String.Format("{0:dd/MM/yyyy}", Model.DataUltimaMenstruacao)), type = "text", @class = "calendario" , style = "width:176px;"}) %>
                <%: Html.ValidationMessageFor(model => model.DataUltimaMenstruacao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.UsoContraceptivo) %>
                <%: Html.ValidationMessageFor(model => model.UsoContraceptivo, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.UsoContraceptivo) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.DorRelacaoSexual) %>
                <%: Html.ValidationMessageFor(model => model.DorRelacaoSexual, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DorRelacaoSexual) %>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DataExamePreventivo) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.DataExamePreventivo, new {  @Value = (String.Format("{0:dd/MM/yyyy}", Model.DataExamePreventivo)), type = "text", @class = "calendario" , style = "width:176px;"}) %>
                <%: Html.ValidationMessageFor(model => model.DataExamePreventivo, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.SimetriaMamas) %>
            </div>
            <div class="editor-field">
                <%: Html.EnumDropDownListFor(model => model.SimetriaMamas, ListaSimetriaMamas.Simetricas) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.TipoSecrecao) %>
            </div>
            <div class="editor-field">
                <%: Html.EnumDropDownListFor(model => model.TipoSecrecao, ListaTipoSecrecao.SecrecaoSerosa) %>
            </div>
        </div>
    </div>
    <br />
        <h4><%: Resources.Mensagem.genitalia %></h4>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Secrecao) %>
                <%: Html.ValidationMessageFor(model => model.Secrecao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Secrecao) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Prurido) %>
                <%: Html.ValidationMessageFor(model => model.Prurido, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Prurido) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.OdorFetido) %>
                <%: Html.ValidationMessageFor(model => model.OdorFetido, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.OdorFetido) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Edema) %>
                <%: Html.ValidationMessageFor(model => model.Edema, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Edema) %>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Lesao) %>
                <%: Html.ValidationMessageFor(model => model.Lesao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Lesao) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Sangramento) %>
                <%: Html.ValidationMessageFor(model => model.Sangramento, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Sangramento) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Hiperemia) %>
                <%: Html.ValidationMessageFor(model => model.Hiperemia, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Hiperemia) %>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
