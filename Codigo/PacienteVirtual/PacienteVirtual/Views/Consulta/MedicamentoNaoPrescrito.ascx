﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.MedicamentoNaoPrescritoModel>" %>
<% using (Html.BeginForm())
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend> <%: Resources.Mensagem.medicamento_nao_prescrito %></legend>
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
                </th>
            </tr>
            <% foreach (var item in ViewBag.MedicamentoNaoPrescrito as List<PacienteVirtual.Models.MedicamentoNaoPrescritoModel>)
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
                    <% using (Html.BeginForm())
                       { %>
                    <%: Html.ActionLink(Resources.Mensagem.remover, "RemoverMedicamentoNaoPrescrito", new { idConsultaV = item.IdConsultaVariavel, idMedicamento = item.IdMedicamento })%>
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
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>