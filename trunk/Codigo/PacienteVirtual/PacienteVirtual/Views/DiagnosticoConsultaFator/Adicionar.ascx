<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DiagnosticoConsultaFatorModel>" %>
<%@ Import Namespace = "PacienteVirtual.Helpers" %>
<% using (Html.BeginForm("Adicionar", "DiagnosticoConsultaFator"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <%: Html.HiddenFor(model => model.IdDiagnostico) %>
    <div class="row-fluid">
        <div class="span3">
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
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdDiagnosticoFator", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdDiagnosticoFator, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span2">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
        </div>
    </div>
</fieldset>
<% } %>
