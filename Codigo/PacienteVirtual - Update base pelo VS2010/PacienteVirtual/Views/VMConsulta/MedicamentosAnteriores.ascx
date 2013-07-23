<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.MedicamentosAnterioresModel>" %>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.medicamentos_anteriores %></legend>

        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>

        <%: Html.HiddenFor(model => model.IdMedicamento) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Indicacao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Indicacao) %>
            <%: Html.ValidationMessageFor(model => model.Indicacao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Resposta) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Resposta) %>
            <%: Html.ValidationMessageFor(model => model.Resposta) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Periodo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Periodo) %>
            <%: Html.ValidationMessageFor(model => model.Periodo) %>
        </div>


               <div class="form-actions"><input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" /> </div>

    </fieldset>
<% } %>

