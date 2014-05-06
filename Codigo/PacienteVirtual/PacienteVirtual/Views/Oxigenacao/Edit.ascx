<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.OxigenacaoModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<%@ Import Namespace="PacienteVirtual.Models" %>

<% using (Html.BeginForm("Edit", "Oxigenacao")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.oxigenacao %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
        <p class="titulos">FR</p>
        <legend></legend>
        <div class="row-fluid">
            <div class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.FequenciaResporatoria) %>
                    <%: Html.EditorFor(model => model.FequenciaResporatoria) %>
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
                <div class="span3">
                    <%: Html.EditorFor(model => model.Dispineia) %>
                    <%: Resources.Mensagem.dispineia %>
                    <%: Html.ValidationMessageFor(model => model.Dispineia, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Taquipneia) %>
                    <%: Resources.Mensagem.taquipneia %>
                    <%: Html.ValidationMessageFor(model => model.Taquipneia, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Bradipneia) %>
                    <%: Resources.Mensagem.bradipneia %>
                    <%: Html.ValidationMessageFor(model => model.Bradipneia, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.CheyneStokes) %>
                    <%: Resources.Mensagem.cheyneStokes %>
                    <%: Html.ValidationMessageFor(model => model.CheyneStokes, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Kussmaul) %>
                    <%: Resources.Mensagem.kussmaul %>
                    <%: Html.ValidationMessageFor(model => model.Kussmaul, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Epistaxe) %>
                    <%: Resources.Mensagem.epistaxe %>
                    <%: Html.ValidationMessageFor(model => model.Epistaxe, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
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
        <div class="row-fluid">
            <p class="titulos"><%= Resources.Mensagem.inspecao_toracica %></p>
            <legend></legend>
            <div class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.SimetriaToracica) %>
                    <%: Html.EnumDropDownListFor(model => model.SimetriaToracica, ListaSimetriaToracica.Simetrico) %>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <%: Html.ValidationMessageFor(model => model.ErroSimetriaToracica, string.Empty, new { @class = "styleValidation" })%>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.Barril) %>
                    <%: Resources.Mensagem.barril %>
                    <%: Html.ValidationMessageFor(model => model.Barril, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.PeitoDePombo) %>
                    <%: Resources.Mensagem.peitoDePombo %>
                    <%: Html.ValidationMessageFor(model => model.PeitoDePombo, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Funil) %>
                    <%: Resources.Mensagem.funil %>
                    <%: Html.ValidationMessageFor(model => model.Funil, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.Lordose) %>
                    <%: Resources.Mensagem.lordose %>
                    <%: Html.ValidationMessageFor(model => model.Lordose, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Cifose) %>
                    <%: Resources.Mensagem.cifose %>
                    <%: Html.ValidationMessageFor(model => model.Cifose, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Escoliose) %>
                    <%: Resources.Mensagem.escoliose %>
                    <%: Html.ValidationMessageFor(model => model.Escoliose, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.TiragemIntercostal) %>
                    <%: Resources.Mensagem.tiragemIntercostal %>
                    <%: Html.ValidationMessageFor(model => model.TiragemIntercostal, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <p class="titulos">
                <%= Resources.Mensagem.palpacao %></p>
            <legend></legend>
            <div class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.Expansibilidade) %>
                    <%: Html.EnumDropDownListFor(model => model.Expansibilidade, ListaExpansibilidade.Preservada) %>
                </div>
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
            <p class="titulos"><%= Resources.Mensagem.tosse %></p>
            <legend></legend>
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.Tosse) %>
                    <%: Resources.Mensagem.tosse %>
                </div>
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
                <%= Resources.Mensagem.aspecto_secrecao %>:
                <%: Html.TextBoxFor(model => model.AspectoSecrecao, new { MaxLength = 50, style = "width:340px;" })%>
                <%: Html.ValidationMessageFor(model => model.AspectoSecrecao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>

        <div class="row-fluid">
            <p class="titulos"><%= Resources.Mensagem.percursao %></p>
            <legend></legend>
            <div class="span12">
                <div class="span3">
                    <%: Html.LabelFor(model => model.Percursao) %>
                    <%: Html.EnumDropDownListFor(model => model.Percursao, ListaPercursao.Ar) %>
                </div>
            </div>
        </div>
         <div class="row-fluid">
            <%: Html.ValidationMessageFor(model => model.ErroPercursao, string.Empty, new { @class = "styleValidation" })%>
         </div>
         <br />

        <div class="row-fluid">
            <p class="titulos">Palpação Gânglios</p>
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
            <div class="span12">
                <%= Resources.Mensagem.ganglios_localizar %>:
                <%: Html.TextBoxFor(model => model.GangliosLocalizar, new { MaxLength = 50, style = "width:340px;" })%>
                <%: Html.ValidationMessageFor(model => model.GangliosLocalizar, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>

        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>
<% } %>

