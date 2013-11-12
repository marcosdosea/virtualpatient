﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.Consulta.ExamesFisicosModel>" %>
<script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<% using (Html.BeginForm("Edit", "ExamesFisicos"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend><%: Resources.Mensagem.exames_fisicos %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Peso) %>
            </div>
        </div>
        <div class="span2">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Peso, new { @class = "textbox", style = "width:50px;" })%>
                <%: Html.ValidationMessageFor(model => model.Peso) %>
                <%: Resources.Mensagem.kg %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Altura) %>
            </div>
        </div>
        <div class="span2">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Altura, new { @class = "textbox", style = "width:50px;" })%>
                <%: Html.ValidationMessageFor(model => model.Altura) %>
                <%: Resources.Mensagem.m %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-label">
                <%: Resources.Mensagem.pressao_arterial %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.PressaoDiastolica, new { @class = "textbox", style = "width:50px;" })%>
                <%: Html.ValidationMessageFor(model => model.PressaoDiastolica) %>
                <%: Resources.Mensagem.x %>
                <%: Html.TextBoxFor(model => model.PressaoSistolica, new { @class = "textbox", style = "width:50px;" })%>
                <%: Html.ValidationMessageFor(model => model.PressaoSistolica) %>
                <%: Resources.Mensagem.mmHg %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span1">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Glicemia) %>
            </div>
        </div>
        <div class="span4">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Glicemia, new { @class = "textbox", style = "width:50px;" })%>
                <%: Html.ValidationMessageFor(model => model.Glicemia) %>
                <%: Resources.Mensagem.mg_dl%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>