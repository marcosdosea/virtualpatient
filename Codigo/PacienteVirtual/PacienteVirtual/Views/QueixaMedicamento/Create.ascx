<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.QueixaMedicamentoModel>" %>
<% using (Html.BeginForm("Create", "QueixaMedicamento"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.queixa_medicamento %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Queixa) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdQueixaMedicamento", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdQueixaMedicamento) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.NomeMedicamento) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdMedicamento", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdMedicamento) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Necessario) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Necessario, new { @class = "textbox", style = "width:276px;" })%>
                <%: Html.ValidationMessageFor(model => model.Necessario) %>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Dose) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.SuspeitaPRM) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Efetivo) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Efetivo, new { @class = "textbox", style = "width:276px;" })%>
                <%: Html.ValidationMessageFor(model => model.Efetivo) %>
            </div>
        </div>
        <div class="span3">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Dose, new { @class = "textbox", style = "width:127px;" })%>
                <%: Html.ValidationMessageFor(model => model.Dose) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdSuspeitaPrm", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdSuspeitaPRM) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Seguro) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Seguro, new { @class = "textbox", style = "width:276px;" })%>
                <%: Html.ValidationMessageFor(model => model.Seguro) %>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Desde) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Cumprimento) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Cumprimento)%>
                <%: Html.ValidationMessageFor(model => model.Cumprimento) %>
            </div>
        </div>
        <div class="span3">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Desde, new { @class = "textbox", style = "width:127px;" })%>
                <%: Html.ValidationMessageFor(model => model.Desde) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Resolvido) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Resolvido) %>
                <%: Html.ValidationMessageFor(model => model.Resolvido) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoAcaoQueixa1) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdAcaoQueixa1", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdAcaoQueixa1) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoAcaoQueixa2) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdAcaoQueixa2", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdAcaoQueixa2) %>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
    </div>
</fieldset>
<% } %>
