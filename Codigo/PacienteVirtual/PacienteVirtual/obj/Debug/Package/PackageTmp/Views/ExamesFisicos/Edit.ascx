<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ExamesFisicosModel>" %>
<script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js")  %>"  type="text/javascript"></script>

<% using (Html.BeginForm("Edit", "ExamesFisicos"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend><%: Resources.Mensagem.exames_fisicos %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Peso) %>
            </div>
        </div>
        <div class="span2">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Peso, new { style = "width:50px;", PlaceHolder = "Ex: 0.00", onkeypress = "return NumeroPonto(event);" })%>
                <%: Html.ValidationMessageFor(model => model.Peso, string.Empty, new { @class = "styleValidation" })%>
                <%: Resources.Mensagem.kg %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Altura) %>
            </div>
        </div>
        <div class="span2">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Altura, new { style = "width:50px;", PlaceHolder = "Ex: 0.00", onkeypress = "return NumeroPonto(event);" })%>
                <%: Html.ValidationMessageFor(model => model.Altura, string.Empty, new { @class = "styleValidation" })%>
                <%: Resources.Mensagem.m %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.IndiceMassaCorporea) %>
            </div>
        </div>
        <div class="span2">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.IndiceMassaCorporea, new { style = "width:50px;", PlaceHolder = "Ex: 0.00", onkeypress = "return NumeroPonto(event);" })%>
                <%: Html.ValidationMessageFor(model => model.IndiceMassaCorporea, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Resources.Mensagem.pressao_arterial %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.PressaoDiastolica, new { style = "width:50px;", PlaceHolder = "Ex: 0.00", onkeypress = "return NumeroPonto(event);" })%>
                <%: Html.ValidationMessageFor(model => model.PressaoDiastolica, string.Empty, new { @class = "styleValidation" })%>
                <%: Resources.Mensagem.x %>
                <%: Html.TextBoxFor(model => model.PressaoSistolica, new { style = "width:50px;", PlaceHolder = "Ex: 0.00", onkeypress = "return NumeroPonto(event);" })%>
                <%: Html.ValidationMessageFor(model => model.PressaoSistolica, string.Empty, new { @class = "styleValidation" })%>
                <%: Resources.Mensagem.mmHg %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Glicemia) %>
            </div>
        </div>
        <div class="span4">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Glicemia, new { style = "width:50px;" ,PlaceHolder = "Ex: 0.00", onkeypress = "return NumeroPonto(event);" })%>
                <%: Html.ValidationMessageFor(model => model.Glicemia, string.Empty, new { @class = "styleValidation" })%>
                <%: Resources.Mensagem.mg_dl%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.CircunferenciaAbdominal) %>
            </div>
        </div>
        <div class="span4">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.CircunferenciaAbdominal, new { style = "width:50px;", PlaceHolder = "Ex: 0.00", onkeypress = "return NumeroPonto(event);" })%>
                <%: Html.ValidationMessageFor(model => model.CircunferenciaAbdominal, string.Empty, new { @class = "styleValidation" })%> cm
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
