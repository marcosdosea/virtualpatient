<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ExperienciaMedicamentosModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>tb_experiencia_medicamentos</legend>

        <%: Html.HiddenFor(model => model.IdConsultaFixo) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaEsperaTratamento, "tb_resposta") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdRespostaEsperaTratamento", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaEsperaTratamento) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaPreocupacoes, "tb_resposta1") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdRespostaPreocupacoes", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaPreocupacoes) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaGrauEntendimento, "tb_resposta2") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdRespostaGrauEntendimento", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaGrauEntendimento) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaCultural, "tb_resposta3") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdRespostaCultural", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaCultural) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaComportamento, "tb_resposta4") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdRespostaComportamento", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.IdRespostaComportamento) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRespostaIncorporadoPlano, "tb_resposta5") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdRespostaIncorporadoPlano", String.Empty) %>
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
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
