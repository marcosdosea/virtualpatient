<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ExperienciaMedicamentosModel>" %>

<script src="<%: Url.Content("~/Scripts/jquery-1.5.1.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>ExperienciaMedicamentosModel</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdConsultaFixo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdConsultaFixo) %>
            <%: Html.ValidationMessageFor(model => model.IdConsultaFixo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaEsperaTratamento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdRespostaEsperaTratamento) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaEsperaTratamento) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaPreocupacoes) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdRespostaPreocupacoes) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaPreocupacoes) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaGrauEntendimento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdRespostaGrauEntendimento) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaGrauEntendimento) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaCultural) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdRespostaCultural) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaCultural) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaComportamento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdRespostaComportamento) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaComportamento) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaIncorporadoPlano) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdRespostaIncorporadoPlano) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaIncorporadoPlano) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.AtencaoEsperaTratamento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.AtencaoEsperaTratamento) %>
            <%: Html.ValidationMessageFor(model => model.AtencaoEsperaTratamento) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.AtencaoPreocupacoes) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.AtencaoPreocupacoes) %>
            <%: Html.ValidationMessageFor(model => model.AtencaoPreocupacoes) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.AtencaoGrauEntendimento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.AtencaoGrauEntendimento) %>
            <%: Html.ValidationMessageFor(model => model.AtencaoGrauEntendimento) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.AtencaoCultural) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.AtencaoCultural) %>
            <%: Html.ValidationMessageFor(model => model.AtencaoCultural) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.AtencaoComportamento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.AtencaoComportamento) %>
            <%: Html.ValidationMessageFor(model => model.AtencaoComportamento) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>
