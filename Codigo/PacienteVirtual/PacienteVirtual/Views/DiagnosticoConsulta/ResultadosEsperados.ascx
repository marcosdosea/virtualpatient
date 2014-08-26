<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DiagnosticoConsultaModel>" %>
<script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<% using (Html.BeginForm("ResultadosEsperados", "DiagnosticoConsulta"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <%: Html.HiddenFor(model => model.IdDiagnostico) %>
    <div class="row-fluid">
        <div class="span12">
            <div class="editor-label">
                <%: Html.Label(Resources.Mensagem.resultados_esperados) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.ResultadoEsperado, new { style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.ResultadoEsperado, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span9"></div>
        <div class="span3">
            <input class="btn btn-primary" type="submit" value=" <%: Resources.Mensagem.salvar %>  " />
        </div>
    </div>
</fieldset>
<% } %>
