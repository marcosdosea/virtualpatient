<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.OxigenacaoModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<%@ Import Namespace="PacienteVirtual.Models" %>

<% using (Html.BeginForm("Edit", "Oxigenacao")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.oxigenacao %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
        <%: Html.Label("FR") %>
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
            <%: Html.Label("Inspeção Torárica") %>
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
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>

<style>
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
</style>
<% } %>

