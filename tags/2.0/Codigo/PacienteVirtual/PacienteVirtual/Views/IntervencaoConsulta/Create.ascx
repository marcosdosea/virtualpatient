<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.IntervencaoConsultaModel>" %>
<%@ Import Namespace = "PacienteVirtual.Helpers" %>

<% using (Html.BeginForm("Create", "IntervencaoConsulta")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.intervencao %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
        <% using (Html.BeginForm("Create", "IntervencaoConsulta", FormMethod.Post, null))
       { %>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoGrupoIntervencao) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdGrupoIntervencao", null, Resources.Mensagem.selecione, new { onchange = "this.form.submit();" })%>
                <%: Html.ValidationMessageFor(model => model.IdGrupoIntervencao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <% } %>

    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoIntervencao) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdIntervencao", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdIntervencao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.Label(Resources.Mensagem.comunicacao) %>
            </div>
        </div>
        <div class="span3">
            <div class="editor-field">
                <%: Html.LabelFor(model => model.Paciente) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Paciente) %>
                <%: Html.ValidationMessageFor(model => model.Paciente, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Outro) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Outro) %>
                <%: Html.ValidationMessageFor(model => model.Outro, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Justificativa) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Justificativa, new { MaxLength = 200 })%>
                <%: Html.ValidationMessageFor(model => model.Justificativa, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
    </div>
    </fieldset>
    <div class="styleValidation">
    <%: Html.QuebraLinhaFor(model => model.ErroIntervencao) %>
</div>
<% } %>
