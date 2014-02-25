<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DiarioPessoalModel>" %>
<% using (Html.BeginForm("Create", "DiarioPessoal"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.diario_pessoal %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaFixo) %>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Medicamento) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdMedicamento", null, Resources.Mensagem.selecione, new { style = "width:320px;" })%>
                <%: Html.ValidationMessageFor(model => model.IdMedicamento, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Quantidade)%>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Quantidade, new { @class = "textbox", style = "width:312px;" })%>
                <%: Html.ValidationMessageFor(model => model.Quantidade, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Periodo)%>
            </div>
        </div>
        <div class="span9">
            <div class="editor-field">
                <%= Html.RadioButtonFor(model => model.Periodo, "M")%> <%: Resources.Mensagem.manha %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Periodo, "T")%> <%: Resources.Mensagem.tarde %>
                 &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Periodo, "N")%> <%: Resources.Mensagem.noite %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Periodo, "S")%> <%: Resources.Mensagem.necessario %>
                <%: Html.ValidationMessageFor(model => model.Periodo, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.Label(Resources.Mensagem.horario_observacao)%>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Horario, new { @class = "textbox", style = "width:312px;", MaxLength = 20 })%>
                <!--span class="add-on"><i class="icon-time"></i></span -->
                <%: Html.ValidationMessageFor(model => model.Horario, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <!--%: Html.LabelFor(model => model.NomeBebida) % -->
                <%: Resources.Mensagem.tipo_bebida %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdBebida",null, Resources.Mensagem.selecione, new { style = "width:320px;" })%>
                <%: Html.ValidationMessageFor(model => model.IdBebida, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
    </div>
</fieldset>
<% } %>
