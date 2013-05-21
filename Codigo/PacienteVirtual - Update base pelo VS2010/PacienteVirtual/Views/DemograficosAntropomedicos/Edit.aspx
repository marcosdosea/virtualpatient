<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DemograficosAntropometricosModel>" %>

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
        <legend>tb_demograficos_antropometricos</legend>

        <%: Html.HiddenFor(model => model.IdConsultaFixo) %>

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
            <%: Html.LabelFor(model => model.IdEscolaridade, "tb_escolaridade") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdEscolaridade", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.IdEscolaridade) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdOcupacao, "tb_ocupacao") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdOcupacao", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.IdOcupacao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdPlanoSaude, "tb_plano_saude") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdPlanoSaude", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.IdPlanoSaude) %>
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
