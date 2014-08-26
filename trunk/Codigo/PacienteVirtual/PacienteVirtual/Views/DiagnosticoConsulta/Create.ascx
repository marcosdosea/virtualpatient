<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DiagnosticoConsultaModel>" %>
<%@ Import Namespace = "PacienteVirtual.Helpers" %>

<% using (Html.BeginForm("Create", "DiagnosticoConsulta")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.diagnostico %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
        <% using (Html.BeginForm("Create", "DiagnosticoConsulta", FormMethod.Post, null))
       { %>
        <div class="row-fluid">
            <div class="span3">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.DescricaoDominioDiagnostico) %>
                </div>
            </div>
            <div class="span6">
                <div class="editor-field">
                    <%: Html.DropDownList("IdDominioDiagnostico", null, Resources.Mensagem.selecione, new { onchange = "this.form.submit();" })%>
                    <%: Html.ValidationMessageFor(model => model.IdDominioDiagnostico, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.DescricaoClasseDiagnostico)%>
                </div>
            </div>
            <div class="span6">
                <div class="editor-field">
                    <%: Html.DropDownList("IdClasseDiagnostico", null, Resources.Mensagem.selecione, new { onchange = "this.form.submit();" })%>
                    <%: Html.ValidationMessageFor(model => model.IdClasseDiagnostico, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <% } %>
        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.DescricaoDiagnostico)%>
                </div>
            </div>
            <div class="span6">
                <div class="editor-field">
                    <%: Html.DropDownList("IdDiagnostico", Resources.Mensagem.selecione)%>
                    <%: Html.ValidationMessageFor(model => model.IdDiagnostico, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
        </div>
    </fieldset>
<% } %>