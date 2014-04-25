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
            <div id="fr" class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.FequenciaResporatoria) %>
                    <%: Html.EditorFor(model => model.FequenciaResporatoria) %>
                    <%: Html.ValidationMessageFor(model => model.FequenciaResporatoria) %>
                </div>
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.Ritmo) %>
                    <%: Html.EnumDropDownListFor(model => model.Ritmo, ListaRitmo.Regular) %>
                    <%: Html.ValidationMessageFor(model => model.Ritmo) %>
                </div>
            </div>
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.Dispineia) %>
                    <%: Resources.Mensagem.dispineia %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Taquipneia) %>
                    <%: Resources.Mensagem.taquipneia %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Bradipneia) %>
                    <%: Resources.Mensagem.bradipneia %>
                </div>
            </div>
            <br />
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.CheyneStokes) %>
                    <%: Resources.Mensagem.cheyneStokes %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Kussmaul) %>
                    <%: Resources.Mensagem.kussmaul %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Epistaxe) %>
                    <%: Resources.Mensagem.epistaxe %>
                </div>
            </div>
            <br />
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.DesvioDeSepto) %>
                    <%: Resources.Mensagem.desvioDeSepto %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Palidez) %>
                    <%: Resources.Mensagem.palidez %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.LabioCianotico) %>
                    <%: Resources.Mensagem.labioCianotico %>
                </div>
            </div>
            <br />
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.ObstrucaoNasal) %>
                    <%: Resources.Mensagem.obstrucaoNasal %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Coriza) %>
                    <%: Resources.Mensagem.coriza %>
                </div>
            </div>
        </div>

        <div id="inspecao" class="row-fluid">
            <p class="titulos"><%= Resources.Mensagem.inspecao_toracica %></p>
            <legend></legend>
            <div class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.SimetriaToracica) %>
                    <%: Html.EnumDropDownListFor(model => model.SimetriaToracica, ListaSimetriaToracica.Simetrico) %>
                    <%: Html.ValidationMessageFor(model => model.SimetriaToracica) %>
                </div>
            </div>
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.Barril) %>
                    <%: Resources.Mensagem.barril %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.PeitoDePombo) %>
                    <%: Resources.Mensagem.peitoDePombo %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Funil) %>
                    <%: Resources.Mensagem.funil %>
                </div>
            </div>
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.Lordose) %>
                    <%: Resources.Mensagem.lordose %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Cifose) %>
                    <%: Resources.Mensagem.cifose %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Escoliose) %>
                    <%: Resources.Mensagem.escoliose %>
                </div>
            </div>
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.TiragemIntercostal) %>
                    <%: Resources.Mensagem.tiragemIntercostal %>
                </div>
            </div>

        </div>
        

        <div id="palpacao" class="row-fluid">
            <p class="titulos"><%= Resources.Mensagem.palpacao %></p>
            <legend></legend>
            <div class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.Expansibilidade) %>
                    <%: Html.EnumDropDownListFor(model => model.Expansibilidade, ListaExpansibilidade.Preservada) %>
                    <%: Html.ValidationMessageFor(model => model.Expansibilidade) %>
                </div>
            </div>
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

        <div id="tosse" class="row-fluid">
            <p class="titulos"><%= Resources.Mensagem.tosse %></p>
            <legend></legend>
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.Tosse) %>
                    <%: Resources.Mensagem.tosse %>
                </div>
            </div>
            <div class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.FrequenciaTosse) %>
                    <%: Html.EnumDropDownListFor(model => model.FrequenciaTosse, ListaFrequenciaTosse.NaoSeAplica) %>
                    <%: Html.ValidationMessageFor(model => model.FrequenciaTosse) %>
                </div>
            </div>
            <div class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.TipoTosse) %>
                    <%: Html.EnumDropDownListFor(model => model.TipoTosse, ListaTipoTosse.NaoSeAplica) %>
                    <%: Html.ValidationMessageFor(model => model.TipoTosse) %>
                </div>
            </div>
            <div class="span12">
                <%= Resources.Mensagem.aspecto_secrecao %>:
                <%: Html.TextBoxFor(model => model.AspectoSecrecao, new { MaxLength = 50, style = "width:340px;" })%>
                <%: Html.ValidationMessageFor(model => model.AspectoSecrecao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>

        <div id="percursao" class="row-fluid">
            <p class="titulos"><%= Resources.Mensagem.percursao %></p>
            <legend></legend>
            <div class="span12">
                <div class="span3">
                    <%: Html.LabelFor(model => model.Percursao) %>
                    <%: Html.EnumDropDownListFor(model => model.Percursao, ListaPercursao.Ar) %>
                    <%: Html.ValidationMessageFor(model => model.Percursao) %>
                </div>
            </div>
        </div>

        <div id="ganglios" class="row-fluid">
            <p class="titulos">Palpação Gânglios</p>
            <legend></legend>
            <div class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.GangliosPalpaveis) %>
                    <%: Resources.Mensagem.ganglios_palpaveis %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.GangliosDolorosos) %>
                    <%: Resources.Mensagem.ganglios_dolorosos %>
                </div>
            </div>
            <div class="span12">
                <%= Resources.Mensagem.ganglios_localizar %>:
                <%: Html.TextBoxFor(model => model.GangliosLocalizar, new { MaxLength = 50, style = "width:340px;" })%>
                <%: Html.ValidationMessageFor(model => model.GangliosLocalizar, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>

        <div id="posicaoSalvar" class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>

<style>
    .titulos
    {
        font-size: large;
    }
    #fr
    {
        position: relative;
        left:15px;
    }
    #inspecao
    {
        position:relative;
        top:12px;
    }
    #palpacao
    {
        position:relative;
        top:20px;
    }
    #tosse
    {
        position:relative;
        top:25px;
    }
    #percursao
    {
        position:relative;
        top:34px;
    }
    #ganglios
    {
        position:relative;
        top:40px;
    }
    #posicaoSalvar
    {
        position: relative;
        top: 44px;
    }
</style>
<% } %>

