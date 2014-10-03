<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.PsicoEspiritualModel>" %>
<% using (Html.BeginForm("Edit", "PsicoEspiritual"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.psicoespiritual %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <div class="row-fluid">
        <div class="editor-label">
            <%: Html.LabelFor(model => model.CrencaReligiosa) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.CrencaReligiosa, new { style = "width:350px;" })%>
            <%: Html.ValidationMessageFor(model => model.CrencaReligiosa, string.Empty, new { @class = "styleValidation" })%>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="span6">
                <%: Html.EditorFor(model => model.BuscaAssistenciaEspiritual) %>
                <%: Resources.Mensagem.busca_assistencia_espiritual %>
                <%: Html.ValidationMessageFor(model => model.BuscaAssistenciaEspiritual, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="editor-label">
            <%: Html.LabelFor(model => model.EspecificaAssistenciaEspiritual) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.EspecificaAssistenciaEspiritual, new { style = "width:350px;" })%>
            <%: Html.ValidationMessageFor(model => model.EspecificaAssistenciaEspiritual, string.Empty, new { @class = "styleValidation" })%>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="span4">
                <%: Html.EditorFor(model => model.DisturbiosSono) %>
                <%: Resources.Mensagem.disturbios_sono %>
                <%: Html.ValidationMessageFor(model => model.DisturbiosSono, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span4">
                <%: Html.EditorFor(model => model.Ansiedade) %>
                <%: Resources.Mensagem.ansiedade %>
                <%: Html.ValidationMessageFor(model => model.Ansiedade, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span4">
                <%: Html.EditorFor(model => model.BaixoAutoEstima) %>
                <%: Resources.Mensagem.baixo_auto_estima %>
                <%: Html.ValidationMessageFor(model => model.BaixoAutoEstima, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="span4">
                <%: Html.EditorFor(model => model.Estresse) %>
                <%: Resources.Mensagem.estresse %>
                <%: Html.ValidationMessageFor(model => model.Estresse, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span4">
                <%: Html.EditorFor(model => model.HumorDeprimido) %>
                <%: Resources.Mensagem.humor_deprimido %>
                <%: Html.ValidationMessageFor(model => model.HumorDeprimido, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span4">
                <%: Html.EditorFor(model => model.Choro) %>
                <%: Resources.Mensagem.choro %>
                <%: Html.ValidationMessageFor(model => model.Choro, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="span4">
                <%: Html.EditorFor(model => model.Raiva) %>
                <%: Resources.Mensagem.raiva %>
                <%: Html.ValidationMessageFor(model => model.Raiva, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span4">
                <%: Html.EditorFor(model => model.Negacao) %>
                <%: Resources.Mensagem.negacao %>
                <%: Html.ValidationMessageFor(model => model.Negacao, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span4">
                <%: Html.EditorFor(model => model.Apatico) %>
                <%: Resources.Mensagem.apatico %>
                <%: Html.ValidationMessageFor(model => model.Apatico, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="span6">
                <%: Html.EditorFor(model => model.PreocupacaoMorte) %>
                <%: Resources.Mensagem.preocupacao_morte %>
                <%: Html.ValidationMessageFor(model => model.PreocupacaoMorte, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
