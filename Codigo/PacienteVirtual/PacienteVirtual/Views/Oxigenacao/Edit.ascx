<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.OxigenacaoModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<%@ Import Namespace="PacienteVirtual.Models" %>

<% using (Html.BeginForm("Edit", "Oxigenacao")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.oxigenacao %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
        <div class="row-fluid">
            <div class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.FequenciaResporatoria) %>
                    <%: Html.EditorFor(model => model.FequenciaResporatoria) %>mov/min
                    <%: Html.ValidationMessageFor(model => model.FrequenciaTosse, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.Ritmo) %>
                    <%: Html.EnumDropDownListFor(model => model.Ritmo, ListaRitmo.Regular) %>
                </div>
                <div class="editor-field">
                    <%: Html.ValidationMessageFor(model => model.ErroRitmo, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <%: Html.LabelFor(model => model.PadraoRespiratorio) %>
                <%: Html.EnumDropDownListFor(model => model.PadraoRespiratorio, ListaPadraoRespiratorio.Eupineico) %>
            </div>
        </div>
        <div class="row-fluid">
            <%: Html.ValidationMessageFor(model => model.ErroPadraoResp, string.Empty, new { @class = "styleValidation" })%>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.DesvioDeSepto) %>
                    <%: Resources.Mensagem.desvioDeSepto %>
                    <%: Html.ValidationMessageFor(model => model.DesvioDeSepto, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Palidez) %>
                    <%: Resources.Mensagem.palidez %>
                    <%: Html.ValidationMessageFor(model => model.Palidez, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.LabioCianotico) %>
                    <%: Resources.Mensagem.labioCianotico %>
                    <%: Html.ValidationMessageFor(model => model.LabioCianotico, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
            <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.ObstrucaoNasal) %>
                    <%: Resources.Mensagem.obstrucaoNasal %>
                    <%: Html.ValidationMessageFor(model => model.ObstrucaoNasal, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Coriza) %>
                    <%: Resources.Mensagem.coriza %>
                    <%: Html.ValidationMessageFor(model => model.Coriza, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <br />
        <h4>
            <%= Resources.Mensagem.inspecao_toracica %></h4>
        <legend></legend>
        <div class="row-fluid">
            <div class="span12">
                <%: Html.LabelFor(model => model.SimetriaToracica) %>
                <%: Html.EnumDropDownListFor(model => model.SimetriaToracica, ListaSimetriaToracica.Simetrico) %>
            </div>
        </div>
        <div class="row-fluid">
            <%: Html.ValidationMessageFor(model => model.ErroSimetriaToracica, string.Empty, new { @class = "styleValidation" })%>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <%: Html.LabelFor(model => model.TiposTorax) %>
                <%: Html.EnumDropDownListFor(model => model.TiposTorax, ListaTiposTorax.Barril) %>
            </div>
        </div>
        <div class="row-fluid">
            <%: Html.ValidationMessageFor(model => model.TiposTorax, string.Empty, new { @class = "styleValidation" })%>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <%: Html.EditorFor(model => model.TiragemIntercostal) %>
                <%: Resources.Mensagem.tiragemIntercostal %>
                <%: Html.ValidationMessageFor(model => model.TiragemIntercostal, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <br />
            <h4>
                <%= Resources.Mensagem.palpacao %></h4>
            <legend></legend>
        <div class="row-fluid">
            <div class="span12">
                <%: Html.LabelFor(model => model.Expansibilidade) %>
                <%: Html.EnumDropDownListFor(model => model.Expansibilidade, ListaExpansibilidade.Preservada) %>
            </div>
        </div>
        <div class="row-fluid">
            <%: Html.ValidationMessageFor(model => model.ErroExpansibilidade, string.Empty, new { @class = "styleValidation" })%>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="span4">
                    <%: Html.EditorFor(model => model.EnfizemaSubcutaneo) %>
                    <%: Resources.Mensagem.enfizema_subcutaneo %>
                </div>
                <div class="span6">
                    <%: Html.EditorFor(model => model.PresencaFremito) %>
                    <%: Resources.Mensagem.presenca_fremito %>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <h4><%= Resources.Mensagem.tosse %></h4>
            <legend></legend>
            <div class="span12">
                <%= Html.RadioButtonFor(model => model.Tosse, "S" ) %>
                <%: Resources.Mensagem.sim %>
                &nbsp &nbsp
                <%= Html.RadioButtonFor(model => model.Tosse, "N")%>
                <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.Tosse, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.FrequenciaTosse) %>
                    <%: Html.EnumDropDownListFor(model => model.FrequenciaTosse, ListaFrequenciaTosse.NaoSeAplica) %>
                </div>
            </div>
        </div>
         <div class="row-fluid">
            <%: Html.ValidationMessageFor(model => model.ErroFrequenciaTosse, string.Empty, new { @class = "styleValidation" })%>
         </div>
         <br />
         <div class="row-fluid">
            <div class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.TipoTosse) %>
                    <%: Html.EnumDropDownListFor(model => model.TipoTosse, ListaTipoTosse.NaoSeAplica) %>
                </div>
            </div>
        </div>
         <div class="row-fluid">
            <%: Html.ValidationMessageFor(model => model.ErroTipoTosse, string.Empty, new { @class = "styleValidation" })%>
         </div>
         <br />
         <div class="row-fluid">
            <div class="span12">
                <%: Html.LabelFor(model => model.AspectoSecrecao) %>
                <%: Html.EnumDropDownListFor(model => model.AspectoSecrecao, ListaAspectoSecrecao.NaoSeAplica) %>
            </div>
        </div>
        <br />
            <h4>
                <%= Resources.Mensagem.percursao %></h4>
            <legend></legend>
        <div class="row-fluid">
            <div class="span12">
                <%: Html.LabelFor(model => model.Percursao) %>
                <%: Html.EnumDropDownListFor(model => model.Percursao, ListaPercursao.Ar) %>
            </div>
        </div>
         <div class="row-fluid">
            <%: Html.ValidationMessageFor(model => model.ErroPercursao, string.Empty, new { @class = "styleValidation" })%>
         </div>
         <br />

        <div class="row-fluid">
            <h4>Palpação Gânglios</h4>
            <legend></legend>
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.GangliosPalpaveis) %>
                    <%: Resources.Mensagem.ganglios_palpaveis %>
                    <%: Html.ValidationMessageFor(model => model.GangliosPalpaveis, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.GangliosDolorosos) %>
                    <%: Resources.Mensagem.ganglios_dolorosos %>
                    <%: Html.ValidationMessageFor(model => model.GangliosDolorosos, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
            <br />
            <div class="span12">
                <%= Resources.Mensagem.ganglios_localizar %>:
                <%: Html.TextBoxFor(model => model.GangliosLocalizar, new { MaxLength = 50, style = "width:340px;" })%>
                <%: Html.ValidationMessageFor(model => model.GangliosLocalizar, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.AuscultaPulmonar) %>
                    <%: Html.EnumDropDownListFor(model => model.AuscultaPulmonar, ListaAuscultaPulmonar.VesicularPresente) %>
                </div>
            </div>
        </div>
         <div class="row-fluid">
            <%: Html.ValidationMessageFor(model => model.ErroAuscultaPulmonar, string.Empty, new { @class = "styleValidation" })%>
         </div>

        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>
<% } %>

