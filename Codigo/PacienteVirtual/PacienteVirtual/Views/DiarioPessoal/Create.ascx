<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DiarioPessoalModel>" %>
<% using (Html.BeginForm("Create", "DiarioPessoal"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.diario_pessoal %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaFixo) %>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Periodo)%>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <!--%: Html.DropDownListFor(Model => Model.Periodo, (SelectList)ViewBag.Periodo)% -->
                <%= Html.RadioButtonFor(model => model.Periodo, "M")%> <%: Resources.Mensagem.manha %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Periodo, "T")%> <%: Resources.Mensagem.tarde %>
                 &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Periodo, "N")%> <%: Resources.Mensagem.noite %>
                <%: Html.ValidationMessageFor(model => model.Periodo) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Horario)%>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Horario, new { @class = "textbox", style = "width:479px;" })%>
                <!--span class="add-on"><i class="icon-time"></i></span -->
                <%: Html.ValidationMessageFor(model => model.Horario) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Quantidade)%>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Quantidade, new { @class = "textbox", style = "width:479px;" })%>
                <%: Html.ValidationMessageFor(model => model.Quantidade) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Medicamento) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdMedicamento", null, Resources.Mensagem.selecione, new { style = "width:488px;" })%>
                <%: Html.ValidationMessageFor(model => model.IdMedicamento) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <!--%: Html.LabelFor(model => model.NomeBebida) % -->
                <%: Resources.Mensagem.bebida %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdBebida",null, Resources.Mensagem.selecione, new { style = "width:488px;" })%>
                <%: Html.ValidationMessageFor(model => model.IdBebida)%>
            </div>
        </div>
    </div>
    
    
    
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
    </div>
</fieldset>
<% } %>
