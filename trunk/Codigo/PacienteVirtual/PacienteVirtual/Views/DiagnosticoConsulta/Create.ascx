<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DiagnosticoConsultaModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<% using (Html.BeginForm("Create", "DiagnosticoConsulta"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <% using (Html.BeginForm("Create", "DiagnosticoConsulta", FormMethod.Post, null))
       { %>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.Label(Resources.Mensagem.dominio) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdDominioDiagnostico", null, Resources.Mensagem.selecione, new { onchange = "this.form.submit();",
                    style = "width:274px;" })%>
                <%: Html.ValidationMessageFor(model => model.IdDominioDiagnostico, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.Label(Resources.Mensagem.classe)%>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdClasseDiagnostico", null, Resources.Mensagem.selecione, new { onchange = "this.form.submit();", 
                    style = "width:274px;" })%>
                <%: Html.ValidationMessageFor(model => model.IdClasseDiagnostico, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <% } %>
    <div class="row-fluid">
        <div class="span9">
            <div class="editor-label">
                <%: Html.Label(Resources.Mensagem.diagnostico)%>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdDiagnostico", null, Resources.Mensagem.selecione, new { style = "width:576px;" })%>
                <%: Html.ValidationMessageFor(model => model.IdDiagnostico, string.Empty, new { @class = "styleValidation" })%>
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
<% } %>