<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.MedicamentosAnterioresModel>" %>
<% using (Html.BeginForm())
   { %>
<%: Html.ValidationSummary(true) %>
<legend>
    <%: Resources.Mensagem.medicamentos_anteriores %></legend>
<div class="box-content">
    <table class="table table-bordered table-striped">
        <tr>
            <th>
                <%: Resources.Mensagem.medicamento %>
            </th>
            <th>
                <%: Resources.Mensagem.indicacao %>
            </th>
            <th>
                <%: Resources.Mensagem.resposta %>
            </th>
            <th>
                <%: Resources.Mensagem.periodo %>
            </th>
            <th>
            </th>
        </tr>
       
    </table>
</div>
<%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
<div class="row-fluid">
    <div class="span4">
        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdMedicamento) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdMedicamento", Resources.Mensagem.selecione)%>
            <%: Html.ValidationMessageFor(model => model.IdMedicamento) %>
        </div>
    </div>
</div>
<div class="row-fluid">
    <div class="span4">
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Indicacao) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Indicacao, new { @class = "textbox", style = "width:176px;" })%>
            <%: Html.ValidationMessageFor(model => model.Indicacao) %>
        </div>
    </div>
    <div class="span4">
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Resposta) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Resposta, new { @class = "textbox", style = "width:176px;" })%>
            <%: Html.ValidationMessageFor(model => model.Resposta) %>
        </div>
    </div>
    <div class="span4">
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Periodo) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Periodo, new { @class = "textbox", style = "width:176px;" })%>
            <%: Html.ValidationMessageFor(model => model.Periodo) %>
        </div>
    </div>
</div>
<div class="form-actions">
    <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
</div>
<% } %>
