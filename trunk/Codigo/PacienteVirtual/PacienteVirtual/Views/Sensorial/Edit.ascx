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
                <%: Html.EnumDropDownListFor(model => model.EstadoMental, ListaEstadoMental.SemAlteracoes) %>
            </div>
        </div>
    </div>
    <br />
    <h4>
        <%: Resources.Mensagem.reflexos_presentes %></h4>
    <br />
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Palpebral) %>
                <%: Resources.Mensagem.palpebral %>
                <%: Html.ValidationMessageFor(model => model.Palpebral, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Pupilar) %>
                <%: Resources.Mensagem.pupilar %>
                <%: Html.ValidationMessageFor(model => model.Pupilar, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Plantar) %>
                <%: Resources.Mensagem.plantar %>
                <%: Html.ValidationMessageFor(model => model.Plantar, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.SinalBabinski) %>
                <%: Resources.Mensagem.sinal_babinski %>
                <%: Html.ValidationMessageFor(model => model.SinalBabinski, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <h4>
        <%: Resources.Mensagem.Dor %>
    </h4>
    <br />
    <div class="row-fluid">
        <div class="span9">
            <div class="editor-field">
                <%= Html.RadioButtonFor(model => model.Dor, "C" ) %>
                <%: Resources.Mensagem.com_dor %>
                &nbsp &nbsp
                <%= Html.RadioButtonFor(model => model.Dor, "S")%>
                <%: Resources.Mensagem.sem_dor %>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-field">
                <%: Resources.Mensagem.dor_intensidade_valor %>
                <%: Html.TextBoxFor(model => model.DorIntensidadeValor, new { style = "width:225px;", placeholder = "0",onkeypress = "return SomentePonto(event);" })%>
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
        <div class="span3">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Inquietacao) %>
                <%: Resources.Mensagem.inquietacao %>
                <%: Html.ValidationMessageFor(model => model.Inquietacao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.ExpressaoFacial) %>
                <%: Resources.Mensagem.expressao_facial %>
                <%: Html.ValidationMessageFor(model => model.ExpressaoFacial, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Defensividade) %>
                <%: Resources.Mensagem.defensividade %>
                <%: Html.ValidationMessageFor(model => model.Defensividade, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.PA) %>
                <%: Resources.Mensagem.PA %>
                <%: Html.ValidationMessageFor(model => model.PA, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Pulso) %>
                <%: Resources.Mensagem.pulso %>
                <%: Html.ValidationMessageFor(model => model.Pulso, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Respiracao) %>
                <%: Resources.Mensagem.respiracao %>
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
        <div class="span3">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Visual) %>
                <%: Resources.Mensagem.visual %>
                <%: Html.ValidationMessageFor(model => model.Visual, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Auditiva) %>
                <%: Resources.Mensagem.auditiva %>
                <%: Html.ValidationMessageFor(model => model.Auditiva, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Gustativa) %>
                <%: Resources.Mensagem.gustativa %>
                <%: Html.ValidationMessageFor(model => model.Gustativa, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Olfativa) %>
                <%: Resources.Mensagem.olfativa %>
                <%: Html.ValidationMessageFor(model => model.Olfativa, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Tatil) %>
                <%: Resources.Mensagem.tatil %>
                <%: Html.ValidationMessageFor(model => model.Tatil, string.Empty, new { @class = "styleValidation" })%>
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
<script type="text/javascript">
    function SomentePonto(e) {
        var tecla = (window.event) ? event.keyCode : e.which;
        if ((tecla > 47 && tecla < 58)) return true;
        else {
            if (tecla == 8 || tecla == 0) return true;
            else return false;
        }
    }
</script>