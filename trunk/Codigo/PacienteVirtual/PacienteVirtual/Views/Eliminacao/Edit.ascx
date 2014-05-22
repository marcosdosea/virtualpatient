<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.EliminacaoModel>" %>

<% using (Html.BeginForm("Edit","Eliminacao")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>tb_eliminacao</legend>

        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.UltimaEvacuacao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.UltimaEvacuacao) %>
            <%: Html.ValidationMessageFor(model => model.UltimaEvacuacao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.EvacuacoesDia) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.EvacuacoesDia) %>
            <%: Html.ValidationMessageFor(model => model.EvacuacoesDia) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.EsforcoEvacuar) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.EsforcoEvacuar) %>
            <%: Html.ValidationMessageFor(model => model.EsforcoEvacuar) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.FezesPastosas) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.FezesPastosas) %>
            <%: Html.ValidationMessageFor(model => model.FezesPastosas) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Melena) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Melena) %>
            <%: Html.ValidationMessageFor(model => model.Melena) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Diarreia) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Diarreia) %>
            <%: Html.ValidationMessageFor(model => model.Diarreia) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Constipacao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Constipacao) %>
            <%: Html.ValidationMessageFor(model => model.Constipacao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IncontinenciaFecal) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IncontinenciaFecal) %>
            <%: Html.ValidationMessageFor(model => model.IncontinenciaFecal) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Flatos) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Flatos) %>
            <%: Html.ValidationMessageFor(model => model.Flatos) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.SangramentoRetal) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.SangramentoRetal) %>
            <%: Html.ValidationMessageFor(model => model.SangramentoRetal) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Hemorroidas) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Hemorroidas) %>
            <%: Html.ValidationMessageFor(model => model.Hemorroidas) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.PruridoAnal) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.PruridoAnal) %>
            <%: Html.ValidationMessageFor(model => model.PruridoAnal) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.EstomasCirurgicos) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.EstomasCirurgicos) %>
            <%: Html.ValidationMessageFor(model => model.EstomasCirurgicos) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.FormasAbdomem) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.FormasAbdomem) %>
            <%: Html.ValidationMessageFor(model => model.FormasAbdomem) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.SonsIntestinais) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.SonsIntestinais) %>
            <%: Html.ValidationMessageFor(model => model.SonsIntestinais) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.TipoSonsPercussao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.TipoSonsPercussao) %>
            <%: Html.ValidationMessageFor(model => model.TipoSonsPercussao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.LocalizarPercussaoAbdominal) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.LocalizarPercussaoAbdominal) %>
            <%: Html.ValidationMessageFor(model => model.LocalizarPercussaoAbdominal) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.PalpacaoAbodminal) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.PalpacaoAbodminal) %>
            <%: Html.ValidationMessageFor(model => model.PalpacaoAbodminal) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ColoracaoUrinaria) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ColoracaoUrinaria) %>
            <%: Html.ValidationMessageFor(model => model.ColoracaoUrinaria) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Disuria) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Disuria) %>
            <%: Html.ValidationMessageFor(model => model.Disuria) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DebitoUrinario) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DebitoUrinario) %>
            <%: Html.ValidationMessageFor(model => model.DebitoUrinario) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Tempo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Tempo) %>
            <%: Html.ValidationMessageFor(model => model.Tempo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CondicaoContinenciaUrinaria) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CondicaoContinenciaUrinaria) %>
            <%: Html.ValidationMessageFor(model => model.CondicaoContinenciaUrinaria) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IrrigacaoVesicalCom) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IrrigacaoVesicalCom) %>
            <%: Html.ValidationMessageFor(model => model.IrrigacaoVesicalCom) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IrrigacaoVesicalDesde) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IrrigacaoVesicalDesde) %>
            <%: Html.ValidationMessageFor(model => model.IrrigacaoVesicalDesde) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.SVD) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.SVD) %>
            <%: Html.ValidationMessageFor(model => model.SVD) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.SVDInstalada) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.SVDInstalada) %>
            <%: Html.ValidationMessageFor(model => model.SVDInstalada) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Cistostomia) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Cistostomia) %>
            <%: Html.ValidationMessageFor(model => model.Cistostomia) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>
