<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.CirculacaoModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<%@ Import Namespace="PacienteVirtual.Models" %>
<% using (Html.BeginForm("Edit", "Circulacao"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.circulacao %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.PA) %>
            </div>
        </div>
        <div class="span2">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.PA, new { style = "width:50px;", placeholder = "0:00", onkeypress = "return NumeroPonto(event);" })%>
                <%: Html.ValidationMessageFor(model => model.PA, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <%: Resources.Mensagem.mmHg %>
        </div>
        <div class="span1">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.P) %>
            </div>
        </div>
        <div class="span2">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.P, new { style = "width:50px;" , placeholder = "0:00", onkeypress = "return NumeroPonto(event);" })%>
                <%: Html.ValidationMessageFor(model => model.P, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <%: Resources.Mensagem.bpm %>
        </div>
    </div>
    <br />
    <h4>
        <%: Resources.Mensagem.infusao_venosa %></h4>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CateterPeriferico) %>
                <%: Html.ValidationMessageFor(model => model.CateterPeriferico, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.CateterPeriferico)%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.CateterLocal) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.CateterLocal, new { @class = "textbox", style = "width:255px;" })%>
                <%: Html.ValidationMessageFor(model => model.CateterLocal, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.CateterData) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.CateterData, new { @Value = (String.Format("{0:dd/MM/yyyy}", Model.CateterData)), type = "text", @class = "calendario", style = "width:176px;" })%>
                <%: Html.ValidationMessageFor(model => model.CateterData, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CateterCentral) %>
                <%: Html.ValidationMessageFor(model => model.CateterCentral, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.CateterCentral)%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.CateterCentralLocal) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.CateterCentralLocal, new { @class = "textbox", style = "width:255px;" })%>
                <%: Html.ValidationMessageFor(model => model.CateterCentralLocal, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.CateterCentralData) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.CateterCentralData, new { @Value = (String.Format("{0:dd/MM/yyyy}", Model.CateterCentralData)), type = "text", @class = "calendario", style = "width:176px;" })%>
                <%: Html.ValidationMessageFor(model => model.CateterCentralData, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.DisseccaoVenosa) %>
                <%: Html.ValidationMessageFor(model => model.DisseccaoVenosa, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DisseccaoVenosa)%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DisseccaoVenosaLocal) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.DisseccaoVenosaLocal, new { @class = "textbox", style = "width:255px;" })%>
                <%: Html.ValidationMessageFor(model => model.DisseccaoVenosaLocal, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DissecacaoVenosaData) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.DissecacaoVenosaData, new { @Value = (String.Format("{0:dd/MM/yyyy}", Model.DissecacaoVenosaData)), type = "text", @class = "calendario", style = "width:176px;" })%>
                <%: Html.ValidationMessageFor(model => model.DissecacaoVenosaData, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.SinaisFlogisticos) %>
                <%: Html.ValidationMessageFor(model => model.SinaisFlogisticos, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.SinaisFlogisticos)%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.SinaisFlogisticosQuaisLocal) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.SinaisFlogisticosQuaisLocal, new { @class = "textbox", style = "width:255px;" })%>
                <%: Html.ValidationMessageFor(model => model.SinaisFlogisticosQuaisLocal, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <br />
    <h4><%: Resources.Mensagem.inspecao_rede_venosa %></h4>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.RedeVenosaVisivel) %>
                <%: Html.ValidationMessageFor(model => model.RedeVenosaVisivel, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.RedeVenosaVisivel)%>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.RedeVenosaSemAcesso) %>
                <%: Html.ValidationMessageFor(model => model.RedeVenosaSemAcesso, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.RedeVenosaSemAcesso)%>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Flebite) %>
                <%: Html.ValidationMessageFor(model => model.Flebite, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Flebite)%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.FlebiteLocalizar) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.FlebiteLocalizar, new { @class = "textbox", style = "width:255px;" })%>
                <%: Html.ValidationMessageFor(model => model.FlebiteLocalizar, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Infiltracao) %>
                <%: Html.ValidationMessageFor(model => model.Infiltracao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Infiltracao)%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.InfiltracaoLocalizar) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.InfiltracaoLocalizar, new { @class = "textbox", style = "width:255px;" })%>
                <%: Html.ValidationMessageFor(model => model.InfiltracaoLocalizar, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.EnchimentoCapilar) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field"> 
                <%: Html.EnumDropDownListFor(model => model.EnchimentoCapilar, ListaEnchimentoCapilar.MenorIgual3) %>
            </div>
        </div>
    </div>
    <br />
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Varizes) %>
                <%: Html.ValidationMessageFor(model => model.Varizes, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Varizes)%>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Edema) %>
                <%: Html.ValidationMessageFor(model => model.Edema, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Edema)%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.EdemaLocalizar) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.EdemaLocalizar, new { @class = "textbox", style = "width:255px;" })%>
                <%: Html.ValidationMessageFor(model => model.EdemaLocalizar, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
<script type="text/javascript">
    function NumeroPonto(e) {
        var tecla = (window.event) ? event.keyCode : e.which;
        if ((tecla > 47 && tecla < 58 || tecla == 46)) return true;
        else {
            if (tecla == 8 || tecla == 0) return true;
            else return false;
        }
    }
</script>