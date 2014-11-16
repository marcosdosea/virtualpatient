<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DiagnosticoConsultaModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<% using (Html.BeginForm("Create", "DiagnosticoConsulta"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset id="desabilitaDiag">
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.Label(Resources.Mensagem.dominio) %>
            </div>
            <div class="editor-field">
                <%: Html.Partial("DDLDominio", Model) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.Label(Resources.Mensagem.classe)%>
            </div>
            <div class="editor-field">
                <div id="ClasseDominio"><%: Html.Partial("DDLClasseDominio", Model)%></div>
            </div>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span9">
            <div class="editor-label">
                <%: Html.Label(Resources.Mensagem.diagnostico)%>
            </div>
            <div class="editor-field">
                <div id="Diagnostico"><%: Html.Partial("DDLDiagnostico", Model)%></div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span9">
        </div>
        <div class="span2">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
        </div>
    </div>
</fieldset>
<div class="styleValidation">
    <%: Html.QuebraLinhaFor(model => model.ErroDiagnostico) %>
</div>
<% } %>
<input type="hidden" value="<%: Session["_Roles"] %>" id="perfil" />
<input type="hidden" value="<%: Session["_IdEstadoConsulta"] %>" id="IdEstadoConsulta" />
<script type="text/javascript">
    var idEstadoConsulta = document.getElementById('IdEstadoConsulta').value;
    var perfil = document.getElementById('perfil').value;
    if (perfil == "tutor") {
        //habilitar para tutor corrigir e comentarios do tutor
        $("#desabilitaDiag *").attr("disabled", "disabled").off('click');
    } else if (perfil == "usuario") {
        if (idEstadoConsulta == 3 || idEstadoConsulta == 4 || idEstadoConsulta == 5 || idEstadoConsulta == 7) {
            $("#desabilitaDiag *").attr("disabled", "disabled").off('click');
        }
    }
</script>
