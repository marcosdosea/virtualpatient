<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.MedicamentoPrescritoModel>" %>
<% using (Html.BeginForm())
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.medicamento_prescrito %></legend>
    <div class="box-content">
        <table class="table table-bordered table-striped">
            <tr>
                <th>
                    <%: Resources.Mensagem.medicamento %>
                </th>
                <th>
                    <%: Resources.Mensagem.fitoterapico %>
                </th>
                <th>
                    <%: Resources.Mensagem.dosagem %>
                </th>
                <th>
                    <%: Resources.Mensagem.posologia %>
                </th>
                <th>
                    <%: Resources.Mensagem.prescritor %>
                </th>
                <th>
                    <%: Resources.Mensagem.especialidade %>
                </th>
                <th>
                </th>
            </tr>
            <% foreach (var item in ViewBag.MedicamentosPrescrito as List<PacienteVirtual.Models.MedicamentoPrescritoModel>)
               { %>
            <tr>
                <td>
                    <%: Html.DisplayFor(items => item.MedicamentoNome)%>
                </td>
                <td>
                    <%: Html.DisplayFor(items => item.Fitoterapico)%>
                </td>
                <td>
                    <%: Html.DisplayFor(items => item.Dosagem)%>
                </td>
                <td>
                    <%: Html.DisplayFor(items => item.Posologia)%>
                </td>
                <td>
                    <%: Html.DisplayFor(items => item.Prescritor)%>
                </td>
                <td>
                    <%: Html.DisplayFor(items => item.Especialidade)%>
                </td>
                <td>
                    <% using (Html.BeginForm())
                       { %>
                    <%: Html.ActionLink(Resources.Mensagem.remover, "RemoverMedicamentosPrescritos", new { idConsultaV = item.IdConsultaVariavel, idMedicamento = item.IdMedicamento })%>
                    <% } %>
                </td>
            </tr>
            <% } %>
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
                <%: Html.LabelFor(model => model.Fitoterapico) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Fitoterapico) %>
                <%: Html.ValidationMessageFor(model => model.Fitoterapico) %>
            </div>
        </div>
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Dosagem) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Dosagem, new { @class = "textbox", style = "width:176px;" })%>
                <%: Html.ValidationMessageFor(model => model.Dosagem) %>
            </div>
        </div>
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Posologia) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Posologia, new { @class = "textbox", style = "width:176px;" })%>
                <%: Html.ValidationMessageFor(model => model.Posologia) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Prescritor) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Prescritor, new { @class = "textbox", style = "width:276px;" })%>
                <%: Html.ValidationMessageFor(model => model.Prescritor) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Especialidade) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Especialidade, new { @class = "textbox", style = "width:276px;" })%>
                <%: Html.ValidationMessageFor(model => model.Especialidade) %>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
