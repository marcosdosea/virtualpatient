<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.HigieneModel>" %>
<% using (Html.BeginForm("Edit", "Higiene"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.higiene %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <div class="row-fluid">
        <div class="span12">
            <div class="span3">
                <%: Resources.Mensagem.corporal %>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.Satisfatoria) %>
                <%: Resources.Mensagem.satisfatoria %>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="span3">
                <%: Resources.Mensagem.necessidade_de %></div>
            <div class="span3">
                <%: Html.EditorFor(model => model.NecessitaHigieneIntima) %>
                <%: Resources.Mensagem.higiene_intima %>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.NecessitaBanhoLeito) %>
                <%: Resources.Mensagem.banho_leito %>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="span3">
                <%: Resources.Mensagem.cabelos %>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.CabelosPediculose) %>
                <%: Resources.Mensagem.pediculose %>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.CabelosSeborreia) %>
                <%: Resources.Mensagem.seborreia %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="span3">
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.CabelosAlopecia) %>
                <%: Resources.Mensagem.alopecia %>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.CabelosQuebradicos) %>
                <%: Resources.Mensagem.quebradicos %>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <div class="span3">
                <%: Resources.Mensagem.oral %></div>
            <div class="span3">
                <%: Html.EditorFor(model => model.OralRessecamento) %>
                <%: Resources.Mensagem.ressecamento %>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.OralHalitose) %>
                <%: Resources.Mensagem.halitose %>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.OralLinguaSaburrosa) %>
                <%: Resources.Mensagem.lingua_saburrosa %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="span3">
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.OralCarie) %>
                <%: Resources.Mensagem.carie %>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.OralUlceracao) %>
                <%: Resources.Mensagem.ulceracao %>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
