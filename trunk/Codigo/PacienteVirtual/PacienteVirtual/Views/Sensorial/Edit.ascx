<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.SensorialModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<%@ Import Namespace="PacienteVirtual.Models" %>
<% using (Html.BeginForm("Edit", "Sensorial"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.sensorial %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.EstadoMental) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.EnumDropDownListFor(model => model.EstadoMental, ListaEstadoMental.NaoSeAplica) %>
            </div>
        </div>
    </div>
    <br />
    <h4>
        <%: Resources.Mensagem.reflexos_presentes %></h4>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Palpebral) %>
                <%: Html.ValidationMessageFor(model => model.Palpebral, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Palpebral) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Pupilar) %>
                <%: Html.ValidationMessageFor(model => model.Pupilar, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Pupilar) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Plantar) %>
                <%: Html.ValidationMessageFor(model => model.Plantar, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Plantar) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.SinalBabinski) %>
                <%: Html.ValidationMessageFor(model => model.SinalBabinski, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.SinalBabinski) %>
            </div>
        </div>
    </div>
    <br />
    <h4>
        <%: Resources.Mensagem.Dor %>
    </h4>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <%: Resources.Mensagem.sem_dor %>
                <%: Html.EditorFor(model => model.SemDor) %>
                <%: Html.ValidationMessageFor(model => model.SemDor, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <%: Resources.Mensagem.dor_intensidade_valor %>
                <%: Html.TextBoxFor(model => model.DorIntensidadeValor, new { @class = "textbox", style = "width:225px;" })%>
                <%: Html.ValidationMessageFor(model => model.DorIntensidadeValor, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <h4>
        <%: Resources.Mensagem.sinais_fisicos %>
    </h4>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Resources.Mensagem.inquietacao %>
                <%: Html.EditorFor(model => model.Inquietacao) %>
                <%: Html.ValidationMessageFor(model => model.Inquietacao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span5">
            <div class="editor-field">
                <%: Resources.Mensagem.expressao_facial %>
                <%: Html.EditorFor(model => model.ExpressaoFacial) %>
                <%: Html.ValidationMessageFor(model => model.ExpressaoFacial, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span5">
            <div class="editor-field">
                <%: Resources.Mensagem.defensividade %>
                <%: Html.EditorFor(model => model.Defensividade) %>
                <%: Html.ValidationMessageFor(model => model.Defensividade, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span5">
            <div class="editor-field">
                <%: Resources.Mensagem.PA %>
                <%: Html.EditorFor(model => model.PA) %>
                <%: Html.ValidationMessageFor(model => model.PA, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span5">
            <div class="editor-field">
                <%: Resources.Mensagem.pulso %>
                <%: Html.EditorFor(model => model.Pulso) %>
                <%: Html.ValidationMessageFor(model => model.Pulso, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Resources.Mensagem.respiracao %>
                <%: Html.EditorFor(model => model.Respiracao) %>
                <%: Html.ValidationMessageFor(model => model.Respiracao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.LocalizacaoDor) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.LocalizacaoDor, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.LocalizacaoDor, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DuracaoDor) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.DuracaoDor, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.DuracaoDor, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoDor) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.DescricaoDor, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.DescricaoDor, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.FatoresAgravantesDor) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.FatoresAgravantesDor, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.FatoresAgravantesDor, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.FatoresAliviantesDor) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.FatoresAliviantesDor, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.FatoresAliviantesDor, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <h4>
        <%: Resources.Mensagem.acuidades_prejudicadas %>
    </h4>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Visual) %>
                <%: Html.ValidationMessageFor(model => model.Visual, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Visual) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Auditiva) %>
                <%: Html.ValidationMessageFor(model => model.Auditiva, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Auditiva) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Gustativa) %>
                <%: Html.ValidationMessageFor(model => model.Gustativa, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Gustativa) %>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Olfativa) %>
                <%: Html.ValidationMessageFor(model => model.Olfativa, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Olfativa) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Tatil) %>
                <%: Html.ValidationMessageFor(model => model.Tatil, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Tatil) %>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoTipoDistorcao) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.DescricaoTipoDistorcao, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.DescricaoTipoDistorcao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
