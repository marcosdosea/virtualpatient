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
                <%: Html.ValidationMessageFor(model => model.Satisfatoria, string.Empty, new { @class = "styleValidation" })%>
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
                <%: Html.ValidationMessageFor(model => model.NecessitaHigieneIntima, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.NecessitaBanhoLeito) %>
                <%: Resources.Mensagem.banho_leito %>
                <%: Html.ValidationMessageFor(model => model.NecessitaBanhoLeito, string.Empty, new { @class = "styleValidation" })%>
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
                <%: Html.ValidationMessageFor(model => model.CabelosPediculose, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.CabelosSeborreia) %>
                <%: Resources.Mensagem.seborreia %>
                <%: Html.ValidationMessageFor(model => model.CabelosSeborreia, string.Empty, new { @class = "styleValidation" })%>
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
                <%: Html.ValidationMessageFor(model => model.CabelosAlopecia, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.CabelosQuebradicos) %>
                <%: Resources.Mensagem.quebradicos %>
                <%: Html.ValidationMessageFor(model => model.CabelosQuebradicos, string.Empty, new { @class = "styleValidation" })%>
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
                <%: Html.ValidationMessageFor(model => model.OralRessecamento, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.OralHalitose) %>
                <%: Resources.Mensagem.halitose %>
                <%: Html.ValidationMessageFor(model => model.OralHalitose, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.OralLinguaSaburrosa) %>
                <%: Resources.Mensagem.lingua_saburrosa %>
                <%: Html.ValidationMessageFor(model => model.OralLinguaSaburrosa, string.Empty, new { @class = "styleValidation" })%>
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
                <%: Html.ValidationMessageFor(model => model.OralCarie, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="span3">
                <%: Html.EditorFor(model => model.OralUlceracao) %>
                <%: Resources.Mensagem.ulceracao %>
                <%: Html.ValidationMessageFor(model => model.OralUlceracao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
