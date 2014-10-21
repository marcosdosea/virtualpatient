<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DiagnosticoConsultaFatorModel>" %>
<%@ Import Namespace = "PacienteVirtual.Helpers" %>
<% using (Html.BeginForm("Adicionar", "DiagnosticoConsultaFator"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset id="desabilitaFator">
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <%: Html.HiddenFor(model => model.IdDiagnostico) %>
    <div class="row-fluid">
        <div class="span9">
            <div class="editor-label">
                <% if (Session["_Risco"].Equals(true))
                   { %>
                    <%: Resources.Mensagem.fatores_risco%>
                <% }
                   else
                   { %>
                   <%: Resources.Mensagem.fatores_relacionados%>
                <% } %>
            </div>
            <br />
            <div class="editor-field">
                <%: Html.DropDownList("IdDiagnosticoFator", null, Resources.Mensagem.selecione, new { style = "width:576px;" })%>
                <%: Html.ValidationMessageFor(model => model.IdDiagnosticoFator, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span9"></div>
        <div class="span2">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
        </div>
    </div>
</fieldset>
<div class="styleValidation">
    <%: Html.QuebraLinhaFor(model => model.ErroFator) %>
</div>
<% } %>
<input type="hidden" value="<%: Session["_Roles"] %>" id="perfil" />
<input type="hidden" value="<%: Session["_IdEstadoConsulta"] %>" id="IdEstadoConsulta" />
<script type="text/javascript">
    var idEstadoConsulta = document.getElementById('IdEstadoConsulta').value;
    var perfil = document.getElementById('perfil').value;
    if (perfil == "tutor") {
        //habilitar para tutor corrigir e comentarios do tutor
        $("#desabilitaFator *").attr("disabled", "disabled").off('click');
    } else if (perfil == "usuario") {
        if (idEstadoConsulta == 3 || idEstadoConsulta == 4 || idEstadoConsulta == 5 || idEstadoConsulta == 7) {
            $("#desabilitaFator *").attr("disabled", "disabled").off('click');
        }
    }
</script>