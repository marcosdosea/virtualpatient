<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.Consulta.QueixaMedicamentoModel>" %>

<% using (Html.BeginForm("Create", "QueixaMedicamento")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>QueixaMedicamentoModel</legend>
        
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdQueixa) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdQueixa) %>
            <%: Html.ValidationMessageFor(model => model.IdQueixa) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Queixa) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Queixa) %>
            <%: Html.ValidationMessageFor(model => model.Queixa) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdMedicamento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdMedicamento) %>
            <%: Html.ValidationMessageFor(model => model.IdMedicamento) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeMedicamento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeMedicamento) %>
            <%: Html.ValidationMessageFor(model => model.NomeMedicamento) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdSuspeitaPRM) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdSuspeitaPRM) %>
            <%: Html.ValidationMessageFor(model => model.IdSuspeitaPRM) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.SuspeitaPRM) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.SuspeitaPRM) %>
            <%: Html.ValidationMessageFor(model => model.SuspeitaPRM) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Dose) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Dose) %>
            <%: Html.ValidationMessageFor(model => model.Dose) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Desde) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Desde) %>
            <%: Html.ValidationMessageFor(model => model.Desde) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Necessario) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Necessario) %>
            <%: Html.ValidationMessageFor(model => model.Necessario) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Seguro) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Seguro) %>
            <%: Html.ValidationMessageFor(model => model.Seguro) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Efetivo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Efetivo) %>
            <%: Html.ValidationMessageFor(model => model.Efetivo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Cumprimento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Cumprimento) %>
            <%: Html.ValidationMessageFor(model => model.Cumprimento) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>
