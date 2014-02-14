<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ConsultaVariavelQueixaModel>" %>
<% using (Html.BeginForm("Create", "ConsultaVariavelQueixa"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend><%: Resources.Mensagem.classificacao_de_prm %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <% using (Html.BeginForm("Create", "ConsultaVariavelQueixa", FormMethod.Post, null))
       { %>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.NomeSistema) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdSistema", null, Resources.Mensagem.selecione, new { onchange = "this.form.submit();" })%>
                <%: Html.ValidationMessageFor(model => model.IdSistema, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <% } %>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoQueixa) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdQueixa", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdQueixa, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
    </div>
</fieldset>
<% } %>
