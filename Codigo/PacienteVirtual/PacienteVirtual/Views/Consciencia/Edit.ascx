<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ConscienciaModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<%@ Import Namespace="PacienteVirtual.Models" %>

<% using (Html.BeginForm("Edit", "Consciencia")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.consciencia %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>

        <div class="row-fluid">
            <div class="span6">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.AberturaOcular) %>
                    <%: Html.EnumDropDownListFor(model => model.AberturaOcular, ListaAberturaOcular.NenhumaResposta) %>
                </div>
            </div>
            <div class="span6">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.MelhorRespostaMotora) %>
                    <%: Html.EnumDropDownListFor(model => model.MelhorRespostaMotora, ListaMelhorRespostaMotora.NenhumaResposta) %>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span6">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.MelhorRespostaVerbal) %>
                    <%: Html.EnumDropDownListFor(model => model.MelhorRespostaVerbal, ListaMelhorRespostaVerbal.NenhumaResposta) %>
                </div>
            </div>
            <div class="span6">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.AvaliacaoSedacao) %>
                    <%: Html.EnumDropDownListFor(model => model.AvaliacaoSedacao, ListaAvaliacaoSedacao.Grau1) %>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span6">
                <%: Html.LabelFor(model => model.AvaliacaoConscienciaGlasgow) %>
                <%: Html.EditorFor(model => model.AvaliacaoConscienciaGlasgow) %>
                <%: Html.ValidationMessageFor(model => model.AvaliacaoConscienciaGlasgow, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>

<% } %>

