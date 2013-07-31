<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.EstiloVidaModel>" %>
<% using (Html.BeginForm())
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.estilo_vida %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <div class="row-fluid">
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.TabacoConsumo) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.TabacoConsumo) %>
                <%: Html.ValidationMessageFor(model => model.TabacoConsumo) %>
            </div>
        </div>
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.TabacoUso) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.TabacoUso, new { @class = "textbox", style = "width:176px;" })%>
                <%: Html.ValidationMessageFor(model => model.TabacoUso) %>
            </div>
        </div>
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.TabacoParou) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.TabacoParou, new { @class = "textbox", style = "width:176px;" })%>
                <%: Html.ValidationMessageFor(model => model.TabacoParou) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.CafeConsumo) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.CafeConsumo)%>
                <%: Html.ValidationMessageFor(model => model.CafeConsumo) %>
            </div>
        </div>
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.CafeUso) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.CafeUso, new { @class = "textbox", style = "width:176px;" })%>
                <%: Html.ValidationMessageFor(model => model.CafeUso) %>
            </div>
        </div>
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.CafeParou) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.CafeParou, new { @class = "textbox", style = "width:176px;" })%>
                <%: Html.ValidationMessageFor(model => model.CafeParou) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.AlcoolConsumo) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.AlcoolConsumo) %>
                <%: Html.ValidationMessageFor(model => model.AlcoolConsumo) %>
            </div>
        </div>
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.AlcoolUso) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.AlcoolUso, new { @class = "textbox", style = "width:176px;" })%>
                <%: Html.ValidationMessageFor(model => model.AlcoolUso) %>
            </div>
        </div>
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.AlcoolTipoBebida) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.AlcoolTipoBebida, new { @class = "textbox", style = "width:176px;" })%>
                <%: Html.ValidationMessageFor(model => model.AlcoolTipoBebida) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.AlcoolParou) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.AlcoolParou, new { @class = "textbox", style = "width:176px;" })%>
                <%: Html.ValidationMessageFor(model => model.AlcoolParou) %>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
