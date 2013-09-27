<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ConsultaVariavelQueixaModel>" %>
<% using (Html.BeginForm("Create", "ConsultaVariavelQueixa"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend><%: Resources.Mensagem.queixa %></legend>
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
                <%: Html.ValidationMessageFor(model => model.IdSistema) %>
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
                <%: Html.ValidationMessageFor(model => model.IdQueixa) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Tipo) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%= Html.RadioButtonFor(model => model.Tipo, "S" ) %> <%: Resources.Mensagem.suspeita_prm %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Tipo, "D")%> <%: Resources.Mensagem.doenca_agrave %>
                <%: Html.ValidationMessageFor(model => model.Tipo) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Desde) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Desde) %>
                <%: Html.ValidationMessageFor(model => model.Desde) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Prioridade) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Prioridade) %>
                <%: Html.ValidationMessageFor(model => model.Prioridade) %>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
