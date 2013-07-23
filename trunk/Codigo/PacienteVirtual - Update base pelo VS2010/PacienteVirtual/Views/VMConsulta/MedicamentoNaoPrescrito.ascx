﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.MedicamentoNaoPrescritoModel>" %>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.medicamento_nao_prescrito %></legend>

        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>

        <%: Html.HiddenFor(model => model.IdMedicamento) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Fitoterapico) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Fitoterapico) %>
            <%: Html.ValidationMessageFor(model => model.Fitoterapico) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Dosagem) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Dosagem) %>
            <%: Html.ValidationMessageFor(model => model.Dosagem) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Posologia) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Posologia) %>
            <%: Html.ValidationMessageFor(model => model.Posologia) %>
        </div>

               <div class="form-actions"><input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" /> </div>
      
    </fieldset>
<% } %>

