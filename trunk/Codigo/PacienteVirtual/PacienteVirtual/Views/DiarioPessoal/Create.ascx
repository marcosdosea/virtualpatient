<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DiarioPessoalModel>" %>
<%@ Import Namespace = "PacienteVirtual.Helpers" %>

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
                <%: Html.Label(Resources.Mensagem.dose)%>
            </div>
        </div>
        <div class="span9">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Dose, new { @class = "textbox", style = "width:312px;" })%>
                <%: Html.ValidationMessageFor(model => model.Dose, string.Empty, new { @class = "styleValidation" })%>
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
                <%= Html.RadioButtonFor(model => model.Periodo, "S")%> <%: Resources.Mensagem.se_necessario %>
                <%: Html.ValidationMessageFor(model => model.Periodo, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.Label(Resources.Mensagem.horario)%>
            </div>
        </div>
        <div class="span9">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Horario, new { placeholder = "07:00", style = "width:70px;", MaxLength = 5, onkeypress = "return NumeroDoisPontos(event);" })%>
				<%: Html.ValidationMessageFor(model => model.Horario, string.Empty, new { @class = "styleValidation" })%>
                hrs (Ex: 07:00)
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.Label(Resources.Mensagem.horario_complemento)%>
            </div>
        </div>
        <div class="span9">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.HorarioComplemento, new { @class = "textbox", style = "width:312px;" })%>
                <%: Html.ValidationMessageFor(model => model.HorarioComplemento, string.Empty, new { @class = "styleValidation" })%>
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
<div class="styleValidation">
    <%: Html.QuebraLinhaFor(model => model.ErroDiarioPessoal) %>
</div>
<% } %>
<script type="text/javascript">
    function NumeroDoisPontos(e) {
        var tecla = (window.event) ? event.keyCode : e.which;
        if ((tecla > 47 && tecla < 58 || tecla == 58)) return true;
        else {
            if (tecla == 8 || tecla == 0) return true;
            else return false;
        }
    }
</script>