<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DiarioPessoalModel>" %>
<h1>
    <%:  ViewBag.situacao %></h1>
<% using (Html.BeginForm())
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.diario_pessoal %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaFixo) %>
    <div class="row-fluid">
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Periodo)%>
            </div>
            <div class="editor-field">
                <!--%: Html.DropDownListFor(Model => Model.Periodo, (SelectList)ViewBag.Periodo)% -->
                <%: Html.TextBoxFor(model => model.Periodo, new { @class = "textbox", style = "width:176px;" })%>
                <%: Html.ValidationMessageFor(model => model.Periodo) %>
            </div>
        </div>
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Horario)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Horario, new { @class = "textbox", style = "width:176px;" })%>
                <!--span class="add-on"><i class="icon-time"></i></span -->
                <%: Html.ValidationMessageFor(model => model.Horario) %>
            </div>
        </div>
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Quantidade)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Quantidade, new { @class = "textbox", style = "width:176px;" })%>
                <%: Html.ValidationMessageFor(model => model.Quantidade) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Medicamento) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdMedicamento")%>
                <%: Html.ValidationMessageFor(model => model.IdMedicamento) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.NomeBebida) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdBebida") %>
                <%: Html.ValidationMessageFor(model => model.IdBebida)%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
