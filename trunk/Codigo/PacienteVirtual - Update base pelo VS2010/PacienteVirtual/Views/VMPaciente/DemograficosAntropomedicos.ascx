<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DemograficosAntropometricosModel>" %>

<script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>DemograficosAntropometricosModel</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdConsultaFixo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdConsultaFixo) %>
            <%: Html.ValidationMessageFor(model => model.IdConsultaFixo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Nome) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Nome) %>
            <%: Html.ValidationMessageFor(model => model.Nome) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Genero) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Genero) %>
            <%: Html.ValidationMessageFor(model => model.Genero) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DataNascimento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DataNascimento) %>
            <%: Html.ValidationMessageFor(model => model.DataNascimento) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.MedicosAtendem) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.MedicosAtendem) %>
            <%: Html.ValidationMessageFor(model => model.MedicosAtendem) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.MoradiaFamilia) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.MoradiaFamilia) %>
            <%: Html.ValidationMessageFor(model => model.MoradiaFamilia) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.OndeAdquireMedicamentos) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.OndeAdquireMedicamentos) %>
            <%: Html.ValidationMessageFor(model => model.OndeAdquireMedicamentos) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdEscolaridade) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdEscolaridade) %>
            <%: Html.ValidationMessageFor(model => model.IdEscolaridade) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.EscolaridadeNivel) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.EscolaridadeNivel) %>
            <%: Html.ValidationMessageFor(model => model.EscolaridadeNivel) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdOcupacao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdOcupacao) %>
            <%: Html.ValidationMessageFor(model => model.IdOcupacao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.OcupacaoDescricao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.OcupacaoDescricao) %>
            <%: Html.ValidationMessageFor(model => model.OcupacaoDescricao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdPlanoSaude) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdPlanoSaude) %>
            <%: Html.ValidationMessageFor(model => model.IdPlanoSaude) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.PlanoSaudeNome) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.PlanoSaudeNome) %>
            <%: Html.ValidationMessageFor(model => model.PlanoSaudeNome) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>
