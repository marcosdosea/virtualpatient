<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ComunicacaoModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<%@ Import Namespace="PacienteVirtual.Models" %>

<% using (Html.BeginForm("Edit", "Comunicacao"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.comunicacao_seguranca_lazer %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <h4><%: Resources.Mensagem.comunicacao %></h4>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="span4">
                <%: Html.EditorFor(model => model.Verbaliza) %>
                <%: Resources.Mensagem.verbaliza %>
                <%: Html.ValidationMessageFor(model => model.Verbaliza, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span4">
                <%: Html.EditorFor(model => model.Deprimido) %>
                <%: Resources.Mensagem.deprimido %>
                <%: Html.ValidationMessageFor(model => model.Deprimido, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
            <div class="span6">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.TranstornosExpressaoVerbal) %>
                    <%: Html.EnumDropDownListFor(model => model.TranstornosExpressaoVerbal, ListaTranstornosExpressaoVerbal.NaoSeAplica) %>
                </div>
            </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span4">
            <%: Html.EditorFor(model => model.DiscursoIncoerente) %>
            <%: Resources.Mensagem.discurso_incoerente %>
            <%: Html.ValidationMessageFor(model => model.DiscursoIncoerente, string.Empty, new { @class = "styleValidation" })%>
        </div>
    </div>
    <br />
    <h4><%: Resources.Mensagem.necessidade_seguranca %></h4>
    <br />
    <div class="row-fluid">
            <div class="span6">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.TipoComportamento) %>
                    <%: Html.EnumDropDownListFor(model => model.TipoComportamento, ListaTipoComportamento.Calmo) %>
                </div>
            </div>
    </div>
    <br />
    <h4><%: Resources.Mensagem.necessidade_lazer_recreacao %></h4>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="span3">
                <%: Html.EditorFor(model => model.Tv) %>
                <%: Resources.Mensagem.tv %>
                <%: Html.ValidationMessageFor(model => model.Tv, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.Radio) %>
                <%: Resources.Mensagem.radio %>
                <%: Html.ValidationMessageFor(model => model.Radio, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.Celular) %>
                <%: Resources.Mensagem.celular %>
                <%: Html.ValidationMessageFor(model => model.Celular, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.Leituras) %>
                <%: Resources.Mensagem.leituras %>
                <%: Html.ValidationMessageFor(model => model.Leituras, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Especificar) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Especificar, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.Especificar, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <h4><%: Resources.Mensagem.necessidade_interacao_social %></h4>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="span4">
                <%: Html.EditorFor(model => model.InterageComEquipeSaude) %>
                <%: Resources.Mensagem.interage_com_equipe_saude %>
                <%: Html.ValidationMessageFor(model => model.InterageComEquipeSaude, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span4">
                <%: Html.EditorFor(model => model.RecebeVisitas) %>
                <%: Resources.Mensagem.recebe_visitas %>
                <%: Html.ValidationMessageFor(model => model.RecebeVisitas, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span4">
                <%: Html.EditorFor(model => model.ParticipaAtividades) %>
                <%: Resources.Mensagem.participa_atividades %>
                <%: Html.ValidationMessageFor(model => model.ParticipaAtividades, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
